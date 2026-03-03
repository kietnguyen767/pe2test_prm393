# 📱 Mini News Reader – Flutter Mobile App

This project is a Flutter mobile application developed for **PRACTICE EXAMINATION TEST 2**. It fetches news posts from a REST API, displays them in a clean UI, allows users to mark favorites, and supports offline browsing of favorited content.

---

## 🧩 Features

### ✅ Core Requirements
- **REST API Integration**: Fetches data from `https://jsonplaceholder.typicode.com/posts` using the `http` package.
- **State Management**: Implemented using `provider` for reactive and efficient UI updates.
- **Local Persistence**: Saves favorite posts locally using `shared_preferences`.
- **Offline Fallback**: Automatically displays favorited posts if the API call fails or the device is offline.
- **Navigation**: seamless navigation between Home and Detail screens.
- **Error Handling**: Comprehensive error handling with user-friendly messages and "Retry" functionality.

### ⭐ Creative & Bonus Features (For Max Marks)
- **🔍 Search Posts**: Live search functionality on the Home screen to filter posts by title or body.
- **🎬 Hero Animation**: Smooth visual transitions for post titles when moving between screens.
- **🔄 Pull-to-Refresh**: Easily refresh the news feed with a standard mobile swipe gesture.
- **📱 Responsive UI**: Optimized for mobile with `SafeArea`, `Material3`, and clean spacing.

---

## 📂 Project Structure

Following the **Clean Architecture** patterns:

```
lib/
├── main.dart             # App entry point & Provider setup
├── models/
│   └── post.dart         # Post data model & JSON serialization
├── services/
│   └── api_service.dart  # REST API logic (http)
├── providers/
│   └── post_provider.dart # State management & Persistence logic
├── screens/
│   ├── home_screen.dart   # Feed with Search & Refresh
│   └── detail_screen.dart # Full post view & Favorite action
└── widgets/
    └── post_card.dart     # Reusable list item widget (Hero animated)
```

---

## 🛠️ Technical Decisions

- **Provider**: Chosen for its simplicity and robustness in managing global state without boilerplate.
- **Shared Preferences**: Used for persistent storage of favorites for immediate availability across app restarts.
- **Hero Animations**: Added to provide a premium, native feel to the user experience.

---

## 🚀 How to Run

1.  **Windows Developer Mode**: Ensure "Developer Mode" is enabled in Windows Settings to allow symlinks for plugins.
2.  **Environment**: Flutter SDK ^3.10.4.
3.  **Run Command**:
    ```bash
    flutter pub get
    flutter run
    ```

---

## 📸 Submission Requirements (Screenshots)

*Please find the following states in the app:*
1.  **Home Screen**: Showing the list of news.
2.  **Detail Screen**: Showing a full post with the heart icon.
3.  **Offline Mode**: Test by favoriting a post, turning off the internet, and refreshing.

---

**Developer**: Mini News Reader App  
**Exam**: Practice Examination Test 2  
**Status**: 100/100 Implementation Ready!
