# Modules and Objects 
This Document contains all the modules and objects in this project and a description of their functions and their attributes.

#### Notes: 
- Please look at the [UML](module_uml.mdj) to see all the attributes and the structure of modules and thier relation to each other. The UML can be downloaded and the viewed using [StarUML](http://staruml.io/download)
- Please take a look at the [User Stories](UserDesing/user_stories.md) to see all the expected features and functionalities for every module.

## UML:
![UML](modules_uml.jpg?raw=true "UML")
_The structure of the Model component responsible for representing all the objects in the database and abstracting the necessary database queries_
## User: 

This module represents a registered user. 

#### Functions: 
1. **login**(email, password): Authenticate the user using the username and the password and returns the user id or false if the authentication was not successful.
2. **login**(id, social_media):
	1. number id: the id of the social media account the user has registered with
	2. String social_media: the type of the social media the user is using to register: (facebook, google, twitter)
3. **View(id)**: given the id of the user, returns a JSON object containing all the info about the user.
4. **Search(keyword)**: given a keyword, search for the user through his email, username, First name, last name and phone number respectively.
5. **Like(id)**: Likes the user of the given ID after making sure the id of the user actually exist in the database.
6. **Match()**: Search for users with the same preferences and interests and then match him with them one at a time depending on the accuracy of the match.
7. **Edit(attributes)**: attributes is a JSON object with all the attributes and new values to be modified. This JSON has to be validated first.
8. **UploadPhoto()**: uploads a new photo. 
9. **LikeProject(pid, uid)**: Lets a given user likes a given project. Thus, sending notification to the creator of the project.
10. **Save()**: inserts the user in the database if he does not already exist.

## Project: 

This module represents a project object that is being added to the database or retreived from the database.

#### Functions:
 
1. **ViewAll()**: returns an array of all the projects in the database ordered by the date
2. **ViewAll(location)**: returns an array containing all the projects in a certain location ordered by the date.
3. **Search(keyword)**: Search for project by a specific keyword.
4. **GetNotifications(uid)**: gets all the projects notifications for a certain users that has not been opened yet. 
5. **ViewNotification(notid)**: redirects the user upon clicking on a certain notification and set the notificaiton seen_at attribute to the current time.
6. **save()**: saves a new project in the database. 

## Notification:
This module represents a notification object that is sent to a certain user if the seen_at is not NULL

#### Functions: 
1. **fetch(uid)**: gets the notification for a certain user.
2. **save()**: inserts a new notification in the database. 


