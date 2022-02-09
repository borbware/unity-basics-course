
# Unity basics

## Monobehaviour methods

- Unity components inherit from Monobehaviour
- Initialization
  - Awake
    - called first
    - called even if script component is not enabled!
  - Start
    - called second, right before the first Update
    - only called if script component IS enabled
- Updating
  - Time.deltaTime
    - deltatime is the time spent between update calls
      - `1 / FPS`
    - using deltatime for framerate-independent movement
      - `transform.position += new Vector3(speed * Time.deltaTime, 0.0f, 0.0f);`
  - Update
    - call frequency varies depending on framerate
    - indeterministic
    - beware for lag spikes if using deltatime for calculation
  - FixedUpdate
    - called every 0.2 seconds
    - used mainly for physics calculations
    - can't be used for checking player input

- [Stack Overflow: Component vs Behaviour vs Monobehaviour](https://stackoverflow.com/questions/44540747/what-is-the-difference-between-component-behaviour-and-monobehaviour-and-why-t)

## Getting Input

See: [Input](#input)


## Adding stuff to inspector with code

- public variables
- `[SerializeField]`
- Extra: `[Header("Explainer for UI")]`
  - great for team communication
- `[Range(x,x)]`
  - slider for inspector

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

### Mathf, Random, Debug

See: [Math](math.md#Mathf,-Random,-Debug)

### Vector3 & Vector2

See: [Math](math.md#Mathf,-Random,-Debug)

## Data persistence between scenes
- https://learn.unity.com/tutorial/implement-data-persistence-between-scenes?pathwayId=5f7e17e1edbc2a5ec21a20af#
- DontDestroyOnLoad
- Static classes & class members
- singleton pattern