# NotifiQ

NotifiQ is a Queue Management based web application built with Ruby on Rails.

# Technology Stack

NotifiQ is built using the following technologies:

- Ruby on Rails - A popular web framework for building web applications.
- PostgreSQL - A powerful and open-source relational database management system.
- Bootstrap - A CSS framework for building responsive and mobile-first websites.
- Twilio - A cloud communications platform for building SMS, voice, and messaging applications.

## Features

- User authentication system with devise gem
- Queue management for customers
- Live updates for customers through ActionCable
- Queue management for staff
- Staff dashboard for real-time updates on customer queue
- Admin dashboard for managing staff and queues

## Getting Started

To get started with NotifiQ, clone the repository and run the following commands:

bundle install
rails db:install
rails db:migrate
rails db:seed
rails server

After starting the server, visit http://localhost:3030/ in your browser to access NotifiQ.

## Dependencies

- Ruby 2.7.7
- Rails 6.0.3.5
- Devise gem for user authentication
- Bootstrap gem for styling
- ActionCable for live updates

## Configuration

To configure NotifiQ, edit the `config/database.yml` file to set up your database configuration. Additionally, you can customize the app's behavior by modifying the code in the relevant controllers, models, and views.

## Contributing

Contributions to NotifiQ are welcome and appreciated! If you'd like to contribute, please fork the repository and submit a pull request with your changes. Be sure to include a clear description of your changes and any relevant test coverage.

## License

NotifiQ is licensed under the MIT license. See LICENSE.txt for more information.
