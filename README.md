# README

A Kanban board like app built using Rails 7.1 and Hotwire. I have been building this app to learn and experiment with
Hotwire. It is not intended to be a fully functional or complete application.

Inspired by [SupeRails](https://www.youtube.com/@SupeRails) episode [Rails 7 #119 Trello Clone. Advanced Drag and Drop Sortable Lists with Hotwire](https://youtu.be/OZWhN4Gtjos).

## Installation

Install Ruby and NodeJS:

```bash
brew install asdf
asdf plugin add ruby
asdf plugin add nodejs
asdf install
```

Install gems and Javascript dependencies:

```bash
bundle install
yarn install
```

Initialise database:

```bash
bundle exec rails db:reset db:seed
```

Run local server:

```bash
./bin/dev
```
