# user_flow_front

This project is a Vue.js frontend designed to interact with a Ruby on Rails RESTful API for user management. It includes three main views: Registration, User List, and Update User.

## Installation

### 1. Set Up NVM and Install Node.js

Before cloning the repository, make sure you have NVM (Node Version Manager) installed. If you don't have it, you can install it by following the instructions in the [NVM GitHub repository](https://github.com/nvm-sh/nvm).

Once NVM is installed, you can install the required version of Node.js. For example:

```bash
nvm install 14
```

Use the installed version:

```bash
nvm use 14
```

### 2. Clone the Repository

Clone the repository to your local machine:

```bash
git clone [your repository link]
cd repository-name
```

### 3. Install Dependencies

Install the required packages using npm:

```bash
npm install
```

### 4. Run the Development Server

Start the Vue.js development server:

```bash
npm run serve
```

The application will be available at `http://localhost:8080`.

## Views

### Registration View

This view allows users to register by providing their name, email, and password. It sends a POST request to the API to create a new user.

### User List View

This view displays a list of all registered users. It fetches data from the API and presents it in a user-friendly format.

### Update User View

This view enables users to update their information. It retrieves the current user data from the API and allows modifications before sending an updated request.

## Contributions

If you would like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/new-feature`).
3. Make your changes and commit (`git commit -m 'Add new feature'`).
4. Submit a pull request.
