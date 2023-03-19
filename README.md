# SA-01: Phase 4 Code Challenge: Pizzas

## Learning Goals:
Implement a 'mini' Rails application that implements associations.

## Requirements
For this project, I am required to:

Create a Rails API backend.
Have at least three resources (three DB tables).

## Setup

### Pre-Requisites
In order to use this repository you will need the following:



- Operating System **(Windows `10+`, Linux `3.8+`, or MacOS X `10.7+`)**
- An account on Postman API Platform. [CLICK HERE TO CREATE ONE](https://www.postman.com/)
- RAM >= 4GB
- Free Space >= 2GB

You can setup this repository by following this manual

1. Clone the repository
    ```bash
   git clone https://github.com/oyieroyier/pizzas.git
   ```
2. Ensure the ruby gems are setup in your machine
    ```bash
   bundle install
   ```
3. Perform any pending database migrations and seed data
   ```bash
   rails db:migrate db:seed
   ```
4. Make sure no other application is using PORT 3000 and run the application
    ```bash
    rails s
    ```

5. Open Postman on your browser and on your workspace, paste this link where the API server is running
    ```
   http://localhost:3000
   ```

	 ![](/readme_resources/postman.png)

6. Test the deliverables by appending the routes under **ROUTES Deliverables** to the URL above and making the relevant HTTP requests.
Attached images illustrate the requests.


## MODEL Deliverables
Create the following relationships:

- A `Restaurant` has many `Pizza`s through `RestaurantPizza`
- A `Pizza` has many `Restaurant`s through `RestaurantPizza`
- A `RestaurantPizza` belongs to a `Restaurant` and belongs to a `Pizza`

![](/readme_resources/dbdiag.png)


## VALIDATIONS Deliverables
Add validations to the `RestaurantPizza` model:

- must have a `price` between 1 and 30
![](/readme_resources/VAL.jpg)

## ROUTES Deliverables:
Set up the following routes. Make sure to return JSON data in the format specified along with the appropriate HTTP verb.

#### GET /restaurants
Return JSON data in the format below:

```
[
  {
    "id": 1,
    "name": "Sottocasa NYC",
    "address": "298 Atlantic Ave, Brooklyn, NY 11201"
  },
  {
    "id": 2,
    "name": "PizzArte",
    "address": "69 W 55th St, New York, NY 10019"
  }
]
```
![](/readme_resources/GET.png)

#### GET /restaurants/:id
If the `Restaurant` exists, return JSON data in the format below:

```
{
  "id": 1,
  "name": "Sottocasa NYC",
  "address": "298 Atlantic Ave, Brooklyn, NY 11201",
  "pizzas": [
    {
      "id": 1,
      "name": "Cheese",
      "ingredients": "Dough, Tomato Sauce, Cheese"
    },
    {
      "id": 2,
      "name": "Pepperoni",
      "ingredients": "Dough, Tomato Sauce, Cheese, Pepperoni"
    }
  ]
}
```
![](/readme_resources/SHOW.png)

If the `Restaurant` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```
{
  "error": "Restaurant not found"
}
```
![](/readme_resources/SHOW2.png)

#### DELETE /restaurants/:id
If the `Restaurant` exists, it should be removed from the database, along with any `RestaurantPizza`s that are associated with it.

![](/readme_resources/DELETE.png)

If the `Restaurant` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```
{
  "error": "Restaurant not found"
}
```
![](/readme_resources/DELETE2.png)

#### GET /pizzas
Return JSON data in the format below:

```
[
  {
    "id": 1,
    "name": "Cheese",
    "ingredients": "Dough, Tomato Sauce, Cheese"
  },
  {
    "id": 2,
    "name": "Pepperoni",
    "ingredients": "Dough, Tomato Sauce, Cheese, Pepperoni"
  }
]
```
![](/readme_resources/GETPIZZAS.png)

#### POST /restaurant_pizzas
This route should create a new `RestaurantPizza` that is associated with an existing `Pizza` and `Restaurant`. It should accept an object with the following properties in the body of the request:

```
{
  "price": 5,
  "pizza_id": 1,
  "restaurant_id": 3
}
```

If the `RestaurantPizza` is created successfully, send back a response with the data
related to the `Pizza`:

```
{
  "id": 1,
  "name": "Cheese",
  "ingredients": "Dough, Tomato Sauce, Cheese"
}
```
![](/readme_resources/RESPIZZ.png)

If the `RestaurantPizza` is **not** created successfully, return the following
JSON data, along with the appropriate HTTP status code:

```
{
  "errors": ["validation errors"]
}

```
![](/readme_resources/UNPRO.png)


## Authors

Project contributed to and maintained by:
- [Bob Oyier](https://github.com/oyieroyier/)

## ISC

### ISC License (ISC)

[![License: ICL](https://img.shields.io/badge/License-ISC-blue.svg)](https://opensource.org/licenses/ISC)
