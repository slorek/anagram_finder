# Anagram Finder

HTTP API to find anagrams of words from a supplied dictionary file.

## Pre-Requisites

* Ruby 2.3.0 and Bundler
* Redis

## Dictionary

A sample dictionary file has been provided in `/dictionary.txt`. This can be replaced with any dictionary provided each word is supplied on a separate line.

Although I was able to extract the Symbian SIS file, I was unable to allocate sufficient time to parse the proprietary MSDict file format. A Hex editor reveals the words index so it should be possible, but I felt this would take a disproportionate amount of time.

The supplied file was sourced from `/usr/share/dict/words`. This requires 62.2MB of Redis memory storage.

## Running Locally

First, check the Redis connection credentials in the relevant `.env` files.

1. Bundle the gems: `bundle install`
1. Run the tests: `bundle exec rspec` or `rake`
1. Load the dictionary: `bundle exec rake dictionary:load`
1. Start the server: `bundle exec puma -C config/puma.rb`

## Usage

Send a GET request with the word(s) to search for as the path, e.g:

```
GET /crepitus,paste
{"crepitus":["cuprites","pictures","piecrust"],"paste":["pates","peats","septa","spate","tapes","tepas"]}
```

Responses are in JSON format.

## Deploying to Heroku

**NOTE: The supplied database requires 62.2MB of Redis storage. A paid Redis subscription will therefore be required. The same issue would be encountered with an SQL database on Heroku due to the Heroku Postgres free plan row limit.**

1. Ensure you have the Heroku CLI installed. See https://devcenter.heroku.com/articles/heroku-command#installing-the-heroku-cli
1. Create the app: `heroku apps:create <app_name>`
1. Provision the Redis database. RedisCloud offers the best value plan for the required storage: `heroku addons:create rediscloud:100`
1. Deploy the application: `git push heroku master`
1. Load the dictionary: `heroku run rake dictionary:load`

Assuming no errors, the application should now be working at the URL specified by the Heroku CLI.

## Next Steps

To develop this further one could consider:

* Exception handling; especially Redis out of memory error when loading the dictionary (`Redis::CommandError`).
* More feedback when loading the dictionary e.g. to show progress and number of words imported.
* Heroku offers a number of performance monitoring and alerting add-ons which could be easily enabled.
* Write a parser for the proprietary dictionary file.

&copy; 2016 Steve Lorek
