# Noatta Demo

This is the Ruby on Rails code for the client and server
demo of the Noatta finger scanning system. This two part
demo was designed as a prototype for a new point-of-sale 
system to replace credit cards and smartphone apps for 
purchase of items using a Hitachi Finger Vein Scanner for user
authentication. This particular prototype was designed to 
be deployed at fitness centers and, thus, has check-in, 
purchase, and new account creation functions.

$ Client

The client is designed to run in a browser on a touchpad PC 
at the point-of-sale which interfaces with a hardware finger
scanner through ActiveX/Javascript controls. 

$$ Check In

The check-in calls the hardware scanner to authenticate user, 
then checks a third-party database via SOAP to see if the user's 
account is in good standing, and then displays splash page with user
picture and account info.

$$ Payment

The payment button calls the scanner as in the Check-in feature to
authenticate the user, but then logs a transaction with the user's 
account.

$$ Sign Up

The new user sign up button is for new account creation and associates
a new user finger scan with an account and email address. The system
will email you with a temporary password to set up your account after
scanning.

$ Server

The server portion is designed to be run on a web browser at home. This
interface allows the user to view all transactions (payments or check ins),
change account information such as payment methods, contact info, picture, 
etc., view outstanding balances, and add/delete vendors. Additionally,
it has an administrative interface to monitor/add/delete user account 
activity.




Created by Ralph Lin
June 2012