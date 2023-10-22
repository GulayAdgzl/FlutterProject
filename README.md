<h1 align="center">🚀 iWallet Project</h1>

<p align="center">
  <a href="https://github.com/yourusername/iwallet-project">
    <img src="https://img.shields.io/badge/GitHub-Repository-blueviolet?style=for-the-badge&logo=github" alt="GitHub Repository">
  </a>
  <img src="https://img.shields.io/badge/Flutter-2.0+-blue?style=for-the-badge&logo=flutter" alt="Flutter 2.0+">
  <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="License MIT">
</p>

<p align="center">
  📱 iWallet Project is a feature-rich Flutter application for searching and viewing user details. It leverages REST APIs for data retrieval, utilizes the <code>provider</code> package for state management, and the <code>http</code> package for making HTTP requests.
</p>

<p align="center">
  <img src="screenshots/screenshot1.png" alt="Screenshot 1" width="250">
  <img src="screenshots/screenshot2.png" alt="Screenshot 2" width="250">
</p>

## 📋 Table of Contents

- [🚀 Features](#features)
- [🚀 Installation](#installation)
- [🚀 Usage](#usage)
- [🌐 REST APIs](#rest-apis)
- [📦 Dependencies](#dependencies)
- [🖼️ Screenshots](#screenshots)
- [🤝 Contributing](#contributing)
- [🎉 Credits](#credits)

## 🚀 Features

- **User Search**: The app allows users to search for other users by their usernames.
- **User Details**: Clicking on a user's name provides an in-depth view, including their name, username, email, phone, address, company, and geographical location.

## 🚀 Installation

To run the **iWallet Project** on your local machine, follow these steps:

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/yourusername/iwallet-project.git
   cd iwallet-project
   flutter pub get
   flutter run

 ## 🚀 Usage

1. Launch the app.
2. In the search bar, enter the username of the user you want to find and press Enter.
3. Click on the user's name in the search results to view their detailed profile.


## 🌐 REST APIs

The iWallet Project relies on external REST APIs for user data:

- **JSONPlaceholder API**: This API provides mock data for various resources, including users.
- **Picsum Photos**: User profile images are dynamically fetched from Picsum Photos. It offers random images for testing and development purposes.

## 📦 Dependencies

The application uses the following Flutter packages for various functionalities:

- **`provider`**: The `provider` package is employed for state management. It facilitates the management and sharing of user data and loading states across different components of the app, including the search feature.

- **`http`**: The `http` package is used to make HTTP requests to the JSONPlaceholder API and Picsum Photos. It enables the app to fetch user data and user profile images in real-time.

## 🖼️ Screenshots

- **Screenshot 1:**
  ![Screenshot 1](screenshots/screenshot1.png)

- **Screenshot 2:**
  ![Screenshot 2](screenshots/screenshot2.png)

## 🤝 Contributing

Contributions are welcome! If you would like to contribute to this project, please check the [Contributing Guidelines](CONTRIBUTING.md).

## 🎉 Credits

- User data is provided by the JSONPlaceholder API.
- User profile images are fetched from Picsum Photos.





