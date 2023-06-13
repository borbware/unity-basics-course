---
title: Unity advanced 2. Scriptable objects
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Scriptable objects

## Scriptable object class

* A special class for storing data that GameObjects can use
* Usually used as an asset template
* Can be made accessible from the Create Asset menu!
* Very handy if a GameObject needs easily-swappable data
  * [Brackeys tutorial](https://www.youtube.com/watch?v=aPXvoWVabPY) has an example of creating different Hearthstone cards
* [Scriptable Object in Unity Docs](https://docs.unity3d.com/Manual/class-ScriptableObject.html)

### Creating a scriptable object

1) Create new class that inherits from `ScriptableObject` instead of `MonoBehaviour`
    * This will be the data structure of the variables you want to store
    * ```c#
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
    * ***Note:*** The `name` field exists already, so we use the `new` keyword to override it. 
2) Create a new data container based on the Scriptable object from the Asset menu
   * In this case, choose *Cards > ManaCard*
   * Set values for the created asset
3) Create a few more data containers with different data!

### Using the scriptable object

1) Create a new script inside the GameObject for using the data from the Scriptable object.
2) In the script, create a new variable with the type of the Scriptable Object:
    ```c#
    [SerializeField] Card card
    ```
3) Drag the card template of your choice to the serialized field in Inspector
4) The data from Card is now available! Access its values with `card.amountOfMana`, `card.name`, etc.

### Extra: Spawn manager: The manager class
<!-- _backgroundColor: #5d275d -->

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

### Spawn manager: Usage
<!-- _backgroundColor: #5d275d -->

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
            GameObject currentEntity = Instantiate(
                entityToSpawn, spawnManagerValues.spawnPoints[currentSpawnPointIndex], Quaternion.identity
            );
            // Sets the name of the instantiated entity to be the string defined in the ScriptableObject + a unique number. 
            currentEntity.name = spawnManagerValues.prefabName + instanceNumber;
            // Moves to the next spawn point index. If it goes out of range, it wraps back to the start.
            currentSpawnPointIndex = (currentSpawnPointIndex + 1) % spawnManagerValues.spawnPoints.Length;
            instanceNumber++;
        }
    }
}
```