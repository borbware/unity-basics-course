---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->

# Particle system

## Two ways to create a particle system

* [Manual: Choosing your particle system solution](https://docs.unity3d.com/Manual/ChoosingYourParticleSystem.html)
  * [Built-in Particle system](https://docs.unity3d.com/Manual/Built-inParticleSystem.html)
  * [Visual Effect Graph](https://docs.unity3d.com/Manual/VFXGraph.html)

## Built-in particle system

* [Manual: Particle System component](https://docs.unity3d.com/Manual/class-ParticleSystem.html)
* [Script Reference: ParticleSystem](https://docs.unity3d.com/ScriptReference/ParticleSystem.html)



### Particle system component in Inspector
![](imgs/particle-system-inspector.png)

## Particle system modules

* [Manual: Particle System Modules](https://docs.unity3d.com/Manual/ParticleSystemModules.html)
* Main
  * Looping
  * Start Speed, Start Size, Start Lifetime
  * Simulation Space: World / Local
  * Play On Awake
* Emission
  * Rate over time
* Shape
  * Shape (Circle is good for 2D)
  * Radius
  * Arc
  * Position, Rotation
---
* [Texture Sheet Animation](https://docs.unity3d.com/Manual/PartSysTexSheetAnimModule.html)
  * If you want to have sprite animation, use this
  * Grid: tell how many cels your sprite sheet has
* Renderer
  * Material
    * You need to create a new material for your particles!

### Particle material

* For basic sprite particles:
  * *Shader: Particles/Standard Unlit*
  * *Rendering Mode: Fade*
  * Drag your particle sprite / sprite sheet to *Albedo*


### Particle system code example

* How to stop / start emitting particles:
	```c#
	public ParticleSystem particles;

	if (particles.isStopped && Input.GetButtonDown("Fire1"))
	{
	    particles.Play();
	}
	if (particles.isPlaying && Input.GetButtonDown("Fire1"))
	{
	    particles.Stop();
	}
	```

### Change properties with code

* You can't change module properties directly like this: `dustParticles.shape.rotation = somethingNew`
* You have to assign a new variable for the module first, and change the variables there:
	```c#
	var shape = dustParticles.shape;
	shape.rotation = new Vector3 (
		0, 0, Mathf.Atan2(PlayerMove.y, PlayerMove.x) * Mathf.Rad2Deg
	);
	var main = dustParticles.main;
	main.startSpeed = 2 * PlayerMove.magnitude;
	```

## Destroy particles on collision

* In particle system component: Enable *Collision* module
  * Set Type to *World* and then *Lifetime loss* to 1
  * Also, you can change the collision layers in *Collide with* so the particle only collides with a collider of a specific layer.

## Reading

* [Learn: Introduction to particle systems](https://learn.unity.com/tutorial/introduction-to-particle-systems#)
* [Brackeys video: Everything to know about the Particle system](https://www.youtube.com/watch?v=FEA1wTMJAR0)