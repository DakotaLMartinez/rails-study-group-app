# README

12/3 Study Group

Tasks:
* Create an Inquiry model for storing contact form submissions
  - name 
  - email address
  - phone number 
  - content
* Validations:
  - require email, name, and content
  - validate format of email and phone number
* Add in error messages to display to users upon validation failure
  - when a user submits the contact form and there was something invalid about the data they submitted, they will see an error message describing the requirements for the data. 
  - When they submit proper (valid) data, the record in the database is created and they'll see their inquiry in the inquiries index view.