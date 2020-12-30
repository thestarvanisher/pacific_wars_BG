# Pacific wars 
A website dedicated to the Pacific wars during WW2. Originally created for a school project. The website uses Django as a back-end framework. 

## Features
### Interactive map
A map of South-East Asia is displayed with symbols which denote the battle location. Clicking on one will open the information about the battle.

### Search
There are two fields - the left field is a dropdown which you can use to select a category for your search. These are the categories:
- Battle
- Country
- Location of battle
- Name of a person
- Military achievements

In the second field you can type the keywords for the serch.
The search can be sorted by the following properties:
- Battle name
- Date (when the battle started)
- Date (when the battle ended)
- Number of soldiers (ascending, descending)
- Number of victims (ascending, descending)

### Contact field
You can send a message to the website if you want to make corrections or have information about a battle.

## About the project and the idea
The project was intended as a school project. The assignment was to demonstrate knowledge in SQL by creating an app (desktop in MS Access or a web app). My decision was to make it as a web app. In total there are 20 battles and 131 people in the database. The data was collected mostly from Wikipedia or Encyclopedia Britannica.

## Warning
The project was originally developed in Python 3.5 and Django < 2. Some code was corrected in order to allow the website to run on Python 3.9 and Django 3.1. There might be some small errors because of this conversion.

## How to run?
First you need to copy import the database file. To do so, under Windows you can run the following:
```
psql -U username -d databasename -f pacwarsdb.pgsql
```
You also need to edit the `settings.py` file for the database settings - change the name, password, port fields. 

Afterwards, you can run the Django as usual or setup a server. 

**Note:** The page with the form for sending a message has a Captcha. You have to edit the Captcha key, which you can find in the `settings.py` file. You should do this if you intend to run it on a server. Also, the Captcha works only with the **DEBUG**=*false*. 



