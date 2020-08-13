import 'dart:collection';
import 'dart:ui';

abstract class IStyleX {
  I get<I>(String key);
  set(String key, dynamic value);
}

class StyleX implements IStyleX {
  Map<String, dynamic> _data;

  StyleX(Map<String, dynamic> data)
      : this._data = _StyleXHandler.handleNewData(data: data);

  factory StyleX.empty() => StyleX({});

  @override
  set(String key, value) => _data[key] = value;

  @override
  I get<I>(String key) {
    return _StyleXHandler.handleValue(style: this, value: _data[key]);
  }

  Map<String, dynamic> clone() => Map.from(_data);

  Map<String, dynamic> filter(String key) {
    return Map<String, dynamic>.from(_data)
      ..removeWhere((k, v) => !k.startsWith(key));
  }

  void inject(StyleX other) => this._data.addAll(other._data);
  void clear() => this._data.clear();

  void replaceAll(StyleX style) {
    this._data.clear();
    this._data.addAll(style._data);
  }
}

class _StyleXHandler {
  static Map<String, dynamic> handleNewData({
    Map<String, dynamic> data,
  }) {
    return data.map((key, value) {
      var newValue = value;
      newValue = _ValueUtils.convertToColorFromString(value) ?? newValue;
      return MapEntry(key, newValue);
    });
  }

  static handleValue({StyleX style, dynamic value}) {
    if (value is String)
      return style.get(value) ?? value;
    else if (value is dynamic Function(StyleX))
      return value(style);
    else
      return value;
  }
}

class _ValueUtils {
  static Color convertToColorFromString(dynamic value) {
    if (value is String && value.length == 7 && value.startsWith('#')) {
      final intValue = int.parse(value.substring(1), radix: 16);
      return Color(intValue).withOpacity(1.0);
    }

    return null;
  }
}
