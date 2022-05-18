---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->

# 1. Actions and delays

## Calling a method from another GameObject

* The straightforward approach

```c#
// First, get the GameObject
GameObject lähetti = GameObject.Find("Lähetti");
// Then, get the script component "SetColor"
lähettiSetColor = lähetti.GetComponent<SetColor>();
// Then, call the public method SetColorToRed
lähettiSetColor.SetColorToRed();
```

## Sending messages

* [Script Reference: SendMessage](https://docs.unity3d.com/ScriptReference/GameObject.SendMessage.html)
* Another way for calling a method in a GameObject
* No need to get the corresponding component, or even make sure the method exists in the first place
  ```c#
  // Calls the function ApplyDamage with a value of 5
  // Every script attached to the game object
  // that has an ApplyDamage function will be called.
  gameObject.SendMessage("ApplyDamage", 5.0);
  ```
* Note: it can only take in ONE argument maximum
  * You can bypass this restriction by making the argument an array or a class, etc.

## Doing something every x seconds

* The straightforward approach
* You need helper variables for this, can make for a hard-to-parse code block

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

* [Script Reference: Invoke](https://docs.unity3d.com/ScriptReference/MonoBehaviour.Invoke.html)
* Use ***Invoke*** if you want to execute a method after a given time delay
  * ***Note:*** those methods can't have any arguments
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

* [Script Reference: InvokeRepeating](https://docs.unity3d.com/ScriptReference/MonoBehaviour.InvokeRepeating.html)
* ***InvokeRepeating*** is an extension of invoke: if you want to execute something after a delay, and then every x seconds
  ```c#
    void Start()
      {
          InvokeRepeating("SpawnObject", 2.0f, 1.0f);
          // after two seconds, execute every one second
      }
      
      void SpawnObject()
      {
          float x = Random.Range(-2.0f, 2.0f);
          float z = Random.Range(-2.0f, 2.0f);
          Instantiate(target, new Vector3(x, 2, z), Quaternion.identity);
      }
  ```
* To stop the process from repeating, use `CancelInvoke("SpawnObject");`

## Coroutines

* [Manual: Coroutines](https://docs.unity3d.com/Manual/Coroutines.html)
* A function that is executed until the yield statement is reached, and then continued on the next frame
  * on the next frame, we don't start from the beginning, but rather ***after*** the yield statement
  * thus, we can do something, and then continue on the next frame or even after a specified time delay
  * Excellent for sequenced events (cutscenes!)
* [Unity Learn: Coroutines](https://learn.unity.com/tutorial/coroutines?uv=2019.3&projectId=5c88f2c1edbc2a001f873ea5#5c894522edbc2a14103553c5)




### Example: Keep executing something after a break

```c#
IEnumerator Fade()
{
    Color c = renderer.material.color;
    for (float alpha = 1f; alpha >= 0; alpha -= 0.1f)
    {
        c.a = alpha;
        renderer.material.color = c;
        yield return null;
    }
}

void Update()
{
    if (Input.GetKeyDown(KeyCode.Space)) // press space to (re)start coroutine 
    {
        StartCoroutine(Fade());
    }
}
```
* After coroutine is started, it will execute until it has reached its end

### Example: Do three things in a sequence

```c#

    IEnumerator ChangeColorToRandom()
    {
        lähetti.SendMessage("SetColorToRandom");
        Debug.Log("eka");
        yield return new WaitForSeconds(2f);
        
        lähetti.SendMessage("SetColorToRandom");
        Debug.Log("toka");
        yield return new WaitForSeconds(2f);
        
        lähetti.SendMessage("SetColorToRandom");
        Debug.Log("kolmas");
        yield return new WaitForSeconds(2f);
    }
```
* This coroutine will send a message, then wait for a given time, and then continue on to the next message

### Example: Execute something after a time delay

```c#
IEnumerator ExecuteAfterTime(float time)
{
    yield return new WaitForSeconds(time);
    doStuffAfterDelay();
}

void Update()
{
    if (Input.GetKeyDown(KeyCode.Space))
    {
        StartCoroutine(ExecuteAfterTime(10));
    }
}

```

<!-- _footer: "https://answers.unity.com/questions/796881/c-how-can-i-let-something-happen-after-a-small-del.html" -->

### Example: Pause coroutine, then continue

```c#
IEnumerator fade;
// create variable for the coroutine function 
// so we can refer to it in StartCoroutine and StopCoroutine 

void Start()
{
    fade = Fade();
}

void Update()
{
    if (Input.GetKeyDown(KeyCode.Space))
        StartCoroutine(fade); // starts or continues coroutine if already started
    if (Input.GetKeyDown(KeyCode.Backspace))
        StopCoroutine(fade); // pauses coroutine if already started
}
```

### Example: Coroutine of coroutines

* You can call other coroutines inside coroutines like this:
```c#
    IEnumerator SetColor(float time)
    {
        lähetti.SendMessage("SetColorToRandom");
        yield return new WaitForSeconds(time);
    }

    IEnumerator ChangeColorToRandom()
    {
        yield return SetColor(2f);
        yield return SetColor(15f);
        yield return SetColor(3f);
    }

    ...

    StartCoroutine(ChangeColorToRandom());
```