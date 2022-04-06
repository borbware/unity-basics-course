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

### Particle system code example

* how to stop / start particles from emitting:
	```c#
	public ParticleSystem particles;

	...
	if (particles.isStopped)
	{
	    particles.Play();
	}
	...
	if (particles.isPlaying)
	{
	    particles.Stop();
	}
	```

### Particle system component in Inspector
![](imgs/particle-system-inspector.png)


## Reading

* [Learn: Introduction to particle systems](https://learn.unity.com/tutorial/introduction-to-particle-systems#)