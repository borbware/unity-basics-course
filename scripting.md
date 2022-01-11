# Topics

## Basics





### Variables and conditionals

- declaration with =
- debugging with Debug.Log()
- most important variable types
  - bool
  - double
  - float
  - int
  - string
- arithmetic operations
  - +
  - -
  - *
  - /
  - %
  - ++
  - --
- conditionals
  - <
  - >
  - <=
  - >=
  - ==
  - !=
  - not
  - and
  - or
- if
- inline if 
- else if
- else
- switch-case statement
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

### Conventions

- dot operator
- inheritance with :
- "using"
  - ctrl + .
- scope with {}
- comments
  - //
  - /* */
- 

### Arrays and Loops

- arrays and lists
  - Arrays
  - Lists
  - Use Lists if you are changing the size of the array
  - If there are a fixed number of elements, use arrays
  - 
    public GameObject[] players;

    void Start ()
    {
        players = GameObject.FindGameObjectsWithTag("Player");
        
        for(int i = 0; i < players.Length; i++)
        {
            Debug.Log("Player Number "+i+" is named "+players[i].name);
        }
    }


- For
- While
- Do While
- Foreach
- Unity's own update loops
  - Update
  - FixedUpdate



### Classes
- C# is an object-oriented language (almost everything is a class)
  - all Unity scripts contain a class by default.
- scope
- accessing class members
  - dot operator
  - most important access modifiers
    - public
    - private
    - [SerializeField]
- inheritance with :
- MonoBehaviour class
- constructors
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
  -     //Value type variable
        Vector3 pos = transform.position;
        pos = new Vector3(0, 2, 0);
		// TRANSFORM'S POSITION IS UNAFFECTED!!
        
        //Reference type variable
        Transform tran = transform;
        tran.position = new Vector3(0, 2, 0);


### Monobehaviour methods
- Initialization
  - Awake
    - called first
    - called even if script component is not enabled!
  - Start
    - called second, right before the first Update
    - only called if script component IS enabled
- Updating
  - Time.deltaTime
    - transform.position += new Vector3(speed * Time.deltaTime, 0.0f, 0.0f);
  - Update
    - call frequency varies depending on framerate
    - indeterministic
    - beware for lag if using deltatime for calculation
  - FixedUpdate
    - called every 0.2 seconds
    - good for physics calculations
    - deterministic

### Vector maths
- Vector2
  - https://docs.unity3d.com/ScriptReference/Vector2.html
- Vector3
  - https://docs.unity3d.com/ScriptReference/Vector3.html
  - https://docs.unity3d.com/ScriptReference/Vector3.Dot.html
  - https://docs.unity3d.com/ScriptReference/Vector3-magnitude.html


### Moving stuff around
- translation & rotation
        if(Input.GetKey(KeyCode.UpArrow))
            transform.Translate(Vector3.forward * moveSpeed * Time.deltaTime);
        
        if(Input.GetKey(KeyCode.DownArrow))
            transform.Translate(-Vector3.forward * moveSpeed * Time.deltaTime);
        
        if(Input.GetKey(KeyCode.LeftArrow))
            transform.Rotate(Vector3.up, -turnSpeed * Time.deltaTime);
        
        if(Input.GetKey(KeyCode.RightArrow))
            transform.Rotate(Vector3.up, turnSpeed * Time.deltaTime);
- LookAt
  - transform.LookAt(target);
- AddForce

### Linear interpolation
- https://learn.unity.com/tutorial/linear-interpolation?uv=2019.3&courseId=5c61706dedbc2a324a9b022d&projectId=5c8920b4edbc2a113b6bc26a#5c8a48bdedbc2a001f47cef6


### Getting Input
- Input.GetKeyDown(KeyCode.Space)
  - True for one frame when pressed down 
  - Good for jumps, moving in UI, other discrete actions 
- Input.GetKey(KeyCode.Space)
  - True for the duration of pressage
  - Good for movement or other continuous actions
- Input.GetKeyUp(KeyCode.Space)
  - True for one frame when we stop pressing a button
  - Needed more rarely than the ones above imo
- More versatile usage with Input mappings
  - Input.GetButtonDown("Jump")
  - Input.GetButton("Jump")
  - Input.GetButtonUp("Jump")
- Input table
  - Edit > Project Settings > Input
  - "positive button"
- GetAxis()
  - sliding scale between -1 and 1
  - Gravity vs Sensitivity
  - Deadzone
  - float h = Input.GetAxis("Horizontal");
  - float h = Input.GetAxisRaw("Horizontal");
- onMouseDown method
  - detect when gameObject has been clicked on
  - private Rigidbody rb;

    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
    }

    void OnMouseDown ()
    {
        rb.AddForce(-transform.forward * 500f);
        rb.useGravity = true;
    }
  - 

### GameObjects
- special unity classes that inherit monobehaviour
- gameobjects include components
  - refer:
    - component = GetComponent<ComponentType>();
  - enabling/disabling components
    - disable/enable:
      - component.enabled = false / true;
      - how to toggle?
- can have child gameobjects
  - they inherint translation & rotation and activeness
- activating/disabling gameobjects
  - Inspector: checkbox left to name
  - gameObject.SetActive(false);
    - will deactivate the object AND ITS CHILDREN.
  - myObject.activeSelf
    - false tells if this _particular_ object has been deactivated
    - if true, can still be deactivated if a parent is deactivated
  - myObject.activeInHierarchy
    - "is myObject really active right now?"
    - false tells if this object is deactivated by itself or by its parents
  - Destroy()
  - Instantiate()

# Delayed actions
- Invoke
  - Invoke
    -     void Start()
    {
        Invoke ("SpawnObject", 2);
    }
    
    void SpawnObject()
    {
        Instantiate(target, new Vector3(0, 2, 0), Quaternion.identity);
    }
  - InvokeRepeating
    - "Call first after two second, then repeat every one second"
    -     void Start()
    {
        InvokeRepeating("SpawnObject", 2, 1);
    }
    
    void SpawnObject()
    {
        float x = Random.Range(-2.0f, 2.0f);
        float z = Random.Range(-2.0f, 2.0f);
        Instantiate(target, new Vector3(x, 2, z), Quaternion.identity);
    }
   - CancelInvoke("SpawnObject");
- Coroutine
  - A function that is executed until the yield statement is reached, and continued on the next frame or after a specified time delay
  - Excellent for time delays, sequenced events (cutscenes!)
  - https://docs.unity3d.com/Manual/Coroutines.html


# Enums
- public class EnumScript : MonoBehaviour 
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

# Delegates and Events (3b)
- creating an event system
- https://learn.unity.com/tutorial/events-uh?uv=2019.3&projectId=5c88f2c1edbc2a001f873ea5#5c894782edbc2a1410355442

# Generics, IEnumerable (4c)

# 

# ScriptableObject
	asdfasdf