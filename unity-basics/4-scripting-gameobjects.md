
# 4. Scripting GameObjects

## Important Unity classes

- [Docs: Important Unity Classes](https://docs.unity3d.com/Manual/ScriptingImportantClasses.html)

## Monobehaviour methods

- Unity components are classes that inherit from Monobehaviour
- first, the class is initialized
- then, it's updated and drawn on screen every frame

### Initialization
  - Awake
    - called first
    - called even if script component is not enabled!
  - Start
    - called second, right before the first Update
    - only called if script component IS enabled
### Updating
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


## GameObject
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


### Adding stuff to inspector with code

- public variables
- `[SerializeField]`
- Extra: `[Header("Explainer for UI")]`
  - great for team communication
- `[Range(x,x)]`
  - slider for inspector


## Transform
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