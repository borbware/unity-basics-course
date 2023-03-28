---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Functions

## Scope

* Variables declared inside of blocks are called **local** variables
  * they are only accessible inside of that block
  ```c#
  int a = 0;
  if(a < 10)
  {
      // Variable 'b' is only accessible inside of this 'if' block
      int b = 1;
      b = 2;          // This works
  }
  b = 3;              // This throws an error
  ```
## Introduction to functions

* To avoid repetition, blocks of code can be enclosed into named *functions*
* Functions can have multiple arguments and a return type
  ```c#
  void PrintName(string argument1)
  {
      Debug.Log("My name is " + argument1);
  }
  ```
  * This function takes in one `string` argument
  * It returns nothing (thus, its return type is `void`)
  * The function can be called like this:
    ```c#
    PrintName("Matti");
    string name2 = "Teppo";
    PrintName(name2);
    ```

### Function example
* Here's an example with two arguments and a non-void return value
* The `return` keyword tells what we return from the function 
  ```c#
  float Pythagoras(float a, float b) // a^2 + b^2 = c^2
  {
      float c = Mathf.Sqrt(a^2 + b^2);
      return c;
  }
  ```
* The function is called like this:
  ```c#
  float length = Pythagoras(3f, 4f); // now value of length is 5
  ```
* The function definition can be further simplified...
  ```c#
  float Pythagoras(float a, float b) // a^2 + b^2 = c^2
  {
      return Mathf.Sqrt(a^2 + b^2);
  }
  ```
## Note about functions

* Because C# is object-oriented, all functions are *methods* inside *classes*
* We'll dive deeper into these topics in [Chapter 3. Classes and Methods](6-classes-methods.md)
## Exercise 1: Traffic lights
<!-- _backgroundColor: #29366f -->

Create a timed console application for displaying the state of a traffic light.
* ⭐ Print the new color to the console every frame (use `Update()`).

* The first three seconds should be red, the fourth second should be yellow, and from five seconds onwards green.
* So, after the first frame the console would read `The color is RED!`.
* Hint: Use `Time.time`!

## Exercise 1 extras
<!-- _backgroundColor: #29366f -->

* ⭐⭐ Print the color to console only when the light changes.
* ⭐⭐⭐ Create a 3d object. Change the color of its material as a function of time.

  * **Spoiler:** `gameObject.GetComponent<Renderer>().material.color = Color.green;`

