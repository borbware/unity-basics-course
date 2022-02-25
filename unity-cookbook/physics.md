## Unity physics engine

* In 3D, Unity uses NVIDIA's PhysX for its physics
* In 2D, Box2D
* by default, its gravitational acceleration is 9.81m/s^2
* There are two ways objects can interact with the physics engine
  * RigidBody
    * lit. a body (object) that does not deform, i.e., is rigid
    * object is part of the physics engine and behaves like a "regular" physics-based object
    * can be controlled indirectly 
  * Kinematic
    * object is controlled directly
    * only queries the physics engine for collisions

## Collision

* OnCollisionEnter / OnCollisionEnter2D
  * when collision with another collider starts
* OnCollisionExit / OnCollisionExit2D
  * when collision with another collider starts
* OnCollisionStay / OnCollisionStay2D
  * called every frame a collider is in contact
* if collider IsTrigger, then it does not stop other colliders, but only detects if something collides with it.
  * Then, collision functions are replaced with OnTriggerEnter, OnTriggerExit, OnTriggerStay
  * Guess the 2D versions.