---
marp: true
paginate: true
math: katex
---
<!-- headingDivider: 3 -->
<!-- class: default -->
# 4: Interpolation

## Lerp

  ![](imgs/lerp.png)
  * "Lerp", or  linear interpolation, is a commonly used function in gamedev
    * returns the value $x$, which goes from $a$ to $b$, when $t$ goes from $0$ to $1$
    * when $t = 0$, $x = a$
    * when $t = 0.5$, $x = (b - a) / 2$ ("halfway")
    * when $t = 1$, $x = b$
  * [`Mathf.Lerp(a, b, t)`](https://docs.unity3d.com/ScriptReference/Mathf.Lerp.html)

### Lerp example

```c#
Mathf.Lerp(5.0f, 15.0f, 0f);   // returns 5.0f
Mathf.Lerp(5.0f, 15.0f, 0.5f); // returns 10.0f
Mathf.Lerp(5.0f, 15.0f, 1.0f); // returns 15.0f
```

### Note about Clamping

![](imgs/lerp-unclamped.png)

* what if t is smaller than 0 or larger than 1?
* Unity's `Mathf.Lerp` is clamps the returned value automatically
  * $x$ is $a$ at minimum and $b$ at maximum
* with [`Mathf.LerpUnclamped`](https://docs.unity3d.com/ScriptReference/Mathf.LerpUnclamped.html), the value is extrapolated when outside the limits!

## Exercise 1. Do a lerp!
<!-- _backgroundColor: Khaki -->
After pressing a button once, lerp GameObject's color from red to blue.

***Bonus:*** After pressing twice, lerp the color back to red.
***Bonus bonus:*** What if you press the button _during_ lerping?

## Lerping different data types

* Some data types are more complicated than just one float value
* You can of course lerp every number value individually
* Other way around: some types have their own built-in lerps
  * [Vector2.Lerp](https://docs.unity3d.com/ScriptReference/Vector2.Lerp.html)
  * [Vector3.Lerp](https://docs.unity3d.com/ScriptReference/Vector3.Lerp.html)
  * [Quaternion.Slerp](https://docs.unity3d.com/ScriptReference/Quaternion.Slerp.html)


## Other interpolation functions

* Mathf:
  * [SmoothStep](https://docs.unity3d.com/ScriptReference/Mathf.SmoothStep.html)
  * [LerpAngle](https://docs.unity3d.com/ScriptReference/Mathf.LerpAngle.html)
  * [SmoothDamp(Angle)](https://docs.unity3d.com/ScriptReference/Mathf.SmoothDamp.html)
  * [MoveTowards(Angle)](https://docs.unity3d.com/ScriptReference/Mathf.MoveTowards.html)

### `Quaternion.Slerp`

```c#
Vector3 relativePos = target.position + new Vector3(0,.5f,0) - transform.position;

transform.localRotation = 
  Quaternion.Slerp(
    transform.localRotation,
    Quaternion.Lookrotation(relativePos),
    Time.deltaTime
  );

transform.Translate(0,0, 3 * Time.deltaTime);
```


## Custom interpolation curves

* Lerping is a *linear* operation: the rate of change is constant during the process
* Sometimes that's not at all what we want to do, however
* You can also create custom curves with the [AnimationCurve component](../unity-cookbook/animation-curve.md)

## Extra: Inverse lerp, Remap
<!-- _backgroundColor: pink -->
* [Script Reference: Inverse lerp](https://docs.unity3d.com/ScriptReference/Mathf.InverseLerp.html)
  * lerp's inverse problem
    * when given a value $x$ between $a$ and $b$, what is $t$?  
  * `Mathf.InverseLerp(a,b,x)`
* Remapping
  * what if you want to map a range $t_0 \dots t_1$ to range $a \dots b$?
  * [Freya Holmér: Inverse Lerp and Remap](https://www.gamedev.net/articles/programming/general-and-gameplay-programming/inverse-lerp-a-super-useful-yet-often-overlooked-function-r5230/)

## Reading

* [Learn: Linear interpolation](https://learn.unity.com/tutorial/linear-interpolation?uv=2019.3&courseId=5c61706dedbc2a324a9b022d&projectId=5c8920b4edbc2a113b6bc26a#5c8a48bdedbc2a001f47cef6)
* [gamedevbeginner.com: The right way to Lerp in Unity](https://gamedevbeginner.com/the-right-way-to-lerp-in-unity-with-examples/#lerp_vector3)
* [easings.net](https://easings.net/): a source for different easing functions beyond linear interpolation