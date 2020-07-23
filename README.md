# StyleX
A utility-first package that helps developers to style widgets like CSS variables. It also provides many utility functions e.g: padding, margin, shadow ..etc. The package is originally based on the same concept of `stylist` package but with extra features and some modifications.

### How does it work?
First, you create `StyleX` instance. You can have multiple `StyleX` instances, and then inject them all into one big `StyleX`.

```dart
var cardStyle = StyleX({
  "card-color": Color(0xFF129892),
  "card-border-radius": BorderRadius.circular(16.0),
  "card-border-color": "app-primary-color",
});

var appStyle = StyleX({
  "app-primary-color": Colors.blue.shade500,
})..inject(cardStyle)
```
Then, you apply your style in your app root using `StyleStore`.
```dart
return StyleStore(
  style: appStyle,
  child: MaterialApp(...),
);
```

Now you can use your style by calling `StyleStore.of(context)`.
```dart
final style = StyleStore.of(context);

// Automatically resolves the "app-primary-color" as a reference and gets the color.
final cardBorderColor = style.get("card-border-color");
```
