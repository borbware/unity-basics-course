---
marp: true
---
<!-- class: invert -->
# Arrays, Lists and Loops
---
## Arrays and lists
- Arrays
- Lists
- Use Lists if you are changing the size of the array
- If there are a fixed number of elements, use arrays
---
- Creating and accessing an array
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
---
## Array methods
  - Find
  - Filter
---
## Loops
- For
- While
- (Do While)
- Foreach
---
## Unity's own update loops
  - `Update()`
  - `FixedUpdate()`
  - `LateUpdate()`
    - called every frame after `Update()`.
    - good for something that has to happen after Update (own or any other game object's!)
---
# Classes
- C# is an object-oriented language (almost everything is a class)
  - all Unity scripts contain a class by default.
- scope
- accessing class members with `.`
---
## Access modifiers
- most important access modifiers
  - `public`
  - `private`
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
## Properties with getters & setters
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
---
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