- [Unity advanced](#unity-advanced)
  - [Delayed actions](#delayed-actions)
  - [Scriptable Object](#scriptable-object)
    - [Simple example](#simple-example)
  - [Delegates and Events (3b)](#delegates-and-events-3b)
    - [Delegates](#delegates)
    - [Events](#events)
    - [Actions](#actions)
    - [UnityEvents](#unityevents)
    - [Scriptable object Unity Event](#scriptable-object-unity-event)
  - [Generics, IEnumerable (4c)](#generics-ienumerable-4c)
  - [unity main loop, execution order](#unity-main-loop-execution-order)
  - [Entity component system](#entity-component-system)

# Unity advanced

## Delayed actions
- Invoke
  - if you want to execute something _after_ a given time delay. 
  - Invoke
```c#
    void Start()
    {
        Invoke ("SpawnObject", 2);
    }
    
    void SpawnObject()
    {
        Instantiate(target, new Vector3(0, 2, 0), Quaternion.identity);
    }
```
  - InvokeRepeating
    - "Call first after two second, then repeat every one second"
```c#
	void Start()
    {
        InvokeRepeating("SpawnObject", 2, 1);
    }
    
    void SpawnObject()
    {
        float x = Random.Range(-2.0f, 2.0f);
        float z = Random.Range(-2.0f, 2.0f);
        Instantiate(target, new Vector3(x, 2, z), Quaternion.identity);
    }
```
   - `CancelInvoke("SpawnObject");`
- Coroutine
  - if you want to execute something _during_ a given time
  - Basically it's a function that is executed until the yield statement is reached, and continued on the next frame OR after a specified time delay
    -> We can have multiple delays!
    - Excellent for sequenced events (cutscenes!)
  - https://docs.unity3d.com/Manual/Coroutines.html
  - https://learn.unity.com/tutorial/coroutines?uv=2019.3&projectId=5c88f2c1edbc2a001f873ea5#5c894522edbc2a14103553c5


## Scriptable Object
- class for storing data
- usually used an asset template
  - can be made accessible from the Create Asset menu!
- derives from the base Unity object but cannot be attached to a GameObject
- life-saver if gameobject needs easily-swappable data
- [Scriptable Object in Unity Docs](https://docs.unity3d.com/Manual/class-ScriptableObject.html)
- [Brackeys tutorial](https://www.youtube.com/watch?v=aPXvoWVabPY)

### Simple example

- Create new class that inherits from ScriptableObject

```c#
using UnityEngine;

[CreateAssetMenu(fileName = "New Mana Card", menuName = "Cards/ManaCard")]
public class Card : ScriptableObject
{
    public new string name;
    public string description;
    public int amountOfMana;
    public ManaEnum manaType;
}
```

- Create a few new templates based on the Scriptable object from the Asset menu
- Refer to the Card class as a SerializeField in a GameObject
- drag the card template of your choice to the field in Inspector
- ta-da, the data from Card is now available in the gameobject



```c#
using UnityEngine;

[CreateAssetMenu(fileName = "Spawn Manager", menuName = "ScriptableObjects/SpawnManagerScriptableObject", order = 1)]
public class SpawnManagerScriptableObject : ScriptableObject
{
    public string prefabName;
    public int numberOfPrefabsToCreate;
    public Vector3[] spawnPoints;
}
```

```c#
using UnityEngine;

public class Spawner : MonoBehaviour
{
    // The GameObject to instantiate.
    public GameObject entityToSpawn;

    // An instance of the ScriptableObject defined above.
    public SpawnManagerScriptableObject spawnManagerValues;

    // This will be appended to the name of the created entities and increment when each is created.
    int instanceNumber = 1;

    void Start()
    {
        SpawnEntities();
    }

    void SpawnEntities()
    {
        int currentSpawnPointIndex = 0;

        for (int i = 0; i < spawnManagerValues.numberOfPrefabsToCreate; i++)
        {
            // Creates an instance of the prefab at the current spawn point.
            GameObject currentEntity = Instantiate(entityToSpawn, spawnManagerValues.spawnPoints[currentSpawnPointIndex], Quaternion.identity);

            // Sets the name of the instantiated entity to be the string defined in the ScriptableObject and then appends it with a unique number. 
            currentEntity.name = spawnManagerValues.prefabName + instanceNumber;

            // Moves to the next spawn point index. If it goes out of range, it wraps back to the start.
            currentSpawnPointIndex = (currentSpawnPointIndex + 1) % spawnManagerValues.spawnPoints.Length;

            instanceNumber++;
        }
    }
}
```

## Delegates and Events (3b)

### Delegates
- Delegate: a container for a function that can be passed around or used like a variable
- variables only contain data, but delegates can contain functions
- let's create a delegate signature - a reference for a type of delegate
  - you can declare its return type and parameter types:
```c#
public delegate void OnGameOver(int level);
public static OnGameOver onGameOver;
```
- how to change between two active attacks with a delegate:
```c#
// https://gamedevbeginner.com/events-and-delegates-in-unity/
public class DelegateExample : MonoBehaviour
{
    delegate void MyDelegate();
    MyDelegate attack;

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            if (attack != null)
            {
                attack();
            }
        }

        if (Input.GetKeyDown(KeyCode.Alpha1))
        {
            attack = PrimaryAttack;
        }

        if (Input.GetKeyDown(KeyCode.Alpha2))
        {
            attack = SecondaryAttack;
        }
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
- multicasting with +=
  - https://learn.unity.com/tutorial/delegates?uv=2019.3&projectId=5c88f2c1edbc2a001f873ea5#5c894658edbc2a0d28f48aee 
```c#
delegate void MyDelegate(); 
MyDelegate attack;

void Start()
{
    attack += PrimaryAttack; 
    attack += SecondaryAttack; 
}
```
- now both PrimaryAttack and SecondaryAttack trigger when attack is called.

### Events
- observer pattern
  - [Game programming patterns.com: Observer pattern](http://gameprogrammingpatterns.com/observer.html)
- Events are specialized multicast delegates
- can only be triggered from within their own class, not from elsewhere
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

- [Learn: Events](https://learn.unity.com/tutorial/events-uh?uv=2019.3&projectId=5c88f2c1edbc2a001f873ea5#5c894782edbc2a1410355442)

### Actions 
- it can sometimes be inconvenient to declare a new delegate type every time you want to use one
- especially if all you want to do is create a basic event
- Actions allow you to use a generic delegate type without needing to define it in your script first
```c#
// this...
public static event Action OnGameOver;

// ...is basically the same as this
public delegate void OnGameOver();
public static event OnGameOver onGameOver;
```
- adding parameters
```c#
public static event Action<string> OnGameOver;
public static event Action<float, bool> OnPlayerHurt;
```
- calling with parameters
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

### UnityEvents
- to confuse matters further, Unity has its own UnityEvent system as well.
- good stuff
  - you won't need to nullcheck UnityEvents.
  - Unity Events have special controls in Inspector
    - contains the list of event function calls
    - add function calls by drag-and-dropping
  - thus, extremely useful for making logical connections between scripts in the Inspector

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
        if(health < 0)
        {
            onPlayerDeath.Invoke();
        }
    }
}
```
- UnityEvents with parameters
```c#
using UnityEngine.Events;
using System;

[Serializable]
public class FloatEvent : UnityEvent <float> { }
```
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
        if(health < 0)
        {
            onPlayerDeath.Invoke();
        }
    }
}
```
```c#
public class HealthBar : MonoBehaviour
{
    public void UpdateHealthBar(float value)
    {
        Debug.Log(value + " health was removed");
    }
}
```
- bad stuff
  - Hooking up scripts in the Inspector requires you to make a manual connection which may not work well for different objects in the scene, especially if they’re created as the game runs.
  - when connecting events between unrelated objects, you may find it more useful to use event delegates instead.
  - to overcome this, there's the Scriptable Object Unity Event :)))))))

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
        for (int i = listeners.Count -1; i >= 0; i--)
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

## Generics, IEnumerable (4c)






## unity main loop, execution order

## Entity component system

- salama-tuli-vesi systeemi