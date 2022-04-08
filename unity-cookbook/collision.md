---
marp: true
paginate: true
math: katex
---
<!-- headingDivider: 3 -->
<!-- class: default -->

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

* [`OnCollisionExit`](https://docs.unity3d.com/ScriptReference/Collider.OnCollisionExit.html) / [`OnCollisionExit2D`](https://docs.unity3d.com/ScriptReference/Collider2D.OnCollisionExit2D.html)
  * when collision with another collider starts
* [`OnCollisionStay`](https://docs.unity3d.com/ScriptReference/Collider.OnCollisionStay.html) / [`OnCollisionStay2D`](https://docs.unity3d.com/ScriptReference/Collider2D.OnCollisionStay2D.html)
  * called every frame a collider is in contact
* See the links for code examples!

<!-- _footer: "For more event methods, see [Script Reference: Monobehaviour Messages](https://docs.unity3d.com/ScriptReference/MonoBehaviour.html#Messages)" -->

## Triggers
* Normally, Unity initiates actions using the `OnCollisionEnter` function
* If collider `IsTrigger`, then it does not stop other colliders, but only detects if something collides with it - no `OnCollisionEnter`!
  * Collision functions are replaced with [`OnTriggerEnter`](https://docs.unity3d.com/ScriptReference/Collider.OnTriggerEnter.html), [`OnTriggerExit`](https://docs.unity3d.com/ScriptReference/Collider.OnTriggerExit.html), `OnTriggerStay`
  * Guess the 2D versions...

## Exercise 1. Collectibles

<!-- _backgroundColor: Khaki -->

Continue with the Player character from Input exercise.

Create a scene with multiple collectible GameObjects.

When the player character collides with the objects, destroy them and add one to Player's internal counter of collected items. 

## Exercise 3. Colliding with moving objects

<!-- _backgroundColor: Khaki -->

Continue with the Player character from Input exercise.

Create a scene with multiple collectible GameObjects.

When the player character collides with the objects, destroy them and add one to Player's internal counter of collected items. 

