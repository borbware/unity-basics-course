- [C# basics](#c-basics)
  - [Variables and conditionals](#variables-and-conditionals)
  - [Conventions](#conventions)
  - [Arrays and Loops](#arrays-and-loops)
  - [Classes](#classes)
  - [Enums](#enums)
- [Unity basics](#unity-basics)
  - [Monobehaviour methods](#monobehaviour-methods)
  - [Getting Input](#getting-input)
  - [Important Unity classes](#important-unity-classes)
    - [GameObject](#gameobject)
    - [Transform](#transform)
    - [Vector3 & Vector2](#vector3--vector2)
    - [Mathf, Random, Debug](#mathf-random-debug)
    - [Quaternion](#quaternion)
  - [Data persistence between scenes](#data-persistence-between-scenes)
- [Unity advanced](#unity-advanced)
  - [Delayed actions](#delayed-actions)
  - [Delegates and Events (3b)](#delegates-and-events-3b)
    - [Delegates](#delegates)
    - [Events](#events)
    - [Actions](#actions)
    - [Unity Events](#unity-events)
    - [Scriptable object Unity Event](#scriptable-object-unity-event)
  - [Generics, IEnumerable (4c)](#generics-ienumerable-4c)
  - [Scriptable Object](#scriptable-object)
    - [Simple example](#simple-example)
  - [unity main loop, execution order](#unity-main-loop-execution-order)
  - [Entity component system](#entity-component-system)
# C# basics

## Variables and conditionals

- declaration with `=`
- debugging with `Debug.Log()`
- most important variable types
  - `bool`
  - `double`
  - `float`
  - `int`
  - `string`
- arithmetic operations
  - `+`
  - `-`
  - `*`
  - `/`
  - `%`
  - `++`
  - `--`
- conditionals
  - `<`
  - `>`
  - `<=`
  - `>=`
  - `==`
  - `!=`
  - `not`, also `!`
  - `and`
  - `or`
- if
- inline if 
- else if
- else
- switch-case statement
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
- checking if something exists
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
  - `[SerializeField]`
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
# Unity basics
## Monobehaviour methods
- Initialization
  - Awake
    - called first
    - called even if script component is not enabled!
  - Start
    - called second, right before the first Update
    - only called if script component IS enabled
- Updating
  - Time.deltaTime
    - `transform.position += new Vector3(speed * Time.deltaTime, 0.0f, 0.0f);`
  - Update
    - call frequency varies depending on framerate
    - indeterministic
    - beware for lag if using deltatime for calculation
  - FixedUpdate
    - called every 0.2 seconds
    - good for physics calculations
    - deterministic

## Getting Input
- `Input.GetKeyDown(KeyCode.Space)`
  - True for one frame when pressed down 
  - Good for jumps, moving in UI, other discrete actions 
- `Input.GetKey(KeyCode.Space)`
  - True for the duration of pressage
  - Good for movement or other continuous actions
- `Input.GetKeyUp(KeyCode.Space)`
  - True for one frame when we stop pressing a button
  - Needed more rarely than the ones above imo
- More versatile usage with Input mappings
  - `Input.GetButtonDown("Jump")`
  - `Input.GetButton("Jump")`
  - `Input.GetButtonUp("Jump")`
- Input table
  - Edit > Project Settings > Input
  - "positive button"
- GetAxis()
  - sliding scale between -1 and 1
  - Gravity vs Sensitivity
  - Deadzone
  - `float h = Input.GetAxis("Horizontal");`
  - `float h = Input.GetAxisRaw("Horizontal");`
- onMouseDown method
  - detect when gameObject has been clicked on
```c#
	private Rigidbody rb;

    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
    }

    void OnMouseDown()
    {
        rb.AddForce(-transform.forward * 500f);
        rb.useGravity = true;
    }
```


## Important Unity classes

- https://docs.unity3d.com/Manual/ScriptingImportantClasses.html
### GameObject
- special unity classes that inherit monobehaviour
- gameobjects include components
  - refer:
    - `component = GetComponent<ComponentType>();`
  - enabling/disabling components
    - disable/enable:
      - `component.enabled = false;` (or true)
      - how to toggle?
- can have child gameobjects
  - they inherint translation & rotation and activeness
- activating/disabling gameobjects
  - Inspector: checkbox left to name
  - `gameObject.SetActive(false);`
    - will deactivate the object AND ITS CHILDREN.
  - `myObject.activeSelf`
    - false tells if this _particular_ object has been deactivated
    - if true, can still be deactivated if a parent is deactivated
  - `myObject.activeInHierarchy`
    - "is myObject really active right now?"
    - false tells if this object is deactivated by itself or by its parents
  - `Destroy()`
  - `Instantiate()`
### Transform
- translation & rotation
```c#
if(Input.GetKey(KeyCode.UpArrow))
	transform.Translate(Vector3.forward * moveSpeed * Time.deltaTime);

if(Input.GetKey(KeyCode.DownArrow))
	transform.Translate(-Vector3.forward * moveSpeed * Time.deltaTime);

if(Input.GetKey(KeyCode.LeftArrow))
	transform.Rotate(Vector3.up, -turnSpeed * Time.deltaTime);

if(Input.GetKey(KeyCode.RightArrow))
	transform.Rotate(Vector3.up, turnSpeed * Time.deltaTime);
```
- LookAt
  - `transform.LookAt(target);`
- AddForce
### Vector3 & Vector2
- Understanding Vector Arithmetic
  - https://docs.unity3d.com/2019.3/Documentation/Manual/UnderstandingVectorArithmetic.html
- Vector2
  - https://docs.unity3d.com/ScriptReference/Vector2.html
- Vector3
  - https://docs.unity3d.com/ScriptReference/Vector3.html
  - https://docs.unity3d.com/ScriptReference/Vector3.Dot.html
  - https://docs.unity3d.com/ScriptReference/Vector3-magnitude.html

### Mathf, Random, Debug
- Mathf
  - https://docs.unity3d.com/Manual/class-Mathf.html
  - https://docs.unity3d.com/ScriptReference/Mathf.html
  - Trigonometric functions
    - radians
    - Sin, Cos, Tan, Asin, Acos, Atan, Atan2
    - Rad2Deg, Deg2Rad
    - PI
  - Pow, Sqrt, Exp, Log
  - Interpolation
    - Lerp, LerpAngle, LerpUnclamped
    - InverseLerp
    - Slerp
    - SmoothDamp(Angle)
    - SmoothStep
    - MoveTowards(Angle)
    - https://learn.unity.com/tutorial/linear-interpolation?uv=2019.3&courseId=5c61706dedbc2a324a9b022d&projectId=5c8920b4edbc2a113b6bc26a#5c8a48bdedbc2a001f47cef6
  - Limit, repeat
    - Max, Min
    - Repeat, PingPong
    - Clamp, Clamp01
    - Ceil, Floor
### Quaternion
  - A four-dimensional extension of complex numbers with three imaginary axes
  - WHAT??????
  - What you really need to know about them:
    - They're used for representing rotation angles instead of Euler angles that can result in a _gimbal lock_
    - Most Unity devs don't _really_ need to understand the underlying maths
  - So, rotation is stored as a quaternion
    - four components: x, y, z, w
  - ...but rotation is _shown_ in Inspector with Euler angles
  - never adjust Quaternion components independently, use ready-made functions from the Quaternion class
  - `transform.rotation = Quaternion.LookRotation(target.position - transform.position)`
  - `transform.rotation = Quaternion.LookRotation(target.position - transform.position, new Vector3.Up)`
 - Slerp
```c#
Vector3 relativePos = (target.position + new Vector3(0,.5f,0)) - transform.position;

transform.localRotation = Quaternion.Slerp(transform.localRotation, Quaternion.Lookrotation(relativePos), Time.deltaTime);

transform.Translate(0,0, 3 * Time.deltaTime);
```
## Data persistence between scenes
- https://learn.unity.com/tutorial/implement-data-persistence-between-scenes?pathwayId=5f7e17e1edbc2a5ec21a20af#
- DontDestroyOnLoad
- Static classes & class members
- singleton pattern
# Unity advanced
## Delayed actions
- Invoke
  - if you want to execute something _after_ a given time delay. 
  - Invoke
```c#
    void Start()
    {
        Invoke ("SpawnObject", 2);
    }
    
    void SpawnObject()
    {
        Instantiate(target, new Vector3(0, 2, 0), Quaternion.identity);
    }
```
  - InvokeRepeating
    - "Call first after two second, then repeat every one second"
```c#
	void Start()
    {
        InvokeRepeating("SpawnObject", 2, 1);
    }
    
    void SpawnObject()
    {
        float x = Random.Range(-2.0f, 2.0f);
        float z = Random.Range(-2.0f, 2.0f);
        Instantiate(target, new Vector3(x, 2, z), Quaternion.identity);
    }
```
   - `CancelInvoke("SpawnObject");`
- Coroutine
  - if you want to execute something _during_ a given time
  - Basically it's a function that is executed until the yield statement is reached, and continued on the next frame OR after a specified time delay
    -> We can have multiple delays!
    - Excellent for sequenced events (cutscenes!)
  - https://docs.unity3d.com/Manual/Coroutines.html
  - https://learn.unity.com/tutorial/coroutines?uv=2019.3&projectId=5c88f2c1edbc2a001f873ea5#5c894522edbc2a14103553c5



## Delegates and Events (3b)

### Delegates
- Delegate: a container for a function that can be passed around or used like a variable
- variables only contain data, but delegates can contain functions
- let's create a delegate signature - a reference for a type of delegate
  - you can declare its return type and parameter types:
```c#
public delegate void OnGameOver(int level);
public static OnGameOver onGameOver;
```
- how to change between two active attacks with a delegate:
```c#
// https://gamedevbeginner.com/events-and-delegates-in-unity/
public class DelegateExample : MonoBehaviour
{
    delegate void MyDelegate();
    MyDelegate attack;

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            if (attack != null)
            {
                attack();
            }
        }

        if (Input.GetKeyDown(KeyCode.Alpha1))
        {
            attack = PrimaryAttack;
        }

        if (Input.GetKeyDown(KeyCode.Alpha2))
        {
            attack = SecondaryAttack;
        }
    }

    void PrimaryAttack()
    {
        // Primary attack
    }

    void SecondaryAttack()
    {
        // Secondary attack
    }
}
```
- multicasting with +=
  - https://learn.unity.com/tutorial/delegates?uv=2019.3&projectId=5c88f2c1edbc2a001f873ea5#5c894658edbc2a0d28f48aee 
```c#
delegate void MyDelegate(); 
MyDelegate attack;

void Start()
{
    attack += PrimaryAttack; 
    attack += SecondaryAttack; 
}
```
- now both PrimaryAttack and SecondaryAttack trigger when attack is called.

### Events
- observer pattern
  - http://gameprogrammingpatterns.com/observer.html
- Events are specialized multicast delegates
- can only be triggered from within their own class, not from elsewhere
```c#
public class Player : MonoBehaviour
{
	public void Start()
	{
		PlayerHealth.onGameOver += RestartGame;
	}

	private void RestartGame()
	{
		// do stuff
	}
}
```

```c#
public class PlayerHealth : MonoBehaviour
{
	public delegate void OnGameOver();
	public static event OnGameOver onGameOver;
}
```

- https://learn.unity.com/tutorial/events-uh?uv=2019.3&projectId=5c88f2c1edbc2a001f873ea5#5c894782edbc2a1410355442

### Actions 
- it can sometimes be inconvenient to declare a new delegate type every time you want to use one
- especially if all you want to do is create a basic event
- Actions allow you to use a generic delegate type without needing to define it in your script first
```c#
// this...
public static event Action OnGameOver;

// ...is basically the same as this
public delegate void OnGameOver();
public static event OnGameOver onGameOver;
```
- adding parameters
```c#
public static event Action<string> OnGameOver;
public static event Action<float, bool> OnPlayerHurt;
```
- calling with parameters
```c#
public static event Action<string> OnGameOver;

public void TakeDamage(float damage)
{
    health -= damage;
    if(health < 0)
    {
        OnGameOver?.Invoke("The game is over");
    }
}
```



### Unity Events
- to confuse matters further, Unity has its own Unity Event system as well.
- good stuff
  - you won't need to nullcheck Unity Events.
  - Unity Events have special controls in Inspector
    - contains the list of event function calls
    - add function calls by drag-and-dropping
  - thus, extremely useful for making logical connections between scripts in the Inspector

```c#
using UnityEngine;
using UnityEngine.Events;

public class PlayerHealth : MonoBehaviour
{
    float health=100;
    public UnityEvent onPlayerDeath;

    public void TakeDamage(float damage)
    {
        health -= damage;
        if(health < 0)
        {
            onPlayerDeath.Invoke();
        }
    }
}
```
- Unity events with parameters
```c#
using UnityEngine.Events;
using System;

[Serializable]
public class FloatEvent : UnityEvent <float> { }
```
```c#
using UnityEngine;
using UnityEngine.Events;

public class PlayerHealth : MonoBehaviour
{
    float health=100;
    public UnityEvent onPlayerDeath;
    public FloatEvent onPlayerHurt;

    public void TakeDamage(float damage)
    {
        health -= damage;
        onPlayerHurt.Invoke(damage);
        if(health < 0)
        {
            onPlayerDeath.Invoke();
        }
    }
}
```
```c#
public class HealthBar : MonoBehaviour
{
    public void UpdateHealthBar(float value)
    {
        Debug.Log(value + " health was removed");
    }
}
```
- bad stuff
  - Hooking up scripts in the Inspector requires you to make a manual connection which may not work well for different objects in the scene, especially if they’re created as the game runs.
  - when connecting events between unrelated objects, you may find it more useful to use event delegates instead.
  - to overcome this, there's the Scriptable Object Unity Event :)))))))

### Scriptable object Unity Event

```c#
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(menuName ="Game Event")]
public class GameEvent : ScriptableObject
{
    private List<GameEventListener> listeners = new List<GameEventListener>();

    public void TriggerEvent()
    {
        for (int i = listeners.Count -1; i >= 0; i--)
        {
            listeners[i].OnEventTriggered();
        }
    }

    public void AddListener(GameEventListener listener)
    {
        listeners.Add(listener);
    }

    public void RemoveListener(GameEventListener listener)
    {
        listeners.Remove(listener);
    }
}
```

```c#
using UnityEngine;
using UnityEngine.Events;

public class GameEventListener : MonoBehaviour
{
    public GameEvent gameEvent;
    public UnityEvent onEventTriggered;

    void OnEnable()
    {
        gameEvent.AddListener(this);
    }

    void OnDisable()
    {
        gameEvent.RemoveListener(this);
    }

    public void OnEventTriggered()
    {
        onEventTriggered.Invoke();
    }
}
```

## Generics, IEnumerable (4c)





## Scriptable Object
- class for storing data
- usually used an asset template
  - can be made accessible from the Create Asset menu!
- derives from the base Unity object but cannot be attached to a GameObject
- life-saver if gameobject needs easily-swappable data
- [Scriptable Object in Unity Docs](https://docs.unity3d.com/Manual/class-ScriptableObject.html)
- [Brackeys tutorial](https://www.youtube.com/watch?v=aPXvoWVabPY)

### Simple example

- Create new class that inherits from ScriptableObject

```c#
using UnityEngine;

[CreateAssetMenu(fileName = "New Mana Card", menuName = "Cards/ManaCard")]
public class Card : ScriptableObject
{
    public new string name;
    public string description;
    public int amountOfMana;
    public ManaEnum manaType;
}
```

- Create a few new templates based on the Scriptable object from the Asset menu
- Refer to the Card class as a SerializeField in a GameObject
- drag the card template of your choice to the field in Inspector
- ta-da, the data from Card is now available in the gameobject



```c#
using UnityEngine;

[CreateAssetMenu(fileName = "Spawn Manager", menuName = "ScriptableObjects/SpawnManagerScriptableObject", order = 1)]
public class SpawnManagerScriptableObject : ScriptableObject
{
    public string prefabName;
    public int numberOfPrefabsToCreate;
    public Vector3[] spawnPoints;
}
```

```c#
using UnityEngine;

public class Spawner : MonoBehaviour
{
    // The GameObject to instantiate.
    public GameObject entityToSpawn;

    // An instance of the ScriptableObject defined above.
    public SpawnManagerScriptableObject spawnManagerValues;

    // This will be appended to the name of the created entities and increment when each is created.
    int instanceNumber = 1;

    void Start()
    {
        SpawnEntities();
    }

    void SpawnEntities()
    {
        int currentSpawnPointIndex = 0;

        for (int i = 0; i < spawnManagerValues.numberOfPrefabsToCreate; i++)
        {
            // Creates an instance of the prefab at the current spawn point.
            GameObject currentEntity = Instantiate(entityToSpawn, spawnManagerValues.spawnPoints[currentSpawnPointIndex], Quaternion.identity);

            // Sets the name of the instantiated entity to be the string defined in the ScriptableObject and then appends it with a unique number. 
            currentEntity.name = spawnManagerValues.prefabName + instanceNumber;

            // Moves to the next spawn point index. If it goes out of range, it wraps back to the start.
            currentSpawnPointIndex = (currentSpawnPointIndex + 1) % spawnManagerValues.spawnPoints.Length;

            instanceNumber++;
        }
    }
}
```

## unity main loop, execution order

## Entity component system

- salama-tuli-vesi systeemi