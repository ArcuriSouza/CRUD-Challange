# People CRUD

This project is a simple CRUD (Create, Read, Update, Delete) application for managing people and their associated addresses. Each person has one address that belongs to them.

## Technologies Used

- **Ruby**: 3.4.1
- **Rails**: 8.0.2
- **RSpec**: For testing
- **PostgreSQL**: Database
- **Stimulus**: JavaScript library
- **Tailwind CSS**: Styling framework

## Setup Instructions

Clone the repository and navigate to the project directory:

```bash
git clone https://github.com/yourusername/yourproject.git
cd yourproject
```

Ensure you have the required Ruby version (3.4.1). You can use a version manager like `rbenv` or `rvm`. Then install dependencies:

```bash
bundle install
```

Configure your `config/database.yml` with the correct database credentials. Example for PostgreSQL:

```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: 127.0.0.1
  username: your_username
  password: your_password


development:
  <<: *default
  database: crud_challange_development

test:
  <<: *default
  database: crud_challange_test
```

Set up the database:

```bash
rails db:create db:migrate
```

Start the development server:

```bash
bin/dev
```

Run the tests:

```bash
bundle exec rspec
```

## Usage

- **Create a person**: Add a new person with an address.
- **Read people**: View the list of all people.
- **Update a person**: Edit a person’s details and address.
- **Delete a person**: Remove a person and their associated address.
