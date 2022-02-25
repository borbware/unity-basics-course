---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->
# Variables and conditionals
## About C#

* C# is a general-purpose object-oriented language
* created by Microsoft in 2000 as a competitor for Java
* Syntax
  * pretty much everything will be inside a class
  * Curly brackets `{` and `}` mark the **bodies** of statements
    * namespaces, classes, functions...
* semicolon at the end of most statements
  * VS code tells if it's missing!

### C# syntax example

```c#
using System;

namespace MyAwesomeProgram
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
        }
    }
}
```

## Variable declaration

1) access modifiers (not necessary, explained later) 
2) type declaration
3) variable name
4) initial value (not necessary) after `=`
5) line ending with `;`

    ```c#
    int number = 1;
    ```

## Commenting
  * one line
    ```c#
    // one line comment
    ```
  * multiline 
    ```c#
    /* this is a
    multi-line
    comment */
    ```
* comments are not executed
* use to 
  1) explain your intent
  2) comment out actual code for testing and debugging

## The most important variable types
  * `bool`: truth value (true / false)
    ```c#
    bool booleanValue = true;
    ```
  * `int`: whole number
    ```c#
    int wholeNumberValue = 3;
    ```
  * `double` & `float`: decimal number (double = double precision)
    ```c#
    float numberValue = 3.0f;
    ```
  * `string`: text field
    ```c#
    string text = "text is here";
    ```
## Unity Console

* Console Window
  * Error messages
  * Debug messages
* `Debug.Log(textVariable)`
  * print stuff into the console 
  * as the name suggests, it's used for *debugging*
  * You can print other variable types as well, not only strings!
* `Debug.LogWarning()`
* `Debug.LogError()`
## Note about string interpolation

  * If you want to include multiple variables per line:
  * start string with `$`, enclose variables in `{` curly braces `}`
  * `Debug.Log($"variable 1: {variable1}, variable 2: {variable2}");`

## Basic arithmetic operations
  * `+` (addition)
  * `-` (subtraction)
  * `*` (multiplication)
  * `/` (division)
## Extra: Modulo operator
<!-- _backgroundColor: black -->
  * `%`
    * modulo operator (remainder)
    * great for looping a range
    * `3 % 5 = 3`
    * `4 % 5 = 4`
    * `5 % 5 = 0`
    * `6 % 5 = 1`
## Exercise 1: Trying out variables
<!-- _backgroundColor: teal -->

* create a new C# script component for an empty GameObject.
* declare two variables `a` and `b` with the type `double`.
* In the `Start()` function, print to console four operations: the sum, difference, fraction and product.

* What happens if either of them is equal to zero?

## Shorthands
  * `++`
    * `i++;` is shorthand for `i += 1;` which is shorthand for `i = i + 1;` 
  * `--`
    * works similarly!
## Conditionals
* `if`
* `if` without curly braces
* `else if`
* `else`
### Conditionals: example
```c#
float temperatureInOulu = 2.3f;
float temperatureInIvalo = -10.9f;

if (temperatureInOulu > temperatureInIvalo)
{
    Console.WriteLine("Oulu is warmer than Ivalo");
}
else if (temperatureInOulu < temperatureInIvalo)
{
    Console.WriteLine("Ivalo is warmer than Oulu");
}
else 
{
    Console.WriteLine("Oulu and Ivalo have the same temperature");
}
```

## Comparison operators
  * less than: `<`
  * less than or equal: `<=`
  * greater than: `>`
  * greater than or equal: `>=`
  * equal to: `==`
  * not equal to: `!=`
## Logical operators
  * not: `!`
  * and: `&&`
  * or: `||`
## Extra conditional: Switch-case statement
<!-- backgroundColor: black -->

```c#
public int intelligence = 5;


void Greet()
{
	switch (intelligence)
	{
	case 5:
		print ("Why hello there good sir! Let me teach you about Trigonometry!");
		break;
	case 4:
		print ("Hello and good day!");
		break;
	case 3:
		print ("Whadya want?");
		break;
	case 2:
		print ("Grog SMASH!");
		break;
	case 1:
		print ("Ulg, glib, Pblblblblb");
		break;
	default:
		print ("Incorrect intelligence level.");
		break;
	}
}
```
## Extra conditional: Ternary operator
<!-- _backgroundColor: black -->

* "Inline if" is done with the ternary operator 
  * `(the if statement) ? (if true) : (if false);`
    ```c#
    message = health > 0 ? "Player is Alive" : "Player is Dead";
    ```
## Exercise 2: Traffic lights
<!-- _backgroundColor: teal -->

Create a timed console application for displaying the state of a traffic light.
* ⭐ Print the new color to the console every frame (use `Update()`).

* The first three seconds should be red, the fourth second should be yellow, and from five seconds onwards green.
* So, after the first frame the console would read `The color is RED!`.
* Hint: Use `Time.time`!

## Exercise 2 Extras
<!-- _backgroundColor: teal -->

* ⭐⭐ Print the color to console only when the light changes.
* ⭐⭐⭐ Create a 3d object. Change the color of its material as a function of time.

  * **Spoiler:** `gameObject.GetComponent<Renderer>().material.color = Color.green;`

