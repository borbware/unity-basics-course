---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->
## Delegates and Events (3b)

### Delegates
* Delegate: a container for a function that can be passed around or used like a variable
  * [C# Docs: Introduction to delegates and events in C#](https://docs.microsoft.com/en-us/dotnet/csharp/delegates-overview)
* variables only contain data, but delegates can contain functions
* let's create a delegate signature - a reference for a type of delegate
  * you can declare its return type and parameter types:
    ```c#
    public delegate void OnGameOver(int level);
    public static OnGameOver onGameOver;
    ```

### Delegate example: change between two active attacks
<!-- _footer: 'https://gamedevbeginner.com/events-and-delegates-in-unity/>' -->
```c#
public class DelegateExample : MonoBehaviour
{
    delegate void MyDelegate();
    MyDelegate attack;

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
            if (attack != null)
                attack();

        if (Input.GetKeyDown(KeyCode.Alpha1))
            attack = PrimaryAttack;

        if (Input.GetKeyDown(KeyCode.Alpha2))
            attack = SecondaryAttack;
    }

    void PrimaryAttack()
    {
        // Primary attack
    }

    void SecondaryAttack()
    {
        // Secondary attack
    }
}
```
## Multicasting

* multicasting with +=
  * [Learn: Multicasting](https://learn.unity.com/tutorial/delegates?uv=2019.3&projectId=5c88f2c1edbc2a001f873ea5#5c894658edbc2a0d28f48aee) 
    ```c#
    delegate void MyDelegate(); 
    MyDelegate attack;

    void Start()
    {
        attack += PrimaryAttack; 
        attack += SecondaryAttack; 
    }
    ```
* now **both** PrimaryAttack and SecondaryAttack trigger when attack is called.

## Events
* observer pattern
  * [Game programming patterns.com: Observer pattern](http://gameprogrammingpatterns.com/observer.html)
* Events are specialized multicast delegates
* can only be triggered from within their own class, not from elsewhere
* [Learn: Events](https://learn.unity.com/tutorial/events-uh?uv=2019.3&projectId=5c88f2c1edbc2a001f873ea5#5c894782edbc2a1410355442)

### Events example
```c#
public class Player : MonoBehaviour
{
	public void Start()
	{
		PlayerHealth.onGameOver += RestartGame;
	}

	private void RestartGame()
	{
		// do stuff
	}
}
```

```c#
public class PlayerHealth : MonoBehaviour
{
	public delegate void OnGameOver();
	public static event OnGameOver onGameOver;
}
```

## Actions 
* it can sometimes be inconvenient to declare a new delegate type every time you want to use one
* especially if all you want to do is create a basic event
* Actions allow you to use a generic delegate type without needing to define it in your script first
    ```c#
    // this...
    public static event Action OnGameOver;

    // ...is basically the same as this
    public delegate void OnGameOver();
    public static event OnGameOver onGameOver;
    ```

---
* adding parameters
    ```c#
    public static event Action<string> OnGameOver;
    public static event Action<float, bool> OnPlayerHurt;
    ```
* calling with parameters
    ```c#
    public static event Action<string> OnGameOver;

    public void TakeDamage(float damage)
    {
        health -= damage;
        if(health < 0)
        {
            OnGameOver?.Invoke("The game is over");
        }
    }
    ```

## UnityEvents
* to confuse matters further, Unity has its own UnityEvent system as well.
* good stuff
  * you won't need to nullcheck UnityEvents.
  * Unity Events have special controls in Inspector
    * contains the list of event function calls
    * add function calls by drag-and-dropping
  * thus, extremely useful for making logical connections between scripts in the Inspector
---
```c#
using UnityEngine;
using UnityEngine.Events;

public class PlayerHealth : MonoBehaviour
{
    float health=100;
    public UnityEvent onPlayerDeath;

    public void TakeDamage(float damage)
    {
        health -= damage;
        if (health < 0)
        {
            onPlayerDeath.Invoke();
        }
    }
}
```

### UnityEvents with parameters
```c#
using UnityEngine.Events;
using System;

[Serializable]
public class FloatEvent : UnityEvent <float> { }
```
### UnityEvents Example
```c#
using UnityEngine;
using UnityEngine.Events;

public class PlayerHealth : MonoBehaviour
{
    float health=100;
    public UnityEvent onPlayerDeath;
    public FloatEvent onPlayerHurt;

    public void TakeDamage(float damage)
    {
        health -= damage;
        onPlayerHurt.Invoke(damage);
        if (health < 0)
        {
            onPlayerDeath.Invoke();
        }
    }
}
```
---
```c#
public class HealthBar : MonoBehaviour
{
    public void UpdateHealthBar(float value)
    {
        Debug.Log(value + " health was removed");
    }
}
```
* bad stuff
  * Hooking up scripts in the Inspector requires you to make a manual connection which may not work well for different objects in the scene, especially if they’re created as the game runs.
  * when connecting events between unrelated objects, you may find it more useful to use event delegates instead.
  * to overcome this, there's the Scriptable Object Unity Event :)))))))

### Scriptable object Unity Event

```c#
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(menuName ="Game Event")]
public class GameEvent : ScriptableObject
{
    private List<GameEventListener> listeners = new List<GameEventListener>();

    public void TriggerEvent()
    {
        for (int i = listeners.Count - 1; i >= 0; i--)
        {
            listeners[i].OnEventTriggered();
        }
    }

    public void AddListener(GameEventListener listener)
    {
        listeners.Add(listener);
    }

    public void RemoveListener(GameEventListener listener)
    {
        listeners.Remove(listener);
    }
}
```
---
```c#
using UnityEngine;
using UnityEngine.Events;

public class GameEventListener : MonoBehaviour
{
    public GameEvent gameEvent;
    public UnityEvent onEventTriggered;

    void OnEnable()
    {
        gameEvent.AddListener(this);
    }

    void OnDisable()
    {
        gameEvent.RemoveListener(this);
    }

    public void OnEventTriggered()
    {
        onEventTriggered.Invoke();
    }
}
```