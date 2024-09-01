class Memory {
  static const operations = const [
    '%',
    '/',
    'X',
    '-',
    '+',
    '=',
  ];

  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  late String _operation;
  String _value = '0';
  bool _clearValue = false;

  void applyCommand(String command) {
    if (command == 'AC') {
      clear();
    } else if (operations.contains(command)) {
      _setCalculo(command);
    } else {
      _addValue(command);
    }
  }

  _setCalculo(String newCalculo) {
    bool isEqualSign = newCalculo == '=';

    if (_bufferIndex == 0) {
      if (!isEqualSign) {
        _operation = newCalculo;
        _bufferIndex = 1;
      }
      _clearValue = true;
    } else {
      _buffer[0] = _calculation();
      _buffer[1] = 0.0;
      _value = _buffer[0].toString();
      _value = _value.endsWith(',0') ? _value.split(',')[0] : _value;

      _operation = isEqualSign ? '' : newCalculo;
      _bufferIndex = isEqualSign ? 0 : 1;
    }
    _clearValue = true;
  }

  _addValue(String value) {
    // Substituir 0 ao digitar um numero com a condicao de nao ser ,
    final isComma = value == ',';
    final clearValue = (_value == '0' && !isComma) || _clearValue;

    if (isComma && _value.contains(',') && !clearValue) ;

    final emptyValue = isComma ? '0' : '';
    final currentValue = clearValue ? emptyValue : _value;
    final valueCurrent = clearValue ? '' : _value;
    _value = valueCurrent + value;
    _clearValue = false;

    // validacao da convercao de valores
    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
    print(_buffer);
  }

  clear() {
    _value = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    _bufferIndex = 0;
    _operation = '';
    _clearValue = false;
  }

  _calculation() {
    switch (_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'X':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0];
    }
  }

  String get value {
    return _value;
  }
}
