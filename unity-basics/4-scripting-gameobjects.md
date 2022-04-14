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
  * e.g., `Awake()`
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
  * [`Start()`](https://docs.unity3d.com/ScriptReference/MonoBehaviour.Start.html)
    * called second, right before the first Update
    * only called if the script component IS enabled

## `Update()`
  * There are three functions for updating a script class
  * [`Update()`](https://docs.unity3d.com/ScriptReference/MonoBehaviour.Update.html)
    * the frequency of update calls varies depending on framerate
    * most things can be updated here
    * because of framerate-dependence it is *indeterministic*
        * (same input doesn't always produce same output)
## `FixedUpdate()` and `LateUpdate()`
  * [`FixedUpdate()`](https://docs.unity3d.com/ScriptReference/MonoBehaviour.FixedUpdate.html)
    * by default, called every 0.2 seconds (50 FPS)
    * used mainly for physics calculations
      * under load, will slow down!
      * not dependent on framerate: *deterministic*
        * (same input always produces same output)
    * ***Note:*** can't be used for checking ButtonDown input
  * [`LateUpdate()`](https://docs.unity3d.com/ScriptReference/MonoBehaviour.LateUpdate.html)
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

* [Manual: Variables and the Inspector](https://docs.unity3d.com/Manual/VariablesAndTheInspector.html)
* `public` variables show up in Inspector
* as do the ones with a `[SerializeField]` attribute
  * [Script Reference: SerializeField](https://docs.unity3d.com/ScriptReference/SerializeField.html)
* Extra: `[Header("Explainer for UI")]`
  * great for team communication
  * [Script Reference: Header Attribute](https://docs.unity3d.com/ScriptReference/HeaderAttribute.html)
* `[Range(x,x)]`
  * adds a slider to inspector
  * [Script Reference: Range Attribute](https://docs.unity3d.com/ScriptReference/RangeAttribute.html)

## Referring to GameObjects
* a) fast solution
  * create public GameObject field (shows up in Inspector)
  * drag & drop the wanted GameObject to the field in Inspector
* b) find with code
  * [Script Reference: GameObject.Find](https://docs.unity3d.com/ScriptReference/GameObject.Find.html)
  * [Script Reference: GameObject.FindGameObjectsWithTag](https://docs.unity3d.com/ScriptReference/GameObject.FindGameObjectsWithTag.html)

## Accessing Children & Parents

* child:
  * Unity stores the child-parent hierarchy of gameObjects under the Transform component
  * by index number
    * [Script Reference: GetChild](https://docs.unity3d.com/ScriptReference/Transform.GetChild.html)
    * `parentGameObject.transform.GetChild(indexNumber).gameObject`
   *  by name
      * [Script Reference: Find](https://docs.unity3d.com/ScriptReference/Transform.Find.html)
      * `parentGameObject.transform.Find("childName").gameObject`
* parent:
  * GameObject only has one direct parent
  * `childGameObject.transform.parent`


## Creating and destroying GameObjects

  * `Instantiate()`: Create copies of GameObjects or Prefabs into the scene with 
    * [Script Reference: Instantiate](https://docs.unity3d.com/ScriptReference/Object.Instantiate.html)
      ```c#
      GameObject newObject = Instantiate(bullet, transform.position, transform.rotation);
      ```
  * `Destroy()`: destroy GameObjects from the scene
    * [Script Reference: Destroy](https://docs.unity3d.com/ScriptReference/Object.Destroy.html)
    * you can give an additional delay in seconds before destroying as a second argument
      ```c#
      Destroy(bullet, 2.0f);
      ```

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


## Tags & Layers
* [Manual: Tags and layers](https://docs.unity3d.com/Manual/class-TagManager.html)
* *Edit > Project Settings > Tags and Layers*
* Here, you can set up
  * ***Tags***
  * ***Layers***
  * ***Sorting layers*** 
### Tags

* [Manual: Tags](https://docs.unity3d.com/Manual/Tags.html)
* Marker values that that you can use to identify objects in your Project
* Example tags: EditorOnly, MainCamera, Player
* GameObject can only have ONE tag!
  * Access it with `myGameObject.tag`
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
* For invoking a method in a GameObject
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


## Exercise 1. Available on switch 
<!-- _backgroundColor: Khaki -->

Create a Scene with following GameObjects:

- Three ***light source*** GameObjects
  - render the light bulb as well (it can be a sphere for instance) 
- ⭐ A cube that acts as a ***light switch*** (turns on/off the lights, but bulbs are seen)
- ⭐⭐ A cube that acts as a ***kill switch*** that destroys the lights
- ⭐⭐⭐ A cube that acts as a ***create switch*** that creates new lights if they were destroyed

***Spoiler:*** For a click response, you can use this method:

```c#
void OnMouseOver() {
  if (Input.GetMouseButtonDown(0) {
      // Do stuff
  }
}
```

## Reading

* [Stack Overflow: Component vs Behaviour vs Monobehaviour](https://stackoverflow.com/questions/44540747/what-is-the-difference-between-component-behaviour-and-monobehaviour-and-why-t)
