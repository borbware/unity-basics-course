---
title: Unity advanced 2. Scriptable objects
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Scriptable objects

## Scriptable object class

* A special class for storing data
* Usually used as an asset template
  * Can be made accessible from the Create Asset menu!
* Derives from the base Unity object but cannot be attached to a GameObject
* Very handy if a GameObject needs easily-swappable data
* [Scriptable Object in Unity Docs](https://docs.unity3d.com/Manual/class-ScriptableObject.html)
* [Brackeys tutorial](https://www.youtube.com/watch?v=aPXvoWVabPY)

### Creating a scriptable object

1) Create new class that inherits from ScriptableObject
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
2) Create a few new templates based on the Scriptable object from the Asset menu
3) Refer to the Card class as a SerializeField in a GameObject
4) Drag the card template of your choice to the field in Inspector
5) The data from Card is now available in the GameObject

### Spawn manager: The manager class

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