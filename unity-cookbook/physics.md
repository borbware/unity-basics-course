---
marp: true
paginate: true
math: katex
---
<!-- headingDivider: 3 -->
<!-- class: default -->
# Physics

## Unity physics engine
* [Manual: Physics](https://docs.unity3d.com/Manual/PhysicsSection.html)
* A physics engine is used to calculate accelerations, collisions, gravity and other forces 
  * In 3D, Unity uses NVIDIA's **PhysX** for its physics
  * In 2D, Unity uses **Box2D**
* When you add a physics component to a gameobject, it is then part of the physics system


## Rigidbody
  * literally: a body (object) that does not deform, i.e., is rigid
  * There are three ways a rigidbody can interact with the physics engine
  * Dynamic
    * is part of the physics engine and behaves like a "regular" physics-based object
    * can be controlled indirectly
  * Kinematic
    * is not affected by the physics system
    * only queries the physics engine for collisions
    * can be controlled directly
  * Static
    * does not move at all
    * can collide with other **non-static** rigidbodies 
### Rigidbody Component

![](https://docs.unity3d.com/uploads/Main/Inspector-Rigidbody.png)

* .velocity
* .angularVelocity

### Interpolation

* [Script Reference: Rigidbody Interpolation](https://docs.unity3d.com/ScriptReference/Rigidbody-interpolation.html)
* Interpolation allows you to smooth out the effect of running physics at a fixed frame rate.

### Constraints

* [Script Reference: Rigidbody Constraints](https://docs.unity3d.com/ScriptReference/Rigidbody-constraints.html)
* "which degrees of freedom are allowed for the simulation of this Rigidbody"
* You can freeze position or rotation of a given axis

## Moving dynamic Rigidbodies

* AddForce
* AddTorque


## Gravity
* Note! by default, gravitational acceleration is $9.81m/s^2$
* You can change it from Unity settings
  * Edit > Project Settings > Physics (2D) > Gravity
  * for top-down 2d games, you want gravity to be zero

## Colliders

* [Manual: Colliders overview](https://docs.unity3d.com/Manual/CollidersOverview.html)

* Showing colliders in play mode

## Collision methods

* `OnCollisionEnter` / `OnCollisionEnter2D`
  * when collision with another collider starts
* `OnCollisionExit` / `OnCollisionExit2D`
  * when collision with another collider starts
* `OnCollisionStay` / `OnCollisionStay2D`
  * called every frame a collider is in contact
### Triggers
* if collider `IsTrigger`, then it does not stop other colliders, but only detects if something collides with it.
  * Then, collision functions are replaced with `OnTriggerEnter`, `OnTriggerExit`, `OnTriggerStay`
  * Guess the 2D versions.


## Links

* [Manual: Physics HOWTOs](https://docs.unity3d.com/Manual/PhysicsHowTos.html)
  * Ragdoll physics
  * Joints
  * Wheel collider tutorial