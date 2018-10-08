# lifeplans-api
[![Coverage Status](https://coveralls.io/repos/github/andela-ydaniju/lifeplans-api/badge.svg?branch=ft-bucketlist-model-112129783)](https://coveralls.io/github/andela-ydaniju/lifeplans-api?branch=ft-bucketlist-model-112129783) [![Circle CI](https://circleci.com/gh/andela-ydaniju/lifeplans-api.svg?style=svg)](https://circleci.com/gh/andela-ydaniju/lifeplans-api) [![Code Climate](https://codeclimate.com/github/andela-ydaniju/lifeplans-api/badges/gpa.svg)](https://codeclimate.com/github/andela-ydaniju/lifeplans-api)

## Features

Lifeplans-Api is an API service that allows users create bucketlists to store items. Bucketlists are initialized with a name, and an optional list of Items. Items are stored under bucketlists, with a name and a done-status indicating whether Item is completed or not.

For full access to the API, a user account is required. After registration, an initial request is made to log in to user account. This request generates a JSON Web Token, which is returned in the response. This token is used to authenticate subsequent requests to the API. 

For full documentation, and usage examples, see http://docs.lifeplansapi.apiary.io/

For API access, visit http://lifeplans-api.herokuapp.com

## Dependencies

User authentication is implemented with the JWT gem. For more information, see https://github.com/jwt/ruby-jwt

Service objects were implemented by extending the SimpleCommand gem. See https://github.com/nebulab/simple_command

ActiveModelSerializer was used while serializing objects for JSON responses. See https://github.com/rails-api/active_model_serializers

## Installation

Web application is written with Ruby using the Ruby on Rails framework.

To install Ruby visit [Ruby Lang](https://www.ruby-lang.org). [v2.2.3p173]

To install Rails visit [Ruby on Rails](http://rubyonrails.org/). [v4.2.4]


## API endpoints.

| EndPoint                                |   Functionality                      |
| --------------------------------------- | ------------------------------------:|
| POST /auth/login                        | Logs a user in                       |
| GET /auth/logout                        | Logs a user out                      |
| POST /bucketlists/                      | Creates a new bucketlist             |
| GET /bucketlists/                       | Lists all the created bucketlists    |
| GET /bucketlists/:id                    | Gets single bucketlist               |
| PUT /bucketlists/:id                    | Updates this bucketlist              |
| DELETE /bucketlists/:id                 | Deletes this single bucketlist       |
| POST /bucketlists/:id/items/            | Creates a new item in bucketlist     |
| PUT /bucketlists/:id/items/:item_id     | Updates a bucketlist item            |
| DELETE /bucketlists/:id/items/:item_id  | Deletes an item in a bucketlist      |


## Limitations

1.  Cancan was not used in authorization.

2.  OAuth access not yet implemented.

## Testing

Before running tests, run the following command to run all database migrations:

        $ bundle exec rake db:migrate

Before running tests, run the following command to seed the database:

        $ bundle exec rake db:seed

To test the web application, run the following command to carry out all tests:

        $ bundle exec rake spec

To view test descriptors, run the following command:

        $ bundle exec rake spec -fd

## Contributing

1. Fork it by visiting - https://github.com/andela-ydaniju/lifeplans-api/fork

2. Create your feature branch

        $ git checkout -b new_feature
    
3. Contribute to code

4. Commit changes made

        $ git commit -a -m 'descriptive_message_about_change'
    
5. Push to branch created

        $ git push origin new_feature
    
6. Then, create a new Pull Request
