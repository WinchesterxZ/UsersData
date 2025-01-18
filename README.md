# Employee Data App 👥

A Flutter application that displays and manages employee information with offline support.

## About 📱

This app fetches and displays employee data with features like caching and error handling. It shows employee details including their names, emails, profile pictures, and salaries.

## Getting Started 🚀

1. Ensure Flutter is installed
2. Clone this repository
3. Run `flutter pub get`
4. Launch with `flutter run`

## Features ✨

- View list of employees with profile pictures
- Display employee salaries and contact information
- Offline data access through caching
- Error handling and loading states
- Detailed employee view on tap
- Responsive image loading with fallbacks

## Technical Implementation 🛠️

### Dependencies
- **Dio**: HTTP client for API requests
- **Shared Preferences**: Local data caching
- **Flutter**: UI framework and widgets

### Key Features
- **API Integration**: Fetches employee data from a REST API
- **Caching System**: 
  - Stores employee data locally
  - Checks cache before making network requests
  - Provides offline functionality
- **Error Handling**:
  - Network error management
  - Image loading fallbacks

## Screenshots

![Screenshot_1737182088](https://github.com/user-attachments/assets/7d3bc58e-8335-4c59-84ed-707de0a5741e)
![Screenshot_1737182083](https://github.com/user-attachments/assets/9e5b7035-d56f-481f-ab6a-912f5ae6507f)

