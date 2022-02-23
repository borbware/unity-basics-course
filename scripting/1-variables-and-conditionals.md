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
## Commenting
  - one line `//`
  - multiline `/* */`
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
## Unity Console

- Console Window
  - Error messages
  - Debug messages
- `Debug.Log(textVariable)`
  - print stuff into the console 
  - as the name suggests, it's used for *debugging*
  - You can print other variable types as well, not only strings!
- `Debug.LogWarning()`
- String interpolation
  - If you want to include multiple variables per line:
  - start string with `$`, enclose variables in `{` curly braces `}`
  - `Debug.Log($"variable 1: {variable1}, variable 2: {variable2}");`

---
## Basic arithmetic operations
  - `+` (addition)
  - `-` (subtraction)
  - `*` (multiplication)
  - `/` (division)
---
<!-- backgroundColor: black -->
## Extra: Modulo operator
  - `%`
    - modulo operator (remainder)
    - great for looping a range
    - `3 % 5 = 3`
    - `4 % 5 = 4`
    - `5 % 5 = 0`
    - `6 % 5 = 1`
---
<!-- backgroundColor: teal -->
## Exercise 1: Trying out variables

- create a new C# script component for an empty GameObject.
- declare two variables `a` and `b` with the type `double`.
- In the `Start()` function, print to console four operations: the sum, difference, fraction and product.

- What happens if either of them is equal to zero?

---
## Shorthands
<!-- backgroundColor: default -->
  - `++`
    - `i++;` is shorthand for `i += 1;` which is shorthand for `i = i + 1;` 
  - `--`
    - works similarly!
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
<!-- backgroundColor: teal -->
## Exercise 2: Traffic lights

Create a timed console application for displaying the state of a traffic light.
- ⭐ Print the new color to the console every frame (use `Update()`).

- The first three seconds should be red, the fourth second should be yellow, and from five seconds onwards green.
- So, after the first frame the console would read `The color is RED!`.
- Hint: Use `Time.time`!

---
## Exercise 2 Extras

- ⭐⭐ Print the color to console only when the light changes.
- ⭐⭐⭐ Create a 3d object. Change the color of its material as a function of time.

  - **Spoiler:** `gameObject.GetComponent<Renderer>().material.color = Color.green;`

---
<!-- backgroundColor: default -->
## Extra: checking if something exists
```c#
if (attack != null)
	attack();
```
  - or shorthand: 
```c#
attack?.Invoke();
```

