# To run in Local Server

* Required Ruby Version: 3.0.0
* Required Rails Version: 6.1.4.6
* Required DBMS: MySQL

```bash
git clone git@github.com:debugster/e-learning.git
cd e-learning
cp .env.sample .env
```

* Open .env file and insert your database credentials
* For MAIL_SERVER_HOST, you can use 'localhost:3000'

```bash
bundle install
yarn install
rails db:create
rails db:migrate
rake db:seed:all
rails s
```

* Admin Credentials
  * Email: admin1@admin.com
  * Password: 123456
