---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->
# 1. Delayed actions

## Invoke
* if you want to execute something _after_ a given time delay. 
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
## InvokeRepeating
* "Call first after two second, then repeat every one second"
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
   * `CancelInvoke("SpawnObject");`

## Coroutines

* [Manual: Coroutines](https://docs.unity3d.com/Manual/Coroutines.html)
* if you want to execute something _during_ a given time
* Basically it's a function that is executed until the yield statement is reached, and continued on the next frame OR after a specified time delay
  -> We can have multiple delays!
  * Excellent for sequenced events (cutscenes!)
* https://learn.unity.com/tutorial/coroutines?uv=2019.3&projectId=5c88f2c1edbc2a001f873ea5#5c894522edbc2a14103553c5