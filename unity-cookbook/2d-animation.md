---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->

# 2D animation

## Sprite-based art

* [Madwomb: Basics of Unity 2D](http://madwomb.com/tutorials/GameDesign_Unity2Dintro.html)
* [Top-down movement in Unity](https://pavcreations.com/top-down-movement-and-attack-game-mechanics-in-unity/)


## 2d animation

* [Brackeys video: 2D animation](https://www.youtube.com/watch?v=hkaysu1Z-N8)
* Components needed
  * Sprite Renderer
  * Animator

## Sprites

* See: Sprite renderer

## Spritesheets

* Importing
* Slicing


## Sprite Animation
	* Window > Animation > Animation
	* Animation Controller
	* Animator
	* Mecanim State Machine

### Animator screen

* [Madwomb: Mecanic - Animation Controllers and State Machines](http://madwomb.com/tutorials/GameDesign_UnityMecanim.html)
* Mecanim State Machine
* Transitions
  * Exit time
  * Can Transition To Self
  * Transition hell
* Animation parameters
  * Controlling with code
  * anim.SetFloat("Last_X",PlayerInput.x);
  * anim.SetTrigger("StartWalking"); 
* Blend trees

## 9-slicing sprites

* [Manual: 9-Slicing your Sprite](https://docs.unity3d.com/Manual/9SliceSprites.html)

## Sprite masks

* [Manual: Sprite masks](https://docs.unity3d.com/Manual/class-SpriteMask.html)

## Extra: UI animations

* [Packages: Unity UI: Animation integration](https://docs.unity3d.com/Packages/com.unity.ugui@1.0/manual/UIAnimationIntegration.html)

## Extra: Sprite Creator

* For creating (placeholder) sprite graphics
* *Assets > Create > Sprites*
* [Manual: Sprite Creator](https://docs.unity3d.com/Manual/SpriteCreator.html)


## Extra: Pixel art in Unity




* preparing for pixelart
  * https://twitter.com/Davitsu/status/956499799133573120
  * https://hackernoon.com/making-your-pixel-art-game-look-pixel-perfect-in-unity3d-3534963cad1d
* pixel perfect camera
  * https://docs.unity3d.com/Packages/com.unity.2d.pixel-perfect@1.0/manual/index.html
