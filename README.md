# Guild Engineering Project - Backend API

## Running the App
Your system will require pre-reqs to run a Rails project:
* Ruby
* SQLite3
* Node.js
* Yarn

This [guide](https://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails) provides good instructions on getting setup.

* Ruby version
I built my project using 2.6.3

* Rails version
6.0.3

* Configuration
Once Rails is installed, from the project root, run:
```bundle install``` to install all necessary packages.

* Database creation
To initialize the database, from the project root:
```rails db:migrate```

* Database initialization
To seed the database:
```rails db:reset```

* How to run the test suite
From the project root:
```rspec```

## API Documentation

# Guild Project

## Indices


  * [GET all recent messages](#1-get-all-recent-messages)
  * [GET chats](#2-get-chats)
  * [GET messages](#3-get-messages)
  * [GET recent messages for recipient/user](#4-get-recent-messages-for-recipientuser)
  * [GET single chat](#5-get-single-chat)
  * [GET users](#6-get-users)
  * [Message post](#7-message-post)
  * [POST create chat](#8-post-create-chat)


--------


### 1. GET all recent messages



***Endpoint:***

```bash
Method: GET
Type: 
URL: localhost:3000/messages/recent_all
```



### 2. GET chats



***Endpoint:***

```bash
Method: GET
Type: 
URL: localhost:3000/chats
```



### 3. GET messages



***Endpoint:***

```bash
Method: GET
Type: 
URL: localhost:3000/messages
```



### 4. GET recent messages for recipient/user



***Endpoint:***

```bash
Method: GET
Type: 
URL: localhost:3000/messages/recent_for_user
```



***Query params:***

| Key | Value | Description |
| --- | ------|-------------|
| sender_id | 1 | The id of the sending user |
| recipient_id | 3 | The id of the recieving user |
| last30 | true | Should limit results to last 30 days? |



### 5. GET single chat



***Endpoint:***

```bash
Method: GET
Type: 
URL: localhost:3000/chats/1
```



### 6. GET users



***Endpoint:***

```bash
Method: GET
Type: 
URL: localhost:3000/users/
```



### 7. Message post



***Endpoint:***

```bash
Method: POST
Type: RAW
URL: localhost:3000/messages
```


***Headers:***

| Key | Value | Description |
| --- | ------|-------------|
| Content-Type | application/json |  |



***Body:***

```js        
{ "message": {  "user_id": 1,   "chat_id": 2,   "text": "Hello what's going on friends!" }}
```



### 8. POST create chat



***Endpoint:***

```bash
Method: POST
Type: RAW
URL: localhost:3000/chats
```


***Headers:***

| Key | Value |
| --- | ------|
| Content-Type | application/json |



***Body:***

```js        
{ "chat": {  "user_ids": [1,2,3], "name": "Hello World Chat!" }}
```

## Use Cases
### Required
1. A user (sender) can send a text message to another user (recipient).
2. Recent messages can be requested for a recipient that are from a specific sender.
	* Limit to 100 messages **OR** all messages within last 30 days
3. Recent messages can be requested from **ALL** senders
	* Limit to 100 messages **OR** all messages within last 30 days
    
### Additional
1. A list of app users can be requested.
2. A user can send a text message to a group of users.

## Design
My general design consists of three primary domain models: Message, Chat, and User as reflected in the following Entity-Relationship Diagram.

![ERD Image](/docs/erd.pdf)

* `Users` contains the different actors who interact with the chat app. It has one attribute, `name` used to desribe the user.
* `Chats` maintains the relationship between one or more users for which messages can be transmitted. `UserChats` operates as a join table enabling a chat to have many users. Using Slack as an example, I envisioned use cases
where a user can:
    * Send a message to another user.
    * Send a message to a group of users.
    * Send a message to self.
* `Messages` contains the text/content and the user_id of the sender.

I made this design decision so that I could model sending messages to a "channel" or "topic" rather than simply between users.
It satisfies the base requirements while setting the stage enhance and scale in a flexible fashion. Lastly, it sets up infrastructure such that 
a pub-sub model could be used supporting Http 2.0 or scaling via SNS/SQS etc.

## Implementation
I decided to use Ruby on Rails to implement this project. Rails generators make it very easy to construct the necessary models and supporting framework to quickly iterate on this project.
Additionally, I wanted to prove that I could create an API only Rails project that could be used as a microservice some magical day :)

## Extras
I really wanted to achieve some idea of look-and-feel for what a real chat application would look like using websockets.
Rails provides a really neat feature for integrating websockets as explained [here](https://edgeguides.rubyonrails.org/action_cable_overview.html).  

I was able to successfully expose an endpoint that can be used to connect to via a websocket enabling a front-end dev the ability to broadcasts chats messages in realtime.
The `ChatsChannel` class achieves this.

With an API server running, opening [test.html](test.html) will make a connection and print to the page.
If I had more time, I would have liked to continue exploring this. :) :)

## Final thoughts


