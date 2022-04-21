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
  * `Mathf.Lerp(a, b, t)`

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
* with `Mathf.LerpUnclamped`, the value is extrapolated when outside the limits!

## Exercise 1. Do a lerp!
<!-- _backgroundColor: Khaki -->
After pressing a button once, lerp GameObject's color from red to blue.

***Bonus:*** After pressing twice, lerp the color back to red.
***Bonus bonus:*** What if you press the button _during_ lerping?

## Lerping different data types

* Some data types are more complicated than just one float value
* Luckily, they often have their own built-in lerps
  * Vector3.Lerp
  * Quaternion.Slerp

## Other interpolation stuff...?

* Mathf:
  * LerpAngle
  * SmoothDamp(Angle)
  * MoveTowards(Angle)
  * Slerp
  * SmoothStep

## Custom interpolation curves

* Lerping is a *linear* operation: the rate of change is constant during the process
* Sometimes that's not at all what we want to do, however
* You can also create custom curves with the [AnimationCurve component](../unity-cookbook/animation-curve.md)

## Extra: Inverse lerp, Remap
<!-- _backgroundColor: pink -->
* [Script Reference: inverse lerp](https://docs.unity3d.com/ScriptReference/Mathf.InverseLerp.html)
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