---
marp: true
---
<!-- class: invert -->
# Classes and methods
---

## Classes & objects

- C# is an object-oriented language (almost everything is a class)
  - all Unity scripts contain a class by default!
- *class* is an instruction to create a data collection of certain kind.
  - "Idea of a table"
- *instance* of a class is an implementation of that class.
  - "This table right here"
  - usually, the term *object* also refers to an instance of a class
---
## Class members
- accessing class members with the dot `.` operator
  - when we're *inside* the class, we can just use the member name
  - `someGameObject.transform.position` 
  - `transform.position`

---
- inheritance with colon `:`
- importing classes with `using`
  - `[CTRL+.]`
- defining scope with `{}`


---
## Case convention

- `GameObject gameObject`
- types start with uppercase, instances with lowercase!



---
## Access modifiers
- most important access modifiers
  - `public`
  - `private` (default!)
  - `protected`
    - like `private`, but inheritors can access the property
  - `virtual`
    - can get overridden by inheritors
---
## Inheritance
- inheritance with `:`
- constructors
  - `this`
- MonoBehaviour class
---
## Reference vs value
  - value types actually contain the value
  - reference types contain the memory address to where the value is stored
  - Value types
  	- int, float, double
  	- bool
  	- char
  	- Structs
      	- Vector3
      	- Quaternion
  - Reference types
    - Classes
      - Transform
      - GameObject
---
```c#
//Value type variable
Vector3 pos = transform.position;
pos = new Vector3(0, 2, 0);
// TRANSFORM'S POSITION IS UNAFFECTED!!

//Reference type variable
Transform tran = transform;
tran.position = new Vector3(0, 2, 0);
```
---
## Extra: Properties with getters & setters
```c#
private int experience;

public int Experience //Experience is a basic property
{
	get
	{
		//do stuff
		return experience;
	}
	set
	{
		//do stuff
		experience = value;
	}
}
```
---
```c#
//Level is a property that converts experience
//points into the leve of a player automatically
public int Level
{
	get
	{
		return experience / 1000;
	}
	set
	{
		experience = value * 1000;
	}
}
//This is an example of an auto-implemented
//property
public int Health{ get; set;}
```
