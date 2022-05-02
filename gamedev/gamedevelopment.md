
## About game development

* Game development is hard
* Multidisciplinary work
* even small games are complex systems

## Good principles

* Greyboxing
  * When testing digital or tabletop games to decide if core mechanics are fun, avoid including much art: use simple forms so the audience can focus on the mechanic: “Greyboxing”
  * Good Mechanics = fun game.
  * Art+Audio can create greater immersion, a more memorable experience, but cannot fix a mechanic (or game) that is not fun.

* Fail faster
  * Do not spend a ton of time thinking or arguing about whether to include a mechanic: try it! See if it works,  
  * You don’t need to try EVERYTHING, but if you have collaborators/stakeholders excited about an idea, don’t dispute the idea– try it out and see if it works.
  * Burn through a lot of bad or mediocre ideas as fast as possible to get to the good ones. 

## Have a good team

* What is common in good teams?
  * 5. impact: work matters
  * 4. meaning: personally important
  * 3. clear roles & clear goals
  * 2. dependability: things get done on time
  * 1. psychological safety

## Random

* When making changes to variables, make them big
  * No: 1->2, 4.5->4.7
  * More like: 1 -> 10
  * At least double/halve the value when adjusting in the beginning
  * Finetuning happens later

## Cursed problems

## About game engines

* sometimes Unity isn't the best option!
* there are roughly three types of game development depending on your technology
  * these aren't undisputable facts, I made these following descriptions up
  * think for yourself if there's something missing

### Type 1: All-purpose Engine
  * Unity, Unreal, Godot, GameMaker Studio
  * 3D or 2D
  * drag-and-drop GUI
  * not necessarily "real" programming involved
  * when is, you won't be programming the main loop, only gluing your scripts on top of existing structures
  * suited for games big and small
  * jack of all trades, master of none
### Type 2: Framework
  * Love2D, Monogame, Pygame
  * 2D easy, 3D harder
  * no engine "window", almost everything happens in a text editor
  * basically an API full of helper functions
    * "draw sprite on coordinates x,y"
  * suited for people who...
    * want to have a tighter control on what's happening under the hood
    * want to build their own structures
    * think all-purpose engines get on their way 
### Type 3: Specialized Engine
  * Renpy, RPGMaker, Adventure Game Studio, Twine
  * A tool for making a specific kind of game
  * can involve code or its own scripting/description language
  * very fast for what it does
  * easier to fully grasp due to limited output
