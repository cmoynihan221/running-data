# README 

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
