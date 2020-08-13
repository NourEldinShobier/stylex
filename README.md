# StyleX

A utility-first package that helps Flutter developers to style widgets like CSS variables. It also provides many functions e.g: padding, margin, shadow ..etc. The package is inspired by `stylist` package but with extra features and some modifications.

### How does it work?

1. Create your `StyleX` instance. You can have multiple `StyleX` instances, and then inject them all into one big `StyleX`.

```dart
final textFieldStyle = StyleX({
  "text-field-background-color": '#00D68F',
  "text-field-border-radius": borderRadius(all: 16),
  "text-field-padding": padding(horizontal: 16, vertical: 8),
  "text-field-border-color": "app-primary-color",
});

final appStyle = StyleX({
  "app-primary-color": '#3366FF',
})
  ..inject(textFieldStyle);
```

2. Then, you apply your style in your app root using `StyleStore`.

```dart
return StyleStore(
  style: appStyle,
  child: MaterialApp(...),
);
```

Now you need to consume your style like this:

```dart
final style = context.style;
// OR
final style = StyleStore.of(context);

final cardBorderColor = style.get<Color>("card-border-color");
```

To update your style:

```dart
context.style = style;
// OR
StyleStore.update(context, style);
```

### More Details

1. Use `clone` method to clone your style.

2. Use `filter` method to extract a specific style class:

```dart
final textFieldStyle = StyleX({
  "text-field-background-color": '#00D68F',
  "text-field-border-radius": borderRadius(all: 16),
  "text-field-padding": padding(horizontal: 16, vertical: 8),
  "text-field-border-color": "app-primary-color",
});

Map<String, dynamic> classStyle = textFieldStyle.filter('text-field');
```
