- [C# basics](#c-basics)
  - [Variables and conditionals](#variables-and-conditionals)
    - [most important variable types](#most-important-variable-types)
    - [arithmetic operations](#arithmetic-operations)
    - [conditionals](#conditionals)
    - [Switch-case statement](#switch-case-statement)
  - [Conventions](#conventions)
    - [checking if something exists](#checking-if-something-exists)
  - [Arrays and Loops](#arrays-and-loops)
  - [Classes](#classes)
  - [Enums](#enums)

# C# basics

## Variables and conditionals

- declaration with `=`
- debugging with `Debug.Log()`
### most important variable types
  - `bool`
  - `double`
  - `float`
  - `int`
  - `string`
### arithmetic operations
  - `+`
  - `-`
  - `*`
  - `/`
  - `%`
  - `++`
  - `--`
### conditionals
  - `<`
  - `>`
  - `<=`
  - `>=`
  - `==`
  - `!=`
  - `not` (also: `!`)
  - `and`
  - `or`
- `if`
- inline if 
- `else if`
- `else`


### Switch-case statement

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
- Inline if with the ternary operator
```c#
message = health > 0 ? "Player is Alive" : "Player is Dead";
```
## Conventions

- dot `.` operator
- inheritance with colon `:`
- importing classes with `using`
  - [CTRL+.]
- defining scope with `{}`
- comments
  - one line `//`
  - multiline `/* */`
### checking if something exists
```c#
if (attack != null)
	attack();
```
  - or shorthand: 
```c#
attack?.Invoke();
```

## Arrays and Loops

- arrays and lists
  - Arrays
  - Lists
  - Use Lists if you are changing the size of the array
  - If there are a fixed number of elements, use arrays
  - array methods
    - Find
    - Filter
```c#
public GameObject[] players;

void Start ()
{
	players = GameObject.FindGameObjectsWithTag("Player");
	
	for(int i = 0; i < players.Length; i++)
	{
		Debug.Log("Player Number "+i+" is named "+players[i].name);
	}
}
```

- For
- While
- (Do While)
- Foreach
- Unity's own update loops
  - `Update()`
  - `FixedUpdate()`
  - `LateUpdate()`
    - called every frame after `Update()`.
    - good for something that has to happen after Update (own or any other game object's!)



## Classes
- C# is an object-oriented language (almost everything is a class)
  - all Unity scripts contain a class by default.
- scope
- accessing class members with `.`
- most important access modifiers
  - `public`
  - `private`
  - `protected`
    - like `private`, but inheritors can access the property
  - `virtual`
    - can get overridden by inheritors
- inheritance with `:`
- constructors
  - `this`
- MonoBehaviour class
- reference vs value
  - value types actually contain the value
  - reference types contain the memory address to where the value is stored
  - Value types
	- int
	- float
	- double
	- bool
	- char
	- Structs
    	- Vector3
    	- Quaternion
  - Reference types
    - Classes
      - Transform
      - GameObject
  - 
```c#
//Value type variable
Vector3 pos = transform.position;
pos = new Vector3(0, 2, 0);
// TRANSFORM'S POSITION IS UNAFFECTED!!

//Reference type variable
Transform tran = transform;
tran.position = new Vector3(0, 2, 0);
```
  - Properties with getters & setters
```c#
private int experience;

//Experience is a basic property
public int Experience
{
	get
	{
		//Some other code
		return experience;
	}
	set
	{
		//Some other code
		experience = value;
	}
}
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


## Enums
```c#
public class EnumScript : MonoBehaviour 
{
    enum Direction {North, East, South, West};

        void Start () 
    {
        Direction myDirection;
        
        myDirection = Direction.North;
    }
    
    Direction ReverseDirection (Direction dir)
    {
        if(dir == Direction.North)
            dir = Direction.South;
        else if(dir == Direction.South)
            dir = Direction.North;
        else if(dir == Direction.East)
            dir = Direction.West;
        else if(dir == Direction.West)
            dir = Direction.East;
        
        return dir;     
    }
}
```