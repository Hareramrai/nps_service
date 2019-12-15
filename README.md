# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
* 2.6.1

* System dependencies
* Postgresql

* Configuration

* Database creation
* bundle exec rails db:create

* Database initialization
* bundle exec rails db:setup

* How to run the test suite
* SIMPLECOV=true rspec
* Services (job queues, cache servers, search engines, etc.)

* Defined rake tasks
- Please use below command when you want to generate link for realtor feedback from seller. Current this rake task create a new seller and realtor. 

`rake surveys:seller_respondent['realtor_feedback'] ` 

- Please use below command when you want to geneate link for seller feedback from realtor. Basically we could move this to job, which will sends email to sell or realtor, when we need any feedback.

`rake surveys:realtor_respondent['seller_feedback']`

# API 

# Submit NPS survey feedback 

Please see below sample api format.
--------------------------------

````
curl -X PATCH \
  http://localhost:3000/api/v1/surveys/0bc70f68-1677-4696-9e55-6a79fa289f20 \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d ' {
 "survey":  {
            "score": 9
          }
   }'
````
- Response of above curl command 

````
true
````

# Filter survey feedback 

Please see below sample api format.
--------------------------------

````
curl -X PATCH \
  http://localhost:3000/api/v1/surveys/touchpoint=realtor_feedback&respondent=Seller
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
````
- Response of above curl command 

````
{
    "data": [
        {
            "id": "0bc70f68-1677-4696-9e55-6a79fa289f20",
            "type": "survey",
            "attributes": {
                "id": "0bc70f68-1677-4696-9e55-6a79fa289f20",
                "score": 9,
                "touchpoint": "realtor_feedback",
                "aasm_state": "completed",
                "created_at": "2019-12-15T18:00:05.444Z",
                "updated_at": "2019-12-15T18:03:49.637Z",
                "respondent": {
                    "id": "104b27bd-f8b1-4286-8805-9d9dd7022bfc",
                    "first_name": "Han",
                    "last_name": "Bogan",
                    "date_of_birth": "2018-06-16",
                    "email": "grayce_casper@welch.co.uk",
                    "phone": "+49 380 3385949",
                    "number_of_listing": 1,
                    "marked_as_deleted": false,
                    "created_at": "2019-12-15T18:00:05.319Z",
                    "updated_at": "2019-12-15T18:00:05.319Z"
                },
                "requester": {
                    "id": "20cfaa50-0a38-4541-9cd2-2c7c7ff6d4c0",
                    "first_name": "Jonnie",
                    "last_name": "Gorczany",
                    "date_of_birth": "2017-04-30",
                    "email": "stanley@von.co.uk",
                    "phone": "+49 7543 0479413",
                    "ratings": 1.5,
                    "number_of_deals_completed": 1,
                    "number_of_deals_taken": 2,
                    "marked_as_deleted": false,
                    "created_at": "2019-12-15T18:00:05.393Z",
                    "updated_at": "2019-12-15T18:00:05.393Z"
                }
            }
        }
    ]
}
````

# Improvement
- We could encrypt our uuid in url, so that user won't able predict any other survey but still uuid is unique. 

- We could use redis for caching survey data for better performance for listing api.
- May be include expired time to url, if get any response after that time, we will not accept the feedback.

- I had some other suggestion. like adding swagger for api documentation. 