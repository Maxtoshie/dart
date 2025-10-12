# Study Planner App

## Overview
The Study Planner App is a Flutter-based mobile application designed to help users manage their study tasks efficiently. This project, developed for Individual Assignment 1 (due October 12, 2025), includes features such as task management, a calendar view, a reminder system, local storage, navigation between screens, and customizable settings. The app adheres to Material Design principles and ensures data persistence using SharedPreferences.

## Features
- **Task Management**: Create tasks with a title, optional description, required due date, and optional reminder time. Includes bonus features to edit or delete tasks.
- **Calendar View**: Displays a monthly calendar with highlighted dates containing tasks. Tapping a date shows the associated tasks.
- **Reminder System**: Simulates reminders with a pop-up alert when the app is opened, based on set reminder times (if enabled).
- **Local Storage**: Persists tasks using SharedPreferences, storing them as JSON for reliability across app restarts.
- **Navigation**: Implements a BottomNavigationBar with three screens: Today, Calendar, and Settings.
- **Settings**: Allows toggling reminders and displays the storage method (SharedPreferences).

## Project Structure
The project is organized into a modular structure to separate UI from logic, enhancing readability and maintainability:
- **`lib/`**:
  - **`models/`**: Contains the `task.dart` file defining the `Task` class for task data structure.
  - **`screens/`**: Houses UI components:
    - `home_screen.dart`: Manages the main navigation and screen switching.
    - `today_screen.dart`: Displays tasks due today.
    - `calendar_screen.dart`: Implements the monthly calendar view.
    - `add_task_screen.dart`: Handles task creation and editing.
    - `settings_screen.dart`: Provides settings options.
  - **`services/`**: Includes `task_service.dart` for business logic and data persistence.
  - **`main.dart`**: The app entry point and root widget configuration.
- **`pubspec.yaml`**: Defines project metadata, dependencies (e.g., `shared_preferences`, `intl`), and Flutter settings.
- **`README.md`**: This file, providing project documentation.

## Prerequisites
- **Flutter SDK**: Version 3.0.0 or later (check with `flutter --version`).
- **Dart**: Included with Flutter.
- **IDE**: Visual Studio Code or Android Studio with Flutter and Dart plugins.
- **Emulator/Device**: Android emulator or physical Android/iOS device for testing.

## Installation
1. **Clone the Repository**:
   ```bash:disable-run
   git clone git@github.com:Maxtoshie/dart.git
   cd study_planner_app
   ```
2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```
3. **Set Up Emulator/Device**:
   - Ensure an Android emulator is running (e.g., via Android Studio) or connect a physical device.
   - Verify with `flutter devices`.
4. **Run the App**:
   ```bash
   flutter run
   ```

## Usage
- **Add a Task**: Tap the "New Task" floating action button on the Today or Calendar screen, fill in the details, and save.
- **View Tasks**: Switch to the Today screen for current tasks or use the Calendar screen to select a date.
- **Edit/Delete Tasks**: Long-press a task or use the edit/delete icons on the Today or Calendar screens.
- **Set Reminders**: Add a reminder time when creating a task; enable reminders in Settings to see pop-ups on app open.
- **Configure Settings**: Navigate to the Settings screen to toggle reminders or view storage info.

## Architecture
- **MVC Pattern**: The app loosely follows a Model-View-Controller pattern:
  - **Model**: `Task` class in `models/task.dart` defines task data.
  - **View**: `screens/` files handle UI rendering.
  - **Controller**: `task_service.dart` manages data operations and logic.
- **State Management**: Uses setState for simple state changes within screens.
- **Persistence**: `TaskService` handles saving and loading tasks to SharedPreferences.

## Dependencies
- `shared_preferences: ^2.3.2` - For local storage.
- `intl: ^0.19.0` - For date formatting.

## Testing
- Test on an Android emulator or physical device.
- Verify task persistence by closing and reopening the app.
- Ensure UI responsiveness in both portrait and landscape orientations.

## Contributing
This project was developed for an academic assignment and is not open for public contributions. However, feel free to fork and adapt for personal use.

## License
No formal license is applied, as this is an educational project. Use is restricted to assignment purposes.

## Acknowledgments
- Flutter Official Documentation for widget references.

## Contact
For questions, contact me via email: m.okoth@alustudent.com or raise an issue in the GitHub repository.
