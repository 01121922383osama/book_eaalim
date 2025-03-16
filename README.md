<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=600&size=30&pause=1000&color=22C55E&center=true&vCenter=true&width=435&lines=%F0%9F%93%9A+BookWise+%F0%9F%93%96;Offline+PDF+Reader;Hive+%7C+BLoC+%7C+Flutter" alt="Animated Header">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.19.3-blue?style=for-the-badge&logo=flutter">
  <img src="https://img.shields.io/badge/Hive-2.2.3-orange?style=for-the-badge&logo=hive">
  <img src="https://img.shields.io/badge/Null%20Safety-✅-brightgreen?style=for-the-badge">
</p>

---

## 📚 Features
- 🔍 **Smart PDF Search** - Find text in documents instantly
- 📂 **Local Storage** - Hive-based book management
- 🌗 **Dark/Light Theme** - Automatic system theme detection
- 🚀 **Fast Performance** - Smooth PDF rendering
- 📖 **Reading Progress** - Track your reading position
- 🔒 **Offline Access** - No internet required
- 🗂️ **Book Organization** - Categorize by collections

---

## 🎥 Live Demo
<p align="center">
  <img src="Readme/record.gif" width="300" alt="App Demo">
</p>

---

## 📸 Screenshots Gallery

| Home Screen | Book Shelf | PDF Viewer |
|-------------|------------|------------|
| <img src="Readme/home.png" width="250"> | <img src="Readme/books.png" width="250"> | <img src="Readme/view_pdf.png" width="250"> |

| Navigation Drawer | Settings | PDF Search |
|-------------------|----------|------------|
| <img src="Readme/drawer.png" width="250"> | <img src="Readme/settings.png" width="250"> | <img src="Readme/search_pdf.png" width="250"> |

---

## 🏗 Architecture
```dart
📁 lib/
├── 📁 core/
│   ├── 📁 constants/
│   ├── 📁 utils/
│   └── 📁 themes/
├── 📁 data/
│   ├── 📁 datasources/  # Hive operations
│   ├── 📁 models/       # Book models
│   └── 📁 repositories/
├── 📁 presentation/
│   ├── 📁 bloc/         # BLoC states & events
│   ├── 📁 views/        # Screens
│   └── 📁 widgets/      # Reusable components
└── 📁 services/
     └── pdf_loader.dart