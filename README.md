# FASTEST FROG
### Video Demo:  <URL HERE>
### Description:
For my final CS50x project I wanted to create a game in a genre close to my heart. I've always loved platformers with the original Mario being my first game, so I decided to make a platformer in the style of old-school Mario. Below I explain my game features, design decisions, my experience with the Godot engine, and my overall thoughts on the project. It was definitely more difficult and time-consuming than I intially anticipated but seeing the end product made it so worth it!

#### Game Features:
The ability to move left and right.
The ability to jump.
A scoring system based on a combination of time taken to beat the game, coins collected, and enemies defeated.
A health system that decreases when the player makes contact with an enemy.
The ability to jump on enemies to defeat them and bounce off (similar to Mario games).
3 different levels with different textures, backgrounds, and music.
A title screen with the ability to start or quit the game.
A game over screen if the player loses all their health or falls off the map.
A victory screen when the player reaches the end of the 3rd level.

#### Design Decisions:
The most important design decision for this game was how I wanted the player character to feel. It's important to me that a platformer feels responsive and tight, while also giving a bit of leeway to the player to make minor mistakes and not get punished (i.e. reward players for good control and flow while not overly punishing for mis-timings or mis-jumps).
With this in mind I implemented both coyote time and input (jump) buffering. Coyote time is where a player can still jump for a short period after walking off a ledge, preventing the player from falling if they don't perfectly time their jump and allowing more natural play styles (i.e. jumping right at the end of a platform). Input (jump) buffering is where, if a player inputs a jump command when they're not on the ground but they touch the ground X milliseconds later, they will automatically jump when they touch the ground. This allows players to "bounce" their jumps and keep jumping non-stop if they like, whereas without input buffering it feels like the player is often stuck to the ground when they try and jump a millisecond too soon before their character is touching the ground.
The other design decision I made was to implement a timing system that rewarded the player for moving quickly, instead of punishing for taking too long. Often timers are implemented to give extra urgency to players and will cause a fail state if it reaches 0. I personally find this mechanic anti-fun as I find it creates more frustration than anything else, so I decided to give the player more points if they have more time left but not cause a game over if the timer reaches 0.
The design decisions above I found made the game play much more tightly and minimize frustration.

#### Godot Engine:
I decided to use the Godot game engine to create Fastest Frog, and its GDScript language to code my game. The engine is open-source and has a very natural flow to it so I found it very simple to begin creating my game and organizing my code. GDScript is similar in syntax to Python so I was able to pick it up quickly and the documentation is extremely comprehensive. By using Godot I was forced to learn a new language, read a lot of documentation and solve my own problems that didn't have any clear guides online.

#### Final Thoughts:
Overall this was an absolute blast to create! I honestly didn't think I had it in me to take a project of this scope from ideation to completion but by combining my learnings in CS50x with a field I'm familar with (video games) I created a completed project that was actually playable! I got ~100 plays on it in total from friends, family and visitors to my itch.io page which felt fantastic.
Thank you for reading through this and for putting this course together! I enjoyed this more than any university course I took in my undergrad and I appreciate all you've done and continue to do to democratize learning all over the globe.
