---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# 0. Introduction to game programming

## The main loop

* How do video games and other computer software *run?*
* When we execute a simple script, the computer runs it, and then stops execution
* Thus, to keep the program running, we need an infinite loop
	* This is known as the ***main loop***

<!-- _footer: https://gameprogrammingpatterns.com/game-loop.html-->

### Main loop: A simplified example

* An extremely simplified version looks something like this
  ```c#
  while (true)
  {
    processInput();
    update();
    render();
  }
  ```
* first we poll the user for input: were any buttons pressed?
* then we update all the game objects
  * Player moves according to input, enemies move on their own, etc.
* then we draw, or ***render*** everything on screen
* one round inside the main loop is said to take one ***frame***

### Unity main loop

* In Unity, we can create scripts inside GameObjects
  * if a script includes an update method, it is executed inside that main loop every frame
* Also btw, the main loop is in reality much more complicated
* [Manual: Order of execution for event functions](https://docs.unity3d.com/Manual/ExecutionOrder.html)

## Runtime vs. compile time

* two important concepts:
* Before a program can be executed, it has to be converted into machine code, i.e, ***compiled***
  * the time this process takes is called ***compile time***
  * every time you save a C# script file and return to Unity, Unity will compile the scripts for its use
* after compiling, the application can be ***run***
  * this time period is called ***runtime***
