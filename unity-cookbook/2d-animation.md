---
title: Unity Cookbook. 2D animation
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# 2D animation

## Two ways to 2D character animation

* Sprite sheet animation
  * Characters are drawn fully, and animated by hand, frame by frame
  * At best, results in lifelike and beautiful motion
  * At worst, the animator has to draw everything multiple times
  * [Learn: Sprite Animation](https://learn.unity.com/tutorial/introduction-to-sprite-animations)
* Skeletal animation
  * Characters consists of multiple images connected by bones
  * At best, varied procedural movement out of a few assets
  * At worst, stiff and unlifelike motion
  * [Learn: Skeletal Animation](https://unity.com/features/2danimation)

## Sprite-based animation

* For sprite basics, see: [2d Basics: Sprite renderer component](2d-basics#sprite-renderer-component)
* Sprite animation can be created with multiple individual png files, or one sprite sheet with multiple animation ***cels***
* [Brackeys video: 2D animation](https://www.youtube.com/watch?v=hkaysu1Z-N8)

### Creating a new animation

* [Manual: Creating a new Animation Clip](https://docs.unity3d.com/Manual/animeditor-CreatingANewAnimationClip.html)
* Select the GameObject you want to animate
* Open ***Animation Window***: *Window > Animation > Animation*
* Click *Create* to create a new animation (.anim) file, or a ***clip***
  * An animation controller (.controller) gets created simultaneously as well
  * Also, your GameObject gets an Animator component
  * Name the first clip *PlayerIdle*
  * Good ideas to have separate animation files for *Idle*, *Jump*, *Run*, etc...

---

![](imgs/animation-window.png)
* ***Note:*** The functionality of the animation timeline above relies that you ***keep your GameObject selected***
  * Otherwise, you can't click the buttons
* Drag sprites to your Animation timeline
  * ***Note:*** The final frame duration is less than the others. For an easy fix, add a new key to the end with *Right click > Add key*
* Set *Samples* to a lower value to make your new animation less frantic
* You can create new clips in the *PlayerIdle* dropdown

### Controlling animation with code

* The fastest way to get your animations running is to control the Animator component with code
* [Script Reference: Animator.Play](https://docs.unity3d.com/ScriptReference/Animator.Play.html)
  ```c#
  Animator anim = GetComponent<Animator>();
  anim.Play("PlayerAttack");
  ```
* Check which animation is playing
  ```c#
  if (anim.GetCurrentAnimatorStateInfo(0).IsName("PlayerAttack"))
  {
        Debug.Log("Playing attack anim!");
  }
  ```

## Animator controller

* When you created new clips, an ***Animator Controller Asset*** was created
  * [Manual: The Animator Controller Asset](https://docs.unity3d.com/Manual/Animator.html)
* This can be modified in the ***Animator Controller Window***
  * [Manual: Animator Controller](https://docs.unity3d.com/Manual/class-AnimatorController.html)
  * ***Note:*** This was previously known as Mecanim State Machine
* To actually use the transition rules, your player GameObject needs the Animator component (it was added automatically)
  * [Manual: Animator Component](https://docs.unity3d.com/Manual/class-Animator.html)

## Animator window

* Unity Animator window, aka the Animation State Machine can seem daunting if you're not familiar with the concept of a State Machine
* Luckily, the Manual has good resources about state machines
  * [Manual: State Machine Basics](https://docs.unity3d.com/Manual/StateMachineBasics.html)
* ***Note:*** the animator window can be janky. E.g., If you cannot move the states around, set the inspector into Debug mode
  * *Inspector window > Three dots in the top right corner > Debug*

### Using the Animator window

![](imgs/animator-states.png
)
* In Animator, we can create ***transition rules*** between animation clips
* *Right click a state > Make Transition*
* ***Entry*** is the default state: Create an arrow from it to the idle animation!
* Click on the arrow to edit the transition

### Transitions

* [Manual: Animation Transitions](https://docs.unity3d.com/530/Documentation/Manual/class-Transition.html)

![bg right:35% height:95%](imgs/animator-transition-inspector.png)

* *Has Exit time*:
  * The most absolutely confusingly named variable of all years
  * Means: "Transition will happen automatically after Exit time has passed"
  * Usually we want to uncheck this.
* *Settings*
  * *Exit time*: The number of ***loops*** to go through before the automatic transition
    * Oh wow, it's not even time, really
  * *Transition Duration*: In sprite animations, we usually want to set this to 0.

### Animation parameters

* To trigger state transitions, we control the controller's parameters in code 
* [Manual: Animation Parameters](https://docs.unity3d.com/Manual/AnimationParameters.html)
* Change the *Layers* view to *Parameters* 
* Create a new float parameter named *Speed*
* Go to a transition, and create a new ***condition*** for the parameter 
  ```c#
  [SerializeField] Animator anim;

  anim.SetFloat("Speed",_rigidbody.velocity.Magnitude);
  ```
* `anim.SetTrigger("StartWalking")` works similarly

## Animation clip properties

![](imgs/animation-clip-properties.png)

* We can control component properties straight from the animation clips themselves
* Use case: If we want to use the same walk animation sprites for *PlayerWalkLeft* that we have for *PlayerWalkRight*
* In the *PlayerWalkLeft* animation clip, click *Add Property*
  * Choose Sprite Renderer Component 
  * Choose the *FlipX* property
  * Tick the box, and move the created key to the start of the clip

## Blend trees

* Having animation states for all moving directions can lead to "transition hell"
* We can keep the base layer simpler by creating ***blend trees***: [Manual: Blend trees](https://docs.unity3d.com/Manual/class-BlendTree.html)
* A common usage for blend trees is to add directional animation:
  * E.g., a *PlayerWalk* blend tree that contains *PlayerWalkDown*, *PlayerWalkUp*, etc states
  * Create a blend tree by right-clicking the animator background and choose
    * *Create state > From new blend tree*
  * Name the blend tree to *PlayerWalk*, and double click the blend tree to open it
* ***Note:*** You can also convert an existing state into a blend tree with *Right click > Create blend tree from state*
### Editing a blend tree

![](imgs/animation-blend-tree.png)

---

* Change blend type to *2D Simple directional*.
* Set two float parameters to control the blend tree (here: *XSpeed* and *YSpeed*) 
  * Create the parameters if you need to.
* Press + to add four empty *Motion fields* (a.k.a., slots for the animation clips) to the blend tree
* Drag the animation clips from the Project view to motion fields
* Set the Pos X and Pos Y parameters or drag the motion fields to their corresponding positions (*PlayerWalkDown* should be down, etc.)
  * Values of 0.1 seem to work well so the states are triggered even when the analog stick is moved slightly. See image in the previous slide!
* Now, when you change the values of the parameters *XSpeed* and *YSpeed*, the blend tree will go to the motion field that matches the values the best

### Animation controller example

```c#
displacement = new Vector2(Input.GetAxis("Horizontal"), Input.GetAxis("Vertical"));
displacement = Vector2.ClampMagnitude(displacement, 1);
rb.velocity = displacement * Time.deltaTime * walkSpeed;

animator.SetFloat("WalkSpeed", rb.velocity.magnitude);

if (displacement.magnitude > 0.1f)
{
    animator.SetFloat("XSpeed", displacement.x);
    animator.SetFloat("YSpeed", displacement.y);
}
```
* Here, we set three properties:
* *WalkSpeed* is used to transition between *PlayerIdle* and *PlayerWalk* blend trees
* *XSpeed* and *YSpeed* are used to choose direction in the blend trees
  * Note that we don't reset them when movement stops!


### Controlling animation clip speed

![bg right:30% height:50%](imgs/animation-state-inspector.png)
* You can control the speed an animation clip is played easily by setting a parameter to control it
* Click on a state in the animator to show it in the inspector
  * Check *Parameter* under *Speed*
  * Choose the float parameter you want to use as a multiplier for the animation clip speed
  * Done!

## Extra: Animation Events
<!-- _backgroundColor: #5d275d -->

* [Manual: Using Animation Events](https://docs.unity3d.com/Manual/script-AnimationWindowEvent.html)
* You can add animation events to call a function in a specific point of an animation

## Extra: State machine behaviour scripts
<!-- _backgroundColor: #5d275d -->

* [Manual: State Machine Behaviours](https://docs.unity3d.com/Manual/StateMachineBehaviours.html)
* To add functionality to animation states, you can add state machine behaviours



## Extra: UI animations
<!-- _backgroundColor: #5d275d -->

* [Packages: Unity UI: Animation integration](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/UIAnimationIntegration.html)

## Extras
<!-- _backgroundColor: #5d275d -->

* 9-Slicing
  * [Manual: 9-Slicing your Sprite](https://docs.unity3d.com/Manual/9SliceSprites.html)
* Sprite Masks
  * [Manual: Sprite masks](https://docs.unity3d.com/Manual/class-SpriteMask.html)
* Sprite Creator
  * For creating (placeholder) sprite graphics
  * *Assets > Create > Sprites*
  * [Manual: Sprite Creator](https://docs.unity3d.com/Manual/SpriteCreator.html)

## Extras: Pixel art in Unity
<!-- _backgroundColor: #5d275d -->

* Sprite import:
  * Texture type: Sprite (2D and UI)
  * Pixels Per Unit: Tile size (e.g., 32)
  * Filter Mode: Point (No filter)
  * Compression: None
* *Edit > Project Settings > Quality > Anti-aliasing: Disabled*

---

<!-- _backgroundColor: #5d275d -->

* Preparing for pixelart
  * https://twitter.com/Davitsu/status/956499799133573120
  * https://hackernoon.com/making-your-pixel-art-game-look-pixel-perfect-in-unity3d-3534963cad1d
* Pixel perfect camera
  * https://docs.unity3d.com/Packages/com.unity.2d.pixel-perfect@1.0/manual/index.html

* ***Note:*** If you still see black gaps in your tilemaps after following these instructions, create a new material with the *Sprites/Default* shader and check *Pixel snap*. Then, add this material to every Tilemap renderer.

## Learning 

* Top-down movement with animation
  * [Top-down movement in Unity](https://pavcreations.com/top-down-movement-and-attack-game-mechanics-in-unity/)
  * [Brackeys video: Top down movement](https://www.youtube.com/watch?v=whzomFgjT50)

* [Madwomb: Basics of Unity 2D](http://madwomb.com/tutorials/GameDesign_Unity2Dintro.html)
* [Madwomb: Mecanim - Animation Controllers and State Machines](http://madwomb.com/tutorials/GameDesign_UnityMecanim.html)