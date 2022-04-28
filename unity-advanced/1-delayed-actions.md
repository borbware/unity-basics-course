---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->
# 1. Delayed actions

## Doing something every x seconds

```c#
private float nextActionTime = 0.0f;
public float period = 0.1f;

void Update () {
  if (Time.time > nextActionTime )
  {
    nextActionTime = Time.time + period;
    // execute block of code here
  }
}
```
<!-- _footer: "https://answers.unity.com/questions/17131/execute-code-every-x-seconds-with-update.html" -->

## Invoke

* If you want to execute a function _after_ a given time delay. 
  * (AND those functions don't need arguments)
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
* A function that is executed until the yield statement is reached
  * when the function is called again, we don't start from the beginning, but rather after the yield statement
  * thus, we can do something, and then continue on the next frame or even after a specified time delay
  * Excellent for sequenced events (cutscenes!)
* https://learn.unity.com/tutorial/coroutines?uv=2019.3&projectId=5c88f2c1edbc2a001f873ea5#5c894522edbc2a14103553c5


### Example: Execute something after a time delay

```c#
IEnumerator ExecuteAfterTime(float time)
{
    yield return new WaitForSeconds(time);
    doStuffAfterDelay();
}
...
StartCoroutine(ExecuteAfterTime(10));
```

<!-- _footer: "https://answers.unity.com/questions/796881/c-how-can-i-let-something-happen-after-a-small-del.html" -->

### Example: Keep executing something after a break

