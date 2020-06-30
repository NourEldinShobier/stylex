import 'package:flutter/widgets.dart';
import 'package:stylex/stylex.dart';

class StyleStore extends InheritedWidget {
  StyleStore({
    Key key,
    @required this.child,
    @required this.data,
  }) : super(key: key, child: child);

  final StyleX data;
  final Widget child;

  static StyleX of(BuildContext context) {
    final style = context.dependOnInheritedWidgetOfExactType<StyleStore>();
    return style?.data;
  }

  @override
  bool updateShouldNotify(StyleStore oldWidget) {
    return !identical(data, oldWidget.data);
  }
}
