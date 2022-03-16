---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->
# 3. Scripting GameObjects

## Creating a new script

* There are two ways to do it:
  a) *Inspector > Add Component > New Script > Create and Add*
  b) *Project > Right click > Create > C# script*, then drag and drop to a GameObject

## The Script Class

* C# is object-oriented: the script is a new ***Class***
  * it ***inherits*** an Unity class `MonoBehaviour`
* inside the class, we can implement Unity's default ***methods***
  * e.g., `Awake`
* we can also add our own methods
  * e.g., `DoStuffThatWeWant()`
* we can also add new ***fields***: variables inside the class

<!-- _footer: "[More about classes later in Programming 3: Classes and Methods](../programming/3-classes-methods.md)"-->

## Start and update

* a new script includes two ***methods*** by default: `Start` and `Update`
* `Start` is called automatically only once
  * it's used for setting things up when we start using the gameobject
* `Update` is called 

## Initialization
  * There are two functions for initializing a script class
  * `Awake()`
    * called first
    * called even if the script component is not enabled!
  * `Start()`
    * called second, right before the first Update
    * only called if the script component IS enabled

## `Update()`
  * There are three functions for updating a script class
  * `Update()`
    * the frequency of update calls varies depending on framerate
    * most things can be updated here
    * because of framerate-dependence it is *indeterministic*
        * (same input doesn't always produce same output)
## `FixedUpdate()` and `LateUpdate()`
  * `FixedUpdate()`
    * by default, called every 0.2 seconds (50 FPS)
    * used mainly for physics calculations
      * under load, will slow down!
      * not dependent on framerate: *deterministic*
        * (same input always produces same output)
    * ***Note:*** can't be used for checking ButtonDown input
  * `LateUpdate()`
    * called every frame after `Update()`.
    * good for something that has to happen after all game objects have Updated
## Time and Deltatime
* `Time.time`
  * the time passed since starting the game, in seconds
* `Time.deltaTime`
  * deltatime is the time spent between update calls, in seconds
    * relates to FPS, or ***frames per second***
    * `deltatime = 1 / FPS`
  * can be used for accounting for framerate in movement
    ```c#
    Vector3 velocity = new Vector3(speed * Time.deltaTime, 0.0f, 0.0f);
    transform.position += velocity;
    ```
  * beware lag spikes, though: what would `velocity` be if deltatime was equal to one second? Three seconds?

## Variables


## Accessing fields in Inspector

* `public` variables
* `[SerializeField]`
* Extra: `[Header("Explainer for UI")]`
  * great for team communication
* `[Range(x,x)]`
  * adds a slider to inspector





## Components

* accessing components:
  * `OurComponentType ourComponent = ourGameObject.GetComponent<OurComponentType>();`
  * dot notation not needed if getting component of the gameobject the class is part of:
    * `GetComponent<OurComponentType>();`



## Transform

* [ScriptReference: Transform](https://docs.unity3d.com/ScriptReference/Transform.html)
* [Manual: Transform](https://docs.unity3d.com/Manual/class-Transform.html)
* The GameObject's position, rotation and scale can be manipulated via its ***Transform*** component
  * either by using the included methods, or by directly setting fields
  * fields are either ***global*** or ***local***: e.g., `position` vs `localPosition`
  * local coordinates are with respect to the GameObject's ***parent***



### Translation
  * `transform.Translate(Vector3 displacement)`
  * `transform.position`
  * `transform.localPosition`
  ```c#
  if(Input.GetKey(KeyCode.UpArrow))
    transform.Translate(Vector3.forward * moveSpeed * Time.deltaTime);

  if(Input.GetKey(KeyCode.DownArrow))
    transform.Translate(-Vector3.forward * moveSpeed * Time.deltaTime);
  ```
### Rotation

* Rotation methods
  * `transform.Rotate(Vector3 eulerAngles)`
  * `transform.RotateAround(Vector3 pivot)`
  * `transform.LookAt(Transform target)`
* Rotation fields
  * `transform.rotation`, global rotation as a Quaternion
  * `transform.localRotation`, local rotation as a 
  * `transform.eulerAngles`

* ``

  ```c#
  if(Input.GetKey(KeyCode.LeftArrow))
    transform.Rotate(Vector3.up, -turnSpeed * Time.deltaTime);

  if(Input.GetKey(KeyCode.RightArrow))
    transform.Rotate(Vector3.up, turnSpeed * Time.deltaTime);
  ```


## GameObjects
## GameObjects
* special unity classes
* gameobjects include components

* can have child gameobjects
  * they inherint translation & rotation and activeness
## Using GameObject's components
  * refer to a component:
    * `component = GetComponent<ComponentType>();`
  * enable/disable components:
    * `component.enabled = false;` (or true)
    * how to toggle?
      * `component.enabled = !component.enabled`

## Referring to GameObjects
* fast solution
  * create public GameObject field (shows up in Inspector)
  * drag & drop gameObject to Inspector
* find with code
  * [GameObject.Find](https://docs.unity3d.com/ScriptReference/GameObject.Find.html) (finds one)
  * [GameObject.FindGameObjectsWithTag("TagWeWantToFind")](https://docs.unity3d.com/ScriptReference/GameObject.FindGameObjectsWithTag.html)
## Children & Parents

* child:
  * for some reason, Unity stores the child-parent hierarchy of gameObjects under the transform component
  * by index number
    * https://docs.unity3d.com/ScriptReference/Transform.GetChild.html
    * `parentGameObject.transform.GetChild(indexNumber).gameObject`
 *  by name
    * https://docs.unity3d.com/ScriptReference/Transform.Find.html
    * `parentGameObject.transform.Find("childName").gameObject`
* parent:
  * `childGameObject.transform.parent`


## Creating and destroying GameObjects

  * `Instantiate()`
  * `Destroy()`

## Activating GameObjects

* activating/disabling gameobjects
  * Inspector: checkbox left to name
  * `gameObject.SetActive(false);`
    * will deactivate the object AND ITS CHILDREN.
  * `myObject.activeSelf`
    * false tells if this _particular_ object has been deactivated
    * if true, can still be deactivated if a parent is deactivated
  * `myObject.activeInHierarchy`
    * "is myObject really active right now?"
    * false tells if this object is deactivated by itself or by its parents


## Script reusability

* two extreme approaches to scripting gameObjects
  a) put everything in one class
    * can make files bloated
  b) make one class per functionality
    * possibly reusable
    * possibly more confusing
    * can take more time to get zero advantages

## Reading

* [Stack Overflow: Component vs Behaviour vs Monobehaviour](https://stackoverflow.com/questions/44540747/what-is-the-difference-between-component-behaviour-and-monobehaviour-and-why-t)