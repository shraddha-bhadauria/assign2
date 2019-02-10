CSC/ECE 517 (OO Design and Development)
Spring 2019
Program 2: Ruby on Rails
Teams may consist of 2 or 3 members
Submission Due Date - February 22, 2019 (Friday) 11:59 PM 
Resubmission Due Date - March 1, 2019 (Friday) 11:59 PM 
Tour management system
You are tasked with creating an application for Agents and Tour Guides.
There will be three types of users in the system:
Admin
Agents
Customers
Admin
The system should have a preconfigured admin with at least the following attributes: email and password.
An admin should be capable of performing all operations performed by Agent or Customer. 
Admin accounts cannot be deleted.
Admin should be able to:
Log in with an email and password.
Edit profile.
Create agent and customer accounts (users).
View the list of all users and their profile details (except password).
View the list of all tours, along with detailed information.
View all fields of reviews (defined below) from customers.
Edit or delete users (agents or customers)/tours/reviews from the system.


Agent
An agent should have at least the following attributes: email (unique for each account), name and password.
Anyone can sign up as an agent using their email, name and password. After signing up, they can perform the following tasks:

Login with email and password.
List a tour.  
Edit/update/delete/cancel tours that they have posted. 
Cannot edit tours posted by other agents.
View all tours (including those listed by others).
Upload and delete pictures of tours that they themselves have listed. 
View list of all customers who have bookmarked a tour (created by them).
View list of all customers who have booked a tour.
View reviews of a tour.
Tours
A tour should have at least the following features: 
(Note: This is not the list of database columns that the table should have.  You can design the data model as you wish, as long as it implements at least the required functionality of the program.)
ID
Name
Description
Photos 
Price
Booking deadline
Duration (from - to dates)
Start location (where the tour starts from)
Tour itinerary -  A list of places where the said tour will take you 
(Customers must be able to search tours by itinerary)
Must include at least one country; a tour can span multiple countries
Must include at least one state/province within each country; a tour can span multiple states
Contact information for tour operator
ID’s of customers who have bookmarked a tour (a list of foreign keys —may be empty) 
Note:Bookmarking a tour is different from booking it!
Seats - total seats, available seats
Wait list (can be empty)
Status (In Future / Completed/ Cancelled). Only future tours can be booked for, and completed tours cannot be cancelled. Further, an agent can not edit a completed tour.

Booking a tour: 
A customer can book some number n of seats on the tour.  
If enough seats requested are available, add the customer to list of customers who have booked.
If some, but not enough, seats are available: 
Inform customer that enough seats are not available.
If customer wants to proceed with booking only the number of seats that are available:
Book the seats.
If customer wants to proceed with booking the available seats and await additional seats seats:
Book the seats available; and add remaining seats to waitlist
If customer wants to wait till enough seats are available:
Add customer to waitlist along with requested seats
If customer does not want to proceed; cancel transaction
If no seats are available, add customer with corresponding seat request to waitlist.

# seats in waitlist should be visible to everyone.

When a customer cancels n number of seats that have been booked:
If the waitlist is empty, increase the number of seats available for the tour.
If the waitlist is not empty:
Enroll customers from the waitlist on a first-come-first-serve basis who are requesting no more seats than are currently available.  (Bonus: send a notification email)
If a customer wants more seats than are available, skip that customer and go on to the next customer on the waitlist.
Customer
A customer should have at least the following attributes: 
Email (unique for each account)
Password
Name
Anyone can sign up as a customer using their email, name and password. After signup, they can perform the following tasks:
Log in with email and password.
Search available tours using filters, such as start date range, price range, tour name, slot availability and locations visited during the tour (Itinerary)
Bookmark tours they are interested in.
View information about tours
Book n seats on a tour.
Cancel a booking completely or cancel a few seats from a booking done previously.
Submit a review for a tour that that customer has already taken. A review should have at least the following attributes:
Id (created when the review is saved)
User id (foreign key)
Subject
Message content
Edit or delete a review they previously submitted.
Notes
There will be only one admin in the system, and this account will be preconfigured. 
An agent can post more than one tour
Customers can sign up for more than 1 tour.
Each customer can bookmark multiple tours. They can also remove themselves from the bookmark list for a tour.
It’s up to you whether a user should be able to sign up as both an agent and a customer with the same email address or not.  Either way is OK.
Frequently Asked Questions (FAQs)
Can we use any 3rd party gems?
Yes, you can.
If the admin account is predefined, how does the admin know how to log in?  Do we just give the admin a predefined login and password?
Yes.
Would a bare minimum UI consist of a page of links and simple HTML?
As long as the functionalities work, it is ok.
Is the admin able to edit the existing information for agents and/or customers?
Yes. As mentioned above, an admin should be capable of performing all operations performed by agent or customers.
Admin has the right to create agent and customer accounts. When the admin creates an account for a customer, the admin creates it with the customer’s email address.
Is the extra credit included in 70 points for the program, or can we score more than 70?
You can score more than 70 if you finish all extra credit tasks.

Miscellaneous
Testing

Thoroughly test one model and one controller (prefer RSpec testing framework).
Deployment
Please ensure that your deployment is always accessible for grading. You can deploy your app to any of the following: (Try to perform continuous deployment)

Heroku or any similar PaaS (OpenShift, etc.) with free plans
Amazon AWS
NCSU VCL
Bonus (Extra Credit)
You can do any or all of the below for extra credit (each item below is worth 5 points).
Send an email when the status of the customer moves from waitlist to booked.
All users can use their LinkedIn/Google/Facebook account (implementing any one of them is enough) to log into the system.
Submission
Your submission in Expertiza should consist of the following-

A link to your deployed application
A link to your repository
Credentials for the preconfigured admin and any other information that reviewers would find useful should be in the README.md file in this repository
Please also include in README file:
how to test various features (e.g., how to access certain pages, what details to enter in the form etc.)
How your program handles edge-case scenarios(e.g., what will happen if  admin/agent deletes a tour booked by several people? Or if the user who has booked the tour deletes his account.)

