# Solids Latvian Multi Theft Auto Roleplay respository.

This MTA Gamemode repository is based on the 2021. Owlgaming Multi Theft Auto Roleplay repository that can be found here: [Owlgamings Repository](https://github.com/OwlGamingCommunity/MTA)
Credits for all the base systems go to them! @OwlGamingCommunity

## What is this repository?
This is my personal Multi Theft Auto Roleplay repository, that I had worked on for a couple of months. Fixing various bugs, making some of my own scripts as well as translating most of the scripts that already existed here.

It's main purpose is to provide the Latvian Multi Theft Auto Roleplay community a good base gamemode to later expand on. As of making this repository, most servers use outdated and error-filled gamemodes. This one will hopefully help everyone out.

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

## Is this repository going to get updated?

I, Solid, am not planning to continue work on this repository as of now, but I would like to see the various server owners who will download this gamemode to try and contribute bit by bit.
Even translating something would be nice. :)

## QnA | Additional information

<details><summary>Q: I gave myself admin, but can't log-in anymore?</summary>
<p>A: Your MTA Serial code needs to be in the serialwhitelist table in the database. It's an extra layer of security in case a player gets an admins profile!</p>
</details>
<details><summary>Q: Are there any mods placed in this gamemode?</summary>
<p>A: Yes, almost every vehicle has been modified in this gamemode. You can see a full list of them in this excel spreadsheet I had: https://docs.google.com/spreadsheets/d/17WtGZWJ-rwZzZzMzWKVC8dCVBawsvnhLIc4JaI9tRoQ/edit?usp=sharing</p>
</details>
<details><summary>Q: Can I find out all of the commands in the server anywhere?</summary>
<p>A: I had the plan of documenting every single one of them, but I sadly couldn't finish it, but you can see a portion of them on the gamemodes excel spreadsheet: https://docs.google.com/spreadsheets/d/17WtGZWJ-rwZzZzMzWKVC8dCVBawsvnhLIc4JaI9tRoQ/edit?usp=sharing</p>
</details>
<details><summary>Q: Is the economy already well-made in the gamemode?</summary>
<p>A: The majority has been already done and checked. A few small things like NPC store prices need to be checked. Stuff like cars aren't included in the gamemode, so you'll have to make sure yourself that the vehicles players can purchase aren't overpriced or too cheap. Most of the economics have been documented on the excel: https://docs.google.com/spreadsheets/d/17WtGZWJ-rwZzZzMzWKVC8dCVBawsvnhLIc4JaI9tRoQ/edit?usp=sharing</p>
</details>
<details><summary>Q: What are the logos in the gamemode already?</summary>
<p>A: Most of the logos and images in the gamemode are custom-made by one of the users in the old PowerPlay community. These icons can freely be changed out to your own, just don't change the names.</p>
</details>

## Credits

Base Owl gaming credits go to the @OwlGamingCommunity.

Big thanks go to: SanityKiller#4435 & Jurmaize#7464, old PowerPlay Latvian community for helping me test the gamemodes scripts, creating some of the logos in the gamemode and other small things.

Thanks goes out to the Multi Theft Auto developers for giving us an epic platform to play on! Check out their GitHub Organization here: [MTA Github organization](https://github.com/multitheftauto)