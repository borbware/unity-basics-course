---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Particle system

* [Docs: ParticleSystem](https://docs.unity3d.com/ScriptReference/ParticleSystem.html)

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