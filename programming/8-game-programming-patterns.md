---
marp: true
paginate: true
title: Programming 8. Game programming patterns
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# 8. Game programming patterns

## Observer pattern

[Game programming patterns: Observer](https://gameprogrammingpatterns.com/observer.html
)

```c#
gameObject.SendMessage("HitByLightning", SendMessageOptions.DontRequireReceiver);
```


## Singleton pattern

[Game programming patterns: Singleton](https://gameprogrammingpatterns.com/singleton.html)
[Game programming patterns: Singleton](https://gameprogrammingpatterns.com/singleton.html)

```c#
void Awake ()
{
	// If there is more than ONE instance of ScoreManager
	// disabled the old instance to avoid errors
	if(instance != null)
	{
		Debug.LogError("More than ONE ScoreManager instance in game! Disabling old one.");
		instance.gameObject.SetActive(false);
	}

	// Set instance to this so class can be used everywhere
	// Make sure there is only ONE ScoreManager in the game
	instance = this;
}
```


```c#
ScoreManager.instance.AddScore(1);
```


<!-- _footer: "Thanks to Zhamul for this code" -->
## State pattern

[Game programming patterns: State](https://gameprogrammingpatterns.com/state.html)

```c#
switch (PlayerState)
	case State.Walking:
	{
		if (Input.down("Fire1"))
			PlayerState = State.Jumping;
	}
	case State.Jumping:
	{

	}
	case State.Hurting
	{
		
	}
```