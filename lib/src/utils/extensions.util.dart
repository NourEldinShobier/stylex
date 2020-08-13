import 'package:flutter/material.dart';
import 'package:stylex/stylex.dart';

extension StyleContextExtension on BuildContext {
  StyleX get style {
    return StyleStore.of(this);
  }

  set(StyleX styleX) => StyleStore.update(this, style);
}
