# Book API

A robust RESTful API for managing table booking operations, built with Node.js and Express.

## 📋 Prerequisites

- Node.js (v14 or higher)
- MySQL database
- npm or yarn package manager

## 🛠️ Installation

1. Clone the repository:
```bash
git clone <your-repository-url>
cd book-api
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file in the root directory with the following variables:
```env
NODE_ENV=development
PORT=3000
DB_HOST=localhost
DB_USER=your_username
DB_PASSWORD=your_password
DB_NAME=your_database_name
JWT_SECRET=your_jwt_secret
```

4. Import the database schema:
```bash
mysql -u your_username -p your_database_name < nroda21b_db1.sql
```

## 🏃‍♂️ Running the Application

### Development Mode
```bash
npm start
```

### Production Mode
```bash
NODE_ENV=production npm start
```
