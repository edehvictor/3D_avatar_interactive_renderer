# 3D Model Viewer

A cross-platform Flutter application that allows users to view and control two 3D models simultaneously. The application supports mobile, web, and desktop platforms, featuring interactive controls and animations for 3D models.

## 🌟 Features

- **Cross-Platform Support**
  - Mobile (iOS, Android)
  - Desktop (Windows, macOS, Linux)
  - Web support

- **3D Model Viewing**
  - Dual model display
  - Interactive camera controls
  - Models facing each other
  - Touch and mouse gesture support

- **Animation Controls**
  - Play/Pause animations
  - Reset functionality
  - Animation selection
  - Custom animation timing

- **User Interface**
  - Responsive design
  - Platform-specific optimizations
  - Elegant control panels
  - Intuitive interaction

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest version)
- Dart SDK (latest version)
- For desktop development:
  - Windows: Visual Studio with C++ development tools
  - macOS: Xcode
  - Linux: Clang, CMake, and required dependencies

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/3d-model-viewer.git
cd 3d-model-viewer
```

2. Get dependencies:
```bash
flutter pub get
```

3. Enable desktop support (if needed):
```bash
flutter config --enable-windows-desktop
flutter config --enable-macos-desktop
flutter config --enable-linux-desktop
```

### Running the Application

For mobile:
```bash
flutter run
```

For desktop platforms:
```bash
# Windows
flutter run -d windows

# macOS
flutter run -d macos

# Linux
flutter run -d linux
```

## 📁 Project Structure

```
lib/
  ├── main.dart
  ├── screens/
  │   └── model_render.dart
  ├── widgets/
  │   └── control_panel.dart
  └── utils/
      └── constants.dart

assets/
  └── images/
      └── business_man.glb
```

## 🎮 Controls

### Desktop Controls
- **Left Click + Drag**: Rotate model
- **Right Click + Drag**: Pan model
- **Mouse Wheel**: Zoom in/out
- **Keyboard Shortcuts**:
  - Space: Play/Pause animation
  - R: Reset animation
  - ESC: Exit fullscreen

### Mobile Controls
- **Single Finger Drag**: Rotate model
- **Two Finger Drag**: Pan model
- **Pinch**: Zoom in/out

## 🛠 Configuration

### Model Loading
Place your .glb files in the `assets/images/` directory and update the `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/images/
```

### Custom Model Configuration
In `model_render.dart`, update the model source:

```dart
String srcGlb1 = 'assets/images/your_model.glb';
```

## 📱 Platform-Specific Notes

### Windows
- Minimum OS: Windows 7 SP1 or later
- Required: Visual C++ runtime

### macOS
- Minimum OS: macOS 10.11
- Required: Xcode 11 or later

### Linux
- Required packages:
  ```bash
  sudo apt-get install clang cmake ninja-build pkg-config libgtk-3-dev
  ```

### Mobile
- iOS: iOS 11 or later
- Android: API level 21 or later

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch:
   ```bash
   git checkout -b feature/AmazingFeature
   ```
3. Commit your changes:
   ```bash
   git commit -m 'Add some AmazingFeature'
   ```
4. Push to the branch:
   ```bash
   git push origin feature/AmazingFeature
   ```
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter Team for the amazing framework
- flutter_3d_controller package creators
- The Flutter community for their continuous support

## 📞 Support

For support, email your-email@example.com or open an issue in the repository.

## 🚧 Known Issues

- Animation timing might vary on different platforms
- Some 3D m
