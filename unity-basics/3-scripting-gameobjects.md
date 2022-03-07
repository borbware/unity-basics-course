---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->
# 3. Scripting GameObjects
## Scripting
## Creating a new script

a) Inspector > Add Component > New Script > Create and Add
b) Project > Right click > Create > C# script > drag and drop to a game object

## Class

* C# is object-oriented: the script is a new **Class** that inherits an Unity class **MonoBehaviour**
* it includes two **methods** by default: Start and Update
  * in addition to these two, we can implement other methods that Unity already recognizes and has an use for as well
  * we can also add our own methods 
* we can also add new **properties**: variables inside the class
## Initialization
  * There are two functions for initializing a script class
  * `Awake()`
    * called first
    * called even if the script component is not enabled!
  * `Start()`
    * called second, right before the first Update
    * only called if the script component IS enabled

## Updating 1
  * There are three functions for updating a script class
  * `Update()`
    * the frequency of update calls varies depending on framerate
    * most things can be updated here
    * because of framerate-dependence it is *indeterministic*
## Updating 2
  * `FixedUpdate()`
    * by default, called every 0.2 seconds (50 FPS)
    * used mainly for physics calculations
      * under load, will slow down!
      * not dependent on framerate: *deterministic*
        * (same input always produces same output)
    * NOTE: can't be used for checking ButtonDown input
  * `LateUpdate()`
    * called every frame after `Update()`.
    * good for something that has to happen after all game objects have Updated
## Deltatime

  * `Time.deltaTime`
    * deltatime is the time spent between update calls
      * `deltatime = 1 / FPS`
    * can be used for framerate-independent movement
      * `transform.position += new Vector3(speed * Time.deltaTime, 0.0f, 0.0f);`
      * beware lag spikes, though: what would the velocity be if deltatime was equal to one second? three seconds?

## Properties


## Accessing properties from inspector

* public variables
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
* translation & rotation
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
* LookAt
  * `transform.LookAt(target);`


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
  * create public GameObject property (shows up in Inspector)
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