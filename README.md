
# Little Shop of Orders

***

## Game of Gnomes

* Patrick Wentz
* Yoseph Anderson
* Kris Sparks


Production: https://game-of-gnomes-app.herokuapp.com/
***

In this project we'll use Ruby on Rails to build an online commerce platform to facilitate online ordering.

Our commerce site sells gnomes. A visitor can browse items, but must login to checkout. A user can view items, purchase items and view order history. Items are divided up by categories.

An admin can login and create and edit items.

As an extension we added Authy gem, by Twilio, for 2 factor authentication. When a user creates an account they will enter their phone number and receive a text message with a unique code. The user will need to enter the code to create a new account.

### Introduction

***

#### Learning Goals

* Use TDD to drive all layers of Rails development including unit and integration tests
* Design a system of models which use one-to-one, one-to-many, and many-to-many relationships
* Practice mixing HTML, CSS, and templates to create an inviting and usable User Interface
* Differentiate responsibilities between components of the Rails stack
* Build a logical user-flow that moves across multiple controllers and models
* Practice an agile workflow and improve communication skills working within a team

### Restrictions

Project implementation may **not** use:

* Any external library for authentication except `bcrypt`
