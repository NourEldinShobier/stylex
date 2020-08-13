import 'package:flutter/widgets.dart';
import 'package:stylex/stylex.dart';

class InteritedStyleStore extends InheritedWidget {
  const InteritedStyleStore({Key key, this.state, Widget child})
      : super(key: key, child: child);

  final _StyleStoreState state;

  @override
  bool updateShouldNotify(oldWidget) => true;
}

class StyleStore extends StatefulWidget {
  StyleStore({Key key, @required this.style, this.child})
      : assert(style != null),
        super(key: key);

  final StyleX style;
  final Widget child;

  _StyleStoreState createState() => _StyleStoreState();

  static StyleX of(BuildContext context) {
    final store =
        context.dependOnInheritedWidgetOfExactType<InteritedStyleStore>();
    return store.state?.currentStyle;
  }

  static void update(BuildContext context, StyleX style) {
    final store =
        context.dependOnInheritedWidgetOfExactType<InteritedStyleStore>();
    store.state.update(style);
  }
}

class _StyleStoreState extends State<StyleStore> {
  StyleX currentStyle;

  @override
  void initState() {
    super.initState();
    currentStyle = widget.style;
  }

  void update(StyleX style) {
    if (!identical(style, currentStyle)) setState(() => currentStyle = style);
  }

  @override
  Widget build(BuildContext context) {
    return InteritedStyleStore(state: this, child: widget.child);
  }
}
