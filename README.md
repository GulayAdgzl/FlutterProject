# 🚀 Flutter Project

[![GitHub Repository](https://img.shields.io/badge/GitHub-Repository-blueviolet?style=for-the-badge&logo=github)](https://github.com/yourusername/iwallet-project)
![Flutter 2.0+](https://img.shields.io/badge/Flutter-2.0+-blue?style=for-the-badge&logo=flutter)


iWallet Project is a feature-rich Flutter application for searching and viewing user details. It leverages REST APIs for data retrieval, utilizes the `provider` package for state management, and the `http` package for making HTTP requests.


![Screenshot ](https://github.com/GulayAdgzl/iWalletCase/assets/44726684/9f4cd1bf-ac8f-4266-afd4-648679717125)


## Features

- **User Search**: Users are fetched from the JSONPlaceholder API via HTTP request.
- **Filtered Display**: Users are filtered based on the characters entered in the "Search for Users" field, specifically by their username.
- **No User Found**: If no users match the search criteria, the message "User Not Found!" is displayed.
- **Clear Search**: Clearing all characters from the "Search for Users" field will display all users again.
- **Clear Button**: A button is provided to easily clear all characters entered in the search field, which will then display all users again.
- **User Images**: User profile images are fetched based on the "id" field from Picsum Photos via HTTP requests.
- **User Details Popup**: Clicking on a user in the list opens a popup displaying detailed user information.

## Installation

To run the iWallet Project on your local machine, follow these steps:

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/yourusername/iwallet-project.git

   git clone https://github.com/yourusername/iwallet-project.git
   cd iwallet-project
   flutter pub get
   flutter run

 ## 🚀 Usage

1. Launch the app.
2. In the search bar, enter the username of the user you want to find and press Enter.
3. Click on the user's name in the search results to view their detailed profile.


## 🌐 REST APIs

The  Project relies on external REST APIs for user data:

- **JSONPlaceholder API**: This API provides mock data for various resources, including users.
- **Picsum Photos**: User profile images are dynamically fetched from Picsum Photos. It offers random images for testing and development purposes.

## 📦 Dependencies

The application uses the following Flutter packages for various functionalities:

- **`provider`**: The `provider` package is employed for state management. It facilitates the management and sharing of user data and loading states across different components of the app, including the search feature.

- **`http`**: The `http` package is used to make HTTP requests to the JSONPlaceholder API and Picsum Photos. It enables the app to fetch user data and user profile images in real-time.

## 🖼️ Screenshots

![Adsız tasarım (10)](https://github.com/GulayAdgzl/FlutterProject/assets/44726684/92f51e0d-ffe4-4740-982d-f299bb6dcdd6)




## 🎉 Credits

- User data is provided by the JSONPlaceholder API.
- User profile images are fetched from Picsum Photos.





