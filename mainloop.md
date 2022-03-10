---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Main loop

* How do video games and other computer software *run?*
* When we execute a simple script, the computer runs it, and then stops execution
* Thus, to keep the program running, we need an infinite loop
	* This is known as the **main loop**
	* A simplified version looks something like this
		```c#
		while (true)
		{
		  processInput();
		  update();
		  render();
		}
		```
<!-- _footer: https://gameprogrammingpatterns.com/game-loop.html-->