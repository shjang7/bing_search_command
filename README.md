<h1 align="center">Welcome to Cooper Hewitt Search Command 👋</h1>

This app is using RESTful api.
The data represents Cooper Hewitt, Smithsonian Design Museum’s diverse collection, spanning thirty centuries of historic and contemporary design.<br />
It uses the api from [Cooper Hewitt Smithsonian Design Museum](https://www.cooperhewitt.org/).

## Built With

- Ruby 2.6
- [Cooper Hewitt Smithsonian Design Museum API](https://collection.cooperhewitt.org/api/)

### ✨ [Live Demo]()

## Getting started

> Clone the repository to your local machine

```
$ git clone https://github.com/shjang7/cooper_hewitt_search_command.git
```

> Change directory into the directory

```
$ cd cooper_hewitt_search_command
```

> Create database for running a server

```
$ rails db:create
```

> Set your API credentials from your account

```
$ cd config
$ touch app_environment_variables.rb
ENV['COOPER_HEWITT_ACCESS_TOKEN']='xxxx'
```

> Install the needed gems:

```
$ bundle install
```

> Open server

```
$ rails server
```

> Go to `http://localhost:3000` using your browser.

## Author

👤 **Suhyeon Jang**

- Github: [@shjang7](https://github.com/shjang7)
- LinkedIn: [@shjang](https://www.linkedin.com/in/shjang/)
- Twitter: [@shjang12](https://twitter.com/shjang12)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/shjang7/cooper_hewitt_search_command/issues).

1. Fork it (https://github.com/shjang7/cooper_hewitt_search_command/fork)
2. Create your working branch (git checkout -b [choose-a-name])
3. Commit your changes (git commit -am 'what this commit will fix/add')
4. Push to the branch (git push origin feature/[feature-name])
5. Create a new Pull Request

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](https://github.com/shjang7/cooper_hewitt_search_command/blob/master/LICENSE) licensed.
