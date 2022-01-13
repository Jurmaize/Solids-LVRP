# Solids Latvian MTA Roleplay respository.

This MTA Gamemode repository is based on the 2021. Owlgaming MTA roleplay repository that can be found here: [Owlgamings Repository](https://github.com/OwlGamingCommunity/MTA)
Credits for all the base systems go to them! @OwlGamingCommunity

## What is this repository?
This is my personal repository, that I had worked on for a couple of months. Fixing various bugs, making some of my own scripts as well as translating most of the scripts that already existed here.

This repository includes an exported sql database, that can easily be imported in a database of your own. Some generic information to help set-up the server quicker has been left in.

## What's the difference between this repo and Owlgaming original repo?

1. Most if not all systems have been translated to Latvian.
2. There has been a multitude of bug fixes, like a tutorial bug, some HUD improvements etc.
3. I've added multiple finished (and a few unfinished) scripts of my own. Most of these can be found under deathmatch/resources/[solidaskripti]
4. Owlgamings original repo worked on two separate databases, I've merged them into one.
5. Owlgaming used a deprecated password hashing system that was apart of a MTA module. This is no longer the case, since the login system uses the now built-in MTA hashing functions.

## How can I use this gamemode?

1. Import the sql tables in your local or external hosts database.
2. Place the gamemode in: MTA San Andreas 1.5\server\mods
3. deathmatch\resources\mysql\mysql.lua  -- Set both connections to your hosts information.
4. Should be done!

## QnA | Additional information

<details><summary>Q: I gave myself admin, but can't log-in anymore?</summary>
<p>A: Your MTA Serial code needs to be in the serialwhitelist table in the database. It's an extra layer of security in case a player gets an admins profile!</p>
</details>
<details><summary>Q: Are there any mods placed in this gamemode?</summary>
<p>A: Yes, almost every vehicle has been modified in this gamemode. You can see a full list of them in this excel spreadsheet I had: [Gamemode excel spreadsheet](https://docs.google.com/spreadsheets/d/17WtGZWJ-rwZzZzMzWKVC8dCVBawsvnhLIc4JaI9tRoQ/edit?usp=sharing)</p>
</details>