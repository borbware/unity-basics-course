---
marp: true
paginate: true
math: mathjax
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Collision

## Colliders

* [Manual: Colliders overview](https://docs.unity3d.com/Manual/CollidersOverview.html)
* ***Colliders*** allow for interacting with other GameObjects
  * The "hitbox" of the GameObject
  * Usually simpler in geometry than the GameObject itself
* CapsuleCollider(2D), BoxCollider(2D), PolygonCollider2D...
* Extra: To show colliders in play mode:
  * *Settings > Physics(2D) > Always Show Colliders*

## Collision events

* [`OnCollisionEnter`](https://docs.unity3d.com/ScriptReference/Collider.OnCollisionEnter.html) / [`OnCollisionEnter2D`](https://docs.unity3d.com/ScriptReference/Collider2D.OnCollisionEnter2D.html)
  * when collision with another collider starts

* [`OnCollisionStay`](https://docs.unity3d.com/ScriptReference/Collider.OnCollisionStay.html) / [`OnCollisionStay2D`](https://docs.unity3d.com/ScriptReference/Collider2D.OnCollisionStay2D.html)
  * called every frame a collider is in contact
* [`OnCollisionExit`](https://docs.unity3d.com/ScriptReference/Collider.OnCollisionExit.html) / [`OnCollisionExit2D`](https://docs.unity3d.com/ScriptReference/Collider2D.OnCollisionExit2D.html)
  * when collision with another collider ends
* See the links for code examples!

<!-- _footer: "For more event methods, see [Script Reference: Monobehaviour Messages](https://docs.unity3d.com/ScriptReference/MonoBehaviour.html#Messages)" -->

## Triggers
* Normally, Unity initiates actions using the `OnCollisionEnter` function
* If collider `IsTrigger`, then it does not stop other colliders, but only detects if something collides with it - no `OnCollisionEnter`!
  * Collision functions are replaced with [`OnTriggerEnter`](https://docs.unity3d.com/ScriptReference/Collider.OnTriggerEnter.html), [`OnTriggerExit`](https://docs.unity3d.com/ScriptReference/Collider.OnTriggerExit.html), [`OnTriggerStay`]((https://docs.unity3d.com/ScriptReference/Collider.OnTriggerExit.html))
  * Guess the 2D versions...
* ***Note:*** If a trigger is colliding with another trigger, `OnTriggerEnter` gets called twice per collision!

## Collider2D vs Collision2D

* Trigger callback functions use [`Collider2D` class](https://docs.unity3d.com/ScriptReference/Collider2D.html) as their argument
* Collision callback functions use [`Collision2D` class](https://docs.unity3d.com/ScriptReference/Collision2D.html)
  * Collider can actually be found inside the Collision2D class: access it with `.collider`
* Most importantly: for both classes, you can access the corresponding gameObject with `.gameObject`

## Checking collision in Update

* The callback functions are handy, but sometimes you want to check collision inside an update function
* For that, you need the overlap collider
  * [Script Reference: Overlap Collider](https://docs.unity3d.com/ScriptReference/Collider2D.OverlapCollider.html)

## Exercise 1. Collectibles

<!-- _backgroundColor: Khaki -->

Continue with the Player character from the [Input exercise](input-handling.md#exercise-1-player-input).

Add multiple collectible GameObjects to the scene.

When the player character collides with a collectible, destroy it and add one to Player's internal counter of collected items.

## Exercise 2. Colliding with moving obstacles

<!-- _backgroundColor: Khaki -->

Continue previous exercise. Add moving objects to the scene that block the player's way. 

If the player collides with them, make the player ***bounce*** off of them!