---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->
# 3. Scripting GameObjects

## The GameObject class

[Manual: Important classes - GameObject](https://docs.unity3d.com/Manual/class-GameObject.html)

## Creating a new script

* There are two ways to do it:
  a) *Inspector > Add Component > New Script > Create and Add*
  b) *Project > Right click > Create > C# script*, then drag and drop to a GameObject

## The Script Class

* C# is object-oriented: the script is a new ***Class***
  * it ***inherits*** an Unity class [`MonoBehaviour`](https://docs.unity3d.com/Manual/class-MonoBehaviour.html)
* inside the class, we can implement Unity's default ***methods***
  * e.g., `Awake`
* we can also add our own methods
  * e.g., `DoStuffThatWeWant()`
* we can also add new ***fields***: variables inside the class

<!-- _footer: "[More about classes later in Programming 3: Classes and Methods](../programming/3-classes-methods.md)"-->

## Start and update

* the new script includes two ***methods*** by default: `Start` and `Update`
* [`Start()`](https://docs.unity3d.com/ScriptReference/MonoBehaviour.Start.html) is called automatically only once
  * it's used for setting things up when we start using the GameObject
* [`Update()`](https://docs.unity3d.com/ScriptReference/MonoBehaviour.Update.html) is called every frame
  * See FPS in *Play mode > Stats* to check how often it's called!

## Two ways to initialize
  * There are two functions for initializing a script class
  * [`Awake()`](https://docs.unity3d.com/ScriptReference/MonoBehaviour.Awake.html)
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
* [Important classes: Time](https://docs.unity3d.com/Manual/TimeFrameManagement.html)
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

## Accessing fields in Inspector

* `public` variables show up in Inspector
* so do the ones with a `[SerializeField]` attribute
  * [ScriptReference: SerializeField](https://docs.unity3d.com/ScriptReference/SerializeField.html)
* Extra: `[Header("Explainer for UI")]`
  * great for team communication
  * [ScriptReference: Header Attribute](https://docs.unity3d.com/ScriptReference/HeaderAttribute.html)
* `[Range(x,x)]`
  * adds a slider to inspector
  * [ScriptReference: Range Attribute](https://docs.unity3d.com/ScriptReference/RangeAttribute.html)


# Transform class

## Transform

* [ScriptReference: Transform](https://docs.unity3d.com/ScriptReference/Transform.html)
* [Manual: Transform](https://docs.unity3d.com/Manual/class-Transform.html)
* [Important classes: Transform](https://docs.unity3d.com/Manual/ScriptingTransform.html)
* The GameObject's ***position***, ***rotation*** and ***scale*** can be manipulated via its ***Transform*** component
  * either by using the included methods, or by directly manipulating fields
  * fields are either ***global*** or ***local***: e.g., `position` vs `localPosition`
  * local coordinates are with respect to the GameObject's ***parent***



### Translation
* Translation methods
  * `transform.Translate(Vector3 displacement)`
    ```c#
    float moveSpeed = 3.0f;
    if(Input.GetKey(KeyCode.UpArrow))
      transform.Translate(Vector3.forward * moveSpeed * Time.deltaTime);

    if(Input.GetKey(KeyCode.DownArrow))
      transform.Translate(-Vector3.forward * moveSpeed * Time.deltaTime);
    ```
* Translation fields (Vector3)
  * `transform.position`
  * `transform.localPosition`
### Rotation

* Rotation methods
  * `transform.RotateAround(Vector3 pivot)`
  * `transform.LookAt(Transform target)`
  * `transform.Rotate(Vector3 eulerAngles)`
    ```c#
    if(Input.GetKey(KeyCode.LeftArrow))
      transform.Rotate(Vector3.up, -turnSpeed * Time.deltaTime);

    if(Input.GetKey(KeyCode.RightArrow))
      transform.Rotate(Vector3.up, turnSpeed * Time.deltaTime);
    ```
---
* Rotation fields
  * `transform.rotation`, global rotation as a Quaternion
  * `transform.localRotation`, local rotation as a Quaternion
  * `transform.eulerAngles`, global rotation as Euler angles (Vector3)
  * `transform.localEulerAngles`, local rotation as Euler angles (Vector3)
### Scale

* `transform.localScale`
  * [ScriptReference: localScale](https://docs.unity3d.com/ScriptReference/Transform-localScale.html)
* `transform.lossyScale`
  * Read-only!
  * [ScriptReference: lossyScale](https://docs.unity3d.com/ScriptReference/Transform-lossyScale.html)

# Components

## Accessing components

  ```c#
  OurComponentType ourComponent = ourGameObject.GetComponent<OurComponentType>();
  ```
* For example, to get the Rigidbody component:
  ```c#
  Rigidbody rb = playerObject.GetComponent<Rigidbody>();
  ```
* dot notation not needed when getting a component of the GameObject the script class is part of:
  ```
  Rigidbody rb = GetComponent<Rigidbody>();
  ```


## Enabling and disabling components
* enable component:
  * `component.enabled = true;`
* disable component:
  * `component.enabled = false;`
* toggle:
  * `component.enabled = !component.enabled`

# GameObjects

## Referring to GameObjects
* a) fast solution
  * create public GameObject field (shows up in Inspector)
  * drag & drop the wanted GameObject to the field in Inspector
* b) find with code
  * [ScriptReference: GameObject.Find](https://docs.unity3d.com/ScriptReference/GameObject.Find.html)
  * [ScriptReference: GameObject.FindGameObjectsWithTag](https://docs.unity3d.com/ScriptReference/GameObject.FindGameObjectsWithTag.html)

## Accessing Children & Parents

* child:
  * Unity stores the child-parent hierarchy of gameObjects under the Transform component
  * by index number
    * [ScriptReference: GetChild](https://docs.unity3d.com/ScriptReference/Transform.GetChild.html)
    * `parentGameObject.transform.GetChild(indexNumber).gameObject`
   *  by name
      * [ScriptReference: Find](https://docs.unity3d.com/ScriptReference/Transform.Find.html)
      * `parentGameObject.transform.Find("childName").gameObject`
* parent:
  * GameObject only has one direct parent
  * `childGameObject.transform.parent`


## Creating and destroying GameObjects

  * `Instantiate()`
    * [ScriptReference: Instantiate](https://docs.unity3d.com/ScriptReference/Object.Instantiate.html)
  * `Destroy()`
    * [ScriptReference: Destroy](https://docs.unity3d.com/ScriptReference/Object.Destroy.html)

## Activating and deactivating GameObjects

* Inspector: see the checkbox left to the GameObject's name
* `gameObject.SetActive(false);`
  * will deactivate the object ***AND ITS CHILDREN***.
* `myObject.activeSelf`
  * `false` tells if this _particular_ object has been deactivated
  * even if `true`, `myObject` can still be deactivated if a parent is deactivated
* `myObject.activeInHierarchy`
  * "is `myObject` *really* active right now?"
  * `false` means this object has been deactivated by itself ***or*** by its parents


## Tags & Layers
* [Manual: Tags and layers](https://docs.unity3d.com/Manual/class-TagManager.html)
* *Edit > Project Settings > Tags and Layers*
  * Here, you can set up Tags, Sorting layers and Layers
### Tags

* [Manual: Tags](https://docs.unity3d.com/Manual/Tags.html)
* Marker values that that you can use to identify objects in your Project
* Example tags: EditorOnly, MainCamera, Player
* `GameObject.FindWithtag("tagname");`
* `GameObject.FindGameObjectsWithTag("tagname");`

### Layers
* [Manual: Layers](https://docs.unity3d.com/Manual/Layers.html)
* Layers allow you to separate GameObjects in you scene through UI or scripting
* Some layers: Default, Ignore Raycast, Custom...
* To make Camera ignore some layers:
	* *Inspector > Camera > Culling Mask > Layers*
* To make Viewport ignore some layers:
	* Top right: *Layers* dropdown
* Layers can be used for selective collision detection
  * [Manual: Layer-based collision detection](https://docs.unity3d.com/Manual/LayerBasedCollision.html)

### Sorting layers

* For sorting 2D sprites
  * "which goes on top of which"
  * act kind of like Photoshop layers

## Sending messages

* [Script Reference: SendMessage](https://docs.unity3d.com/ScriptReference/GameObject.SendMessage.html)
* For invoking a method in a gameobject
  ```c#
  // Calls the function ApplyDamage with a value of 5
  // Every script attached to the game object
  // that has an ApplyDamage function will be called.
  gameObject.SendMessage("ApplyDamage", 5.0);
  ```


## About script reusability

* two extreme approaches to scripting GameObjects
  * a) One script per GameObject
    * can make files bloated
  * b) One script per functionality
    * possibly reusable code!
    * possibly more confusing
    * can take more time
* My way: First put everything in one script until some functionality grows enough
  * Then, separate into its own script

## Reading

* [Stack Overflow: Component vs Behaviour vs Monobehaviour](https://stackoverflow.com/questions/44540747/what-is-the-difference-between-component-behaviour-and-monobehaviour-and-why-t)