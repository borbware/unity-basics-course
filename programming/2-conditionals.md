---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Conditionals

## Comparison operators
* Comparison operators are used to compare two variables
  * They return either `true` or `false`
* Two variables of any type can be compared with equality operators
  * Equal to: `a == b`
  * Not equal to: `a != b`
* Two **numbers** can be further compared with less/greater operators: 
  * Less than: `a < b`
  * Less than or equal: `a <= b`
  * Greater than: `a > b`
  * Greater than or equal: `a >= b`

## `if`, `else if`, and `else`

- Checks truthfulness of a given statement
- The statements are checked in order, and the first `true` condition is executed 
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

* If you only have one statement inside the `if` statement, curly braces can be left out
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

* The three important logical operators
  * not: `!a`
  * and: `a && b`
  * or: `a || b`
* They can be used for more complicated logic
  
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
* Use the `&&` ("and") operator:
  ```c#
  if (PlayerHealth > 0 && PressedJumpButton)
    PlayerJump();
  ```

## Extra conditional: Switch-case statement
<!-- _backgroundColor: #5d275d -->

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
<!-- _backgroundColor: #5d275d -->
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
  * Can be used for formatting strings
  * The most used one, `\n` represents a **newline**, a.k.a. a line break
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
  * Start a string with `$`, enclose variables in `{` curly braces `}`
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

## Exercise 1: GameObject check
<!-- _backgroundColor: #29366f -->

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