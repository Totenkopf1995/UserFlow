# user_flow_back

This project is a RESTful API built with Ruby on Rails that allows for CRUD (Create, Read, Update, Delete) operations on users. The API is designed to be consumed by a frontend developed in Vue.js.

## Installation

### 1. Set Up RVM and Create a Gemset

Before cloning the repository, make sure you have RVM (Ruby Version Manager) installed. If you don't have it, you can install it by running:

```bash
\curl -sSL https://get.rvm.io | bash -s stable
```

Then, install the version of Ruby you need. For example:

```bash
rvm install 2.7.6
```

Create a gemset for the project:

```bash
rvm gemset create api_users
```

Use the created gemset:

```bash
rvm gemset use api_users
```

### 2. Clone the Repository

Clone the repository to your local machine:

```bash
git clone [your repository link]
cd repository-name
```

### 3. Install Dependencies

Install the required gems using Bundler:

```bash
bundle install
```

### 4. Set Up the Database

Create and migrate the database:

```bash
rails db:create
rails db:migrate
```

### 5. Start the Server

Start the Rails server:

```bash
rails server
```

The API will be available at `http://localhost:3000`.

## Endpoints

### Create a User

- **POST** `/users/`
  
**Request Body:**
```json
{
  "user": {
    "name": "pepe",
    "email": "pepe@example.com",
    "password": "mypass"
  }
}
```

### Get All Users

- **GET** `/users/`

### Get a Specific User

- **GET** `/users/:id`

### Update a User

- **PUT/PATCH** `/users/:id`
  
**Request Body:**
```json
{
  "user": {
    "name": "New User Name",
    "email": "new_email@example.com",
    "password": "new_pass"
  }
}
```

### Delete a User

- **DELETE** `/users/:id`

## Contributions

If you would like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/new-feature`).
3. Make your changes and commit (`git commit -m 'Add new feature'`).
4. Submit a pull request.
