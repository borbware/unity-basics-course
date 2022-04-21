---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->
# Variables and conditionals

# Variables
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
## Basic arithmetic operations
  * `+` (addition)
  * `-` (subtraction)
  * `*` (multiplication)
  * `/` (division)

## Extra: Modulo operator
<!-- _backgroundColor: pink -->
  * `%`
    * modulo operator (remainder)
    * great for looping a range
    * `3 % 5 = 3`
    * `4 % 5 = 4`
    * `5 % 5 = 0`
    * `6 % 5 = 1`
## Exercise 1: Trying out variables
<!-- _backgroundColor: Khaki -->

* create a new Unity project for simple programming exercises.
* create a new C# script component for an empty GameObject.
* declare two variables `a` and `b` with the type `double`.
* In the `Start()` function, print to console four operations: the sum, difference, fraction and product.

* What happens if either of them is equal to zero?

# Conditionals
## Comparison operators
* comparison operators are used to compare two variables
  * return either `true` or `false`
* two variables of any type can be compared with equality operators
  * equal to: `a == b`
  * not equal to: `a != b`
* two **numbers** can be further compared with less/greater operators: 
  * less than: `a < b`
  * less than or equal: `a <= b`
  * greater than: `a > b`
  * greater than or equal: `a >= b`

## `if`, `else if`, and `else`

- checks the truthfulness of a given statement
- the statements are checked in order, and the first `true` condition is executed 
```c#
float temperatureInOulu = 2.3f;
float temperatureInIvalo = -10.9f;

if (temperatureInOulu > temperatureInIvalo)
{
    Debug.Log("Oulu is warmer than Ivalo");
}
else if (temperatureInOulu < temperatureInIvalo)
{
    Debug.Log("Ivalo is warmer than Oulu");
}
else 
{
    Debug.Log("Oulu and Ivalo have the same temperature");
}
```



### Single statement if

* if you only have one statement inside the `if` statement, curly braces can be left out
  ```c#
  if (temperatureInOulu > temperatureInIvalo)
  {
      Debug.Log("Oulu is warmer than Ivalo");
  }
  ```
  is the same as
  ```c#
  if (temperatureInOulu > temperatureInIvalo)
      Debug.Log("Oulu is warmer than Ivalo");
  ```
* You can even write the statement and the block to the same line!
  ```c#
  if (baa > 20) Debug.Log("Baa");
  else Debug.Log("Not baa!");
  ```

## Not operator `!`

```c#
bool itsColdOutside = true;
```

* `!` in front of a boolean value flips it from `true` to `false`, and vice versa
  
  ```c#
  if (!itsColdOutside)
      Debug.Log("It's warm outside.");
  ```
  is the same as
  ```c#
    if (itsColdOutside == false)
      Debug.Log("It's warm outside.");
  ```

## Assignment operators

* We have used the assignment operator `=` for assigning values for variables
  ```c#
  int x;
  x = 25;
  ```
* _Notice the difference between `=` and the conditional `==`!_
  * `=` is used for **assigning** values for variables, `==` is used for **comparing** values

## Assignment Shorthands
  * these three examples do the same thing:
    * `i = i + 1;` 
    * `i += 1;`
    * `i++;`
  * works similarly for subtraction, multiplication, division, modulo

## Logical operators

* the three important logical operators
  * not: `!a`
  * and: `a && b`
  * or: `a || b`
* can be used for more complicated logic
* 
```c#
int a = 1;
int b = 3;
int c = 5;

Debug.Log(a < b && a < c);  // prints true
```

### Logical operator example

* So, instead of nesting `if` statements like this:
  ```c#
  if (PlayerHealth > 0)
    if (PressedJumpButton)
      PlayerJump();
  ```
* Use the `and` operator:
  ```c#
  if (PlayerHealth > 0 && PressedJumpButton)
    PlayerJump();
  ```

## Extra conditional: Switch-case statement
<!-- _backgroundColor: pink -->

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
<!-- _backgroundColor: pink -->
* "Inline if" is done with the ternary operator 
  * `(the if statement) ? (if true) : (if false);`
    ```c#
    message = health > 0 ? "Player is Alive" : "Player is Dead";
    ```

## Strings

* String is a variable containing block of text
  * (Actually, a special type of variable containing an [*array*](2-lists-loops.md) of characters)

  ```c#
  string name = "Matti Teppo";
  ```

* You can *concatenate* (combine) multiple strings with the `+` operator:
  ```c#
  string firstName = "Matti";
  string lastName = "Teppo";
  string fullName = firstName + " " + lastName;

  Debug.Log(fullName);    // Outputs "Matti Teppo"
  ```

## Special characters

* Special *character constants* are preceded by a backslash `\`
  * can be used for formatting strings
  * the most used one, `\n` represents a **newline**, a.k.a. a line break
  ```c#
  string firstName = "Matti";
  string lastName = "Teppo";
  string fullName = firstName + "\n" + lastName;

  Debug.Log(fullName);
  /* This outputs:
  Matti
  Teppo
  */
  ```

## String interpolation

* Concatenating multiple variables into one string with `+` quickly becomes tedious
* It's much easier to use **string interpolation**
  * start string with `$`, enclose variables in `{` curly braces `}`
    ```c#
    string animal = "Dog";
    string sound = "Woof";
    Debug.Log($"{animal} says {sound}!");
    // Outputs "Dog says Woof!"
    ```

* Very useful e.g., for printing multiple variables in one log statement:


  ```c#
  Debug.Log($"variable 1: {variable1}, variable 2: {variable2}");
  ```

## Exercise 2: GameObject check
<!-- _backgroundColor: Khaki -->

Create a C# script that checks if the GameObject is 
* a player or
* an enemy.

Give the GameObject a string variable `EntityType` that tells which of the two it is. 

Depending on its value, 
a) Set the HP value of the gameObject to 50 or 10.
b) print to console either `"I am Player! My HP is 50!"` or `"I am Enemy! My HP is 10!"`

What happens if

a) EntityType is something else
b) EntityType is not declared at all?

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

* to avoid repetition, blocks of code can be enclosed into named *functions*
* functions can have multiple arguments and a return type
  ```c#
  void PrintName(string argument1)
  {
      Debug.Log("My name is " + argument1);
  }
  ```
  * takes in one `string` argument
  * returns nothing (thus, its return type is `void`)
  * the function can be called like this:
    ```c#
    PrintName("Matti");
    string name2 = "Teppo";
    PrintName(name2);
    ```

### Function example
* here's an example with two arguments and a non-void return value
* the `return` keyword tells what we return from the function 
  ```c#
  float Pythagoras(float a, float b) // a^2 + b^2 = c^2
  {
      float c = Mathf.Sqrt(a^2 + b^2);
      return c;
  }
  ```
* the function is called like this:
  ```c#
  float length = Pythagoras(3f, 4f); // now value of length is 5
  ```
* the function definition can be further simplified...
  ```c#
  float Pythagoras(float a, float b) // a^2 + b^2 = c^2
  {
      return Mathf.Sqrt(a^2 + b^2);
  }
  ```
## Note about functions

* because C# is object-oriented, all functions are *methods* inside *classes*
* We'll dive deeper into these topics in [Chapter 3. Classes and Methods](3-classes-methods.md)
## Exercise 3: Traffic lights
<!-- _backgroundColor: Khaki -->

Create a timed console application for displaying the state of a traffic light.
* ⭐ Print the new color to the console every frame (use `Update()`).

* The first three seconds should be red, the fourth second should be yellow, and from five seconds onwards green.
* So, after the first frame the console would read `The color is RED!`.
* Hint: Use `Time.time`!

## Exercise 2 extras
<!-- _backgroundColor: Khaki -->

* ⭐⭐ Print the color to console only when the light changes.
* ⭐⭐⭐ Create a 3d object. Change the color of its material as a function of time.

  * **Spoiler:** `gameObject.GetComponent<Renderer>().material.color = Color.green;`



## Reading

Microsoft's own [C# Reference](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/) is a great way to dive deeper into the language. 

Some basics covering the syntax in C# are covered here: 

* [Sepeli ry: C# (In Finnish)](https://sepeliry.github.io/c.html)
* https://www.tutorialspoint.com/csharp/index.html
* https://www.w3schools.com/cs/default.asp
