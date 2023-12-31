# README 

## After DEV 

### Prepare App
1. Install gems: `bundle install`
2. Setup database:  `bin/rails db:setup`
3. Ensure migrations are run: `bin/rails db:migrate`

### Loading Activity Data
1. Load rails console: `bin/rails c`
2. In the console run activity_worker: `ActivityWorker.new.load_activities`

### Authorization
Requests will need to be authenticated and will fail without an auth token.
In the future tokens will be generated by logging in. Tokens last for 24 hours.
1. Navigate to app route in a terminal
2. Run rake task `rake generate_auth`
3. Copy token from console window e.g eyJhbGciOiJIUzI1NiJ9.eyJ0eXBlIjoiYXV0aCIsImV4cCI6MTcwMDE0MjY0MX0.RQjcKBbjOFOm_3Eht81QK0Usl1nGjQQzydk6-wcoMhE
4. Add this token to request header with the key `Authorization`

### Endpoints
1. run server `bin/rails s`
2. ensure auth token is set see above
- get `/user`  gets all users
- get `/user/:user_id` find user by rails id listed as 'id'
- get `/activity` gets all activities params (order=`fastest/longest,` limit=`integer`)
- get `/activity/:activity_id` find activity by rails id listed as 'id'
- get `/user/:user_id/activity` get activities by user params (order=`fastest/longest,` limit=`integer`)
- get `/user/:user_id/activity/:activity_id` find activity by rails id for a user
- post `/user/:user_id/activity/:activity_id/comment` params (message=`string`) create comment by user for activity
- get `/comment` gets all comments
- get `/activity/:activity_id/comment` gets all comments by activity
- get `/user/:user_id/comment` gets all comments by user


## Challenge

This ruby project was created using the command `rails new rb-rails-take-home-challenge --api`

The only addition to the boilerplate project is the `activity_json_data` directory - this contains JSON activity files for 2 users A & B.

**Ruby version - 3.1.2**

## Objective

Develop a Ruby on Rails API application that consumes provided JSON data containing running activity information. The application should store this data in a database and offer various API endpoints to retrieve and analyze the data.

## Requirements

### 1. **Data Consumption and Database Design**

- Parse the provided JSON activity files.
- Design a suitable SQL database schema to store this activity data. Consider aspects like normalization, indexing, and relationships.
- Seed the database with the parsed JSON data.

### 2. **API Endpoints**

- **Retrieve Activities:** Provide an endpoint to list all activities and another to retrieve detailed data for a specific activity.
- **User Activities:** Provide an endpoint to obtain a users activity.
- **User Activity Insights:** Fetch the longest run in terms of distance, the quickest in terms of average pace.

### 3. **Bonus (Optional)**

- **API Authentication:** Implement authentication for the API.
- **Social:** Create endpoints which create and fetch comments on particular activities.
