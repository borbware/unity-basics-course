# Unity physics

- Unity uses NVIDIA's PhysX for its physics
- by default, its gravitational acceleration is 9.81m/s^2
- There are two ways objects can interact with the physics engine
  - RigidBody
    - lit. a body (object) that does not deform, i.e., is rigid
    - object is part of the physics engine and behaves like a "regular" physics-based object
    - can be controlled indirectly 
  - Kinematic
    - object is controlled directly
    - only queries the physics engine for collisions

