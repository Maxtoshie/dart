# Flutter View Widgets Demo

This project demonstrates several core Flutter layout and scrolling widgets: `Row`, `Column`, `ListView`, `GridView`, `Stack`, and `Wrap`.
Each section of the app shows how these widgets arrange and display items in different ways.

---

## Widget(s) Demonstrated

1. **Row** – places child widgets horizontally in one line.
2. **Column** – stacks child widgets vertically.
3. **ListView** – displays a scrollable list of widgets.
4. **GridView** – displays widgets in a scrollable grid format.
5. **Stack** – overlays widgets on top of one another.
6. **Wrap** – automatically wraps widgets to the next line when space runs out.

---

## Real-World Use Case

The app serves as a simple gallery demonstration, showing how the same image set can be displayed using different layout types:

* A Row for featured items displayed side by side.
* A Column for vertically stacked content.
* A ListView for scrollable lists.
* A GridView for image grids or product thumbnails.
* A Stack for overlaying text or effects on images.
* A Wrap for flexible layouts that adapt to available space.

---

## How to Run

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/flutter_views.git
   cd flutter_views
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the application:

   ```bash
   flutter run
   ```

Make sure your `pubspec.yaml` includes:

```yaml
flutter:
  assets:
    - assets/images/
```

---

## Widget Attributes Explained

Three key widget attributes demonstrated in this project:

### 1. Row → mainAxisAlignment

Defines how child widgets are positioned horizontally inside the Row.
Example:

```dart
Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [...])
```

This evenly spaces the widgets across the available horizontal space.

### 2. GridView → crossAxisCount

Determines how many columns the grid will display.
Example:

```dart
GridView.count(crossAxisCount: 3)
```

Changing the number affects how many items appear in a single row.

### 3. Stack → alignment

Controls how child widgets are aligned within the Stack.
Example:

```dart
Stack(alignment: Alignment.center, children: [...])
```

This centers the overlapping widgets.

---

## Screenshots
![Flutter Image One](assets/images/Flutter%20views%20%20One.png)
![Flutter Image Two](assets/images/Flutter%20Views%20Two.png)
![Flutter Image Three](assets/images/Flutter%20Views%20Three.png)


---

## Presentation Information

* **Presentation Date:** September 30, 2025
* **Assignment:** Widget Presentation (Flutter Views)

---

## Notes

* Developed using Flutter 3.x and Dart.
* All image files are stored in `assets/images/`.
* This project is for demonstration and educational purposes.
* Code references and structure are inspired by official Flutter documentation examples.
