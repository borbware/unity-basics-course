---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->
# 4: Interpolation

## Lerp, Inverse lerp, Remap

* lerp
  * linear interpolation from a to b (usually b > a), when t goes from 0 to 1
  * Mathf.Lerp
  * [gamedevbeginner.com: Lerping in Unity properly](https://gamedevbeginner.com/the-right-way-to-lerp-in-unity-with-examples/#lerp_vector3)
* inverse lerp
  * when given a value between a and b, what is t?  
  * Mathf.InverseLerp
* remap
  * [Freya Holmér: Inverse Lerp and Remap](https://www.gamedev.net/articles/programming/general-and-gameplay-programming/inverse-lerp-a-super-useful-yet-often-overlooked-function-r5230/)

## Clamping

* with Mathf.Lerp, interpolated value is a at minimum and b at maximum
* Mathf.LerpUnclamped lets the value to go beyond

## Others

  * Interpolation
    * Lerp, LerpAngle, LerpUnclamped
    * InverseLerp
    * Slerp
    * SmoothDamp(Angle)
    * SmoothStep
    * MoveTowards(Angle)
    * [Learn: Linear interpolation](https://learn.unity.com/tutorial/linear-interpolation?uv=2019.3&courseId=5c61706dedbc2a324a9b022d&projectId=5c8920b4edbc2a113b6bc26a#5c8a48bdedbc2a001f47cef6)
