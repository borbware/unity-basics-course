---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->
# Physics

## Unity physics engine
* [Docs: Physics](https://docs.unity3d.com/2019.3/Documentation/Manual/PhysicsSection.html)
* A physics engine is used to calculate accelerations, collisions, gravity and other forces 
  * In 3D, Unity uses NVIDIA's **PhysX** for its physics
  * In 2D, Unity uses **Box2D**
* When you add a physics component to a gameobject, it is then part of the physics system


## Rigidbody
  * literally: a body (object) that does not deform, i.e., is rigid
  * There are three ways a rigid body can interact with the physics engine
  * Dynamic
    * object is part of the physics engine and behaves like a "regular" physics-based object
    * can be controlled indirectly
  * Kinematic
    * not affected by the physics system
    * only queries the physics engine for collisions
    * can be controlled directly
  * Static
    * does not move at all
    * can collide with other **non-static** rigidbodies 

## Gravity
* Note! by default, gravitational acceleration is $9.81m/s^2$
* You can change it from Unity settings
  * Edit > Project Settings > Physics (2D) > Gravity
  * for top-down 2d games, you want gravity to be zero

## Colliders

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