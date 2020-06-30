import 'dart:ui';

class StyleX {
  final Map<String, dynamic> _data;

  StyleX(Map<String, dynamic> data)
      : this._data = _StyleXHandler.handleNewData(data: data);

  factory StyleX.empty() => StyleX({});

  set(String key, dynamic value) => _data[key] = value;

  get(String key) => _StyleXHandler.handleValue(style: this, value: _data[key]);

  StyleX fork() => StyleX(Map.from(_data));

  void replaceAll(StyleX style) {
    this._data.clear();
    this._data.addAll(style._data);
  }

  void inject(StyleX other) => this._data.addAll(other._data);
}

class _StyleXHandler {
  static Map<String, dynamic> handleNewData({Map data}) {
    return data.map((key, value) {
      var newValue = value;
      newValue = _ValueUtils.convertToColorFromString(value) ?? newValue;
      return MapEntry(key, newValue);
    });
  }

  static handleValue({StyleX style, dynamic value}) {
    if (value is String) {
      return style.get(value) ?? value;
    } else if (value is dynamic Function(StyleX)) {
      return value(style);
    } else {
      return value;
    }
  }
}

class _ValueUtils {
  static Color convertToColorFromString(dynamic value) {
    if (value is String && value.length == 7 && value[0] == '#') {
      final intValue = int.parse(value.substring(1), radix: 16);
      return Color(intValue).withOpacity(1.0);
    }
    return null;
  }
}
