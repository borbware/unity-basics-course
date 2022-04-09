
# Game programming patterns

## Concept of state in game programming

[Game programming patterns: state](https://gameprogrammingpatterns.com/state.html)


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

## Exercise 1. Make player logic stateful