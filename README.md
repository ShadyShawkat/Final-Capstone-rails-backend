![](https://img.shields.io/badge/Microverse-blueviolet)
# Microvago API

> This is a Rails API app that is consumed by the Microvago web app to reserve hotel rooms all around the globe

## Built With
- Ruby on Rails
- Rubocop
- Heroku
- JWT
- RSpec
- Rswag
- PostgreSQL

## Install

- Install Ruby based on your OS from [HERE](https://www.ruby-lang.org/en/downloads/)

## Setup

1. Clone the project using git-bash or Githup Desktop. 
~~~bash
git clone https://github.com/ShadyShawkat/Final-Capstone-rails-backend.git
~~~
OR
~~~bash
git@github.com:ShadyShawkat/Final-Capstone-rails-backend.git
~~~
2. Open the project folder with VSCode or any Editor.
3. Open terminal and navigate to the project folder.
4. Make sure that your PostgreSQL server is running and you have the ability to establish connection with the database.
5. Create a new file called `local_env.yml` in the folder `config/` and paste the following code in it:
  > `PG_USERNAME: "YourPostgresUsername"`<br> `PG_PASSWORD: "YourPostgresPassword"` <br> `GMAIL_USERNAME: "YourGmailSenderUsername"`<br> `GMAIL_PASS: "YourGmailSenderPassword"`<br>
  > Note:<br> You can use your own gmail account to send emails but first you have to configure 2-Step Authorization and after that you have to configure
  > an APP Password for this specific application. If you want more information about this, GOOGLE IT.
6. Execute `rails db:create` to create the database.
7. Execute `rails db:migrate` to migrate the database.
8. Execute `rails db:seed` to migrate the database.
9. Run `gem install`, `bundle install` and `npm install` to install all of the project's required dependencies.
10. Run `rails s` to start the project's live server and take a look at the terminal to see the URL address it is running on.
11. If you want to run some unit tests, all you need to do is run the `rspec` command on your terminal after [installing](https://github.com/rspec/rspec-rails) `rspec-rails`

## Authors

👤 **Luis Abarca**

- GitHub: [TheLuisAbarca](https://github.com/TheLuisAbarca)
- Twitter: [@TheLuisAbarca](https://twitter.com/TheLuisAbarca)
- LinkedIn: [Luis Anghelo Abarca Villacis](https://www.linkedin.com/in/techadvisor-luis-abarca/)

👤 **Mihreteab Misganaw**

- GitHub: [Mre55](https://github.com/Mre55)
- Twitter: [@MreMisganaw](https://twitter.com/MreMisganaw)
- LinkedIn: [Mihreteab Aride](https://www.linkedin.com/in/mihreteabaride/)

👤 **Omar Muhammad**

- GitHub: [Omar-Muhamad](https://github.com/Omar-Muhamad)
- Twitter: [@Eng_OmarMuhamad](https://twitter.com/Eng_OmarMuhamad)
- LinkedIn: [@eng-omarmuhammad](https://www.linkedin.com/in/eng-omarmuhammad/)

👤 **Shady Shawkat**

- GitHub: [ShadyShawkat](https://github.com/ShadyShawkat)
- Twitter: [@ShadyShawkat3](https://twitter.com/ShadyShawkat3)
- LinkedIn: [Shady Shawkat](https://linkedin.com/in/Shady-Shawkat)

👤 **Santiago Velosa**

- GitHub: [vechicin](https://github.com/vechicin)
- Twitter: [@therealvelosa](https://twitter.com/therealvelosa)
- LinkedIn: [Santiago Velosa](https://www.linkedin.com/in/santiago-velosa-arias/)

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./MIT.md) licensed.
