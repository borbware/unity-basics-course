---
marp: true
---
<!-- class: invert -->
# Variables and conditionals
---
## Declaration

- variable declaration with `=`
- line ending with `;`
- type declaration
```c#
int number = 1;
```
---
## Unity Console

- print stuff into the console with `Debug.Log()`
  - as the name suggests, it's used for *debugging*
- Console Window
  - Error messages
  - Debug messages
---
## The most important variable types
  - `bool`: truth value (true / false)
```c#
bool booleanValue = true;
```
  - `int`: whole number
```c#
int wholeNumberValue = 3;
```
  - `double` & `float`: decimal number (double = double precision)
```c#
float numberValue = 3.0f;
```
  - `string`: text field
```c#
string text = "text is here";
```

---
## Basic arithmetic operations
  - `+`
  - `-`
  - `*`
  - `/`
---
## Modulo
  - `%`
    - modulo operator (remainder)
    - great for looping a range
    - `3 % 5 = 3`
    - `4 % 5 = 4`
    - `5 % 5 = 0`
    - `6 % 5 = 1`
---
## Shorthands
  - `++`
    - `i++;` is shorthand for `i += 1;` is shorthand for `i = i + 1;` 
  - `--`
    - guess what this is!
---
## Conditionals
- `if`
- `if` without curly braces
- `else if`
- `else`
---
## Comparison operators
  - `<`
  - `>`
  - `<=`
  - `>=`
  - `==`
  - `!=`
  - `not` (also: `!`)
  - `and`
  - `or`
---
## Extra conditional: Switch-case statement

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
---
## Extra conditional: Ternary operator

- "Inline if" is done with the ternary operator 
  - `(the if statement) ? (if true) : (if false);`
```c#
message = health > 0 ? "Player is Alive" : "Player is Dead";
```
---
# Conventions
---
## Comments and stuff
- dot `.` operator
- inheritance with colon `:`
- importing classes with `using`
  - `[CTRL+.]`
- defining scope with `{}`
- comments
  - one line `//`
  - multiline `/* */`
---
## checking if something exists
```c#
if (attack != null)
	attack();
```
  - or shorthand: 
```c#
attack?.Invoke();
```

