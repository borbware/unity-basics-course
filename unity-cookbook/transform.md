---
title: Unity Cookbook. Transform class
marp: true
paginate: true
math: mathjax
---
<!-- headingDivider: 3 -->
<!-- class: invert -->
# Transform class

## Transform

* [Script Reference: Transform](https://docs.unity3d.com/ScriptReference/Transform.html)
* [Manual: Transform](https://docs.unity3d.com/Manual/class-Transform.html)
* [Important classes: Transform](https://docs.unity3d.com/Manual/ScriptingTransform.html)
* The GameObject's ***position***, ***rotation*** and ***scale*** can be manipulated via its ***Transform*** component
  * either by using the included methods, or by directly manipulating properties
  * Properties are either ***global*** or ***local***: e.g., `position` vs `localPosition`
  * Local coordinates are with respect to the GameObject's ***parent***

### Translation

* Translation properties (can be directly changed):
  * `transform.position`
  * `transform.localPosition`
* Translation (movement) methods:
  * [`transform.Translate()`](https://docs.unity3d.com/ScriptReference/Transform.Translate.html)
    ```c#
    float moveSpeed = 3.0f;
    if(Input.GetKey(KeyCode.UpArrow))
      transform.Translate(Vector3.forward * moveSpeed * Time.deltaTime);

    if(Input.GetKey(KeyCode.DownArrow))
      transform.Translate(-Vector3.forward * moveSpeed * Time.deltaTime);
    ```
  * ***Note:*** Translating happens by default according to GameObject's local coordinate system

### Rotation

* [Manual: Rotation and orientation in Unity](https://docs.unity3d.com/Manual/QuaternionAndEulerRotationsInUnity.html)
* The rotation of a transform visible in the inspector is shown as ***Euler angles***
  * Secretly, Unity uses ***Quaternions*** to store the rotation of a transform
  * Both are available in code
* Rotation properties:
  * `transform.rotation`, global rotation as a Quaternion
  * `transform.localRotation`, local rotation as a Quaternion
  * `transform.eulerAngles`, global rotation as Euler angles (Vector3)
  * `transform.localEulerAngles`, local rotation as Euler angles (Vector3)

---

* Rotation methods:
  * [`transform.RotateAround()`](https://docs.unity3d.com/ScriptReference/Transform.RotateAround.html)
  * [`transform.LookAt()`](https://docs.unity3d.com/ScriptReference/Transform.LookAt.html)
  * [`transform.Rotate()`](https://docs.unity3d.com/ScriptReference/Transform.Rotate.html) (multiple variants available)

    ```c#
    if(Input.GetKey(KeyCode.LeftArrow))
      transform.Rotate(Vector3.up, -turnSpeed * Time.deltaTime);

    if(Input.GetKey(KeyCode.RightArrow))
      transform.Rotate(Vector3.up, turnSpeed * Time.deltaTime);
    ```

### Scale

* *There are no methods for changing scale.*
* Scale properties:
  * `transform.localScale`
    * [Script Reference: localScale](https://docs.unity3d.com/ScriptReference/Transform-localScale.html)
  * `transform.lossyScale`
    * Read-only!
    * [Script Reference: lossyScale](https://docs.unity3d.com/ScriptReference/Transform-lossyScale.html)

## Local axes

* `transform.up`, `transform.right` and `transform.forward` refer to the ***local axes*** of the GameObject: green, red and blue, respectively
  * Global versions are `Vector3.up`, `Vector3.right` and `Vector3.forward` 
* You can use them to e.g., rotate the GameObject around these axes:
    ```c#
    if (Input.GetKey(KeyCode.LeftAlt))
        transform.RotateAround(
            transform.position,  // rotates along the GameObject's origin point...
            transform.right,     // around the GameObject's red axis... 
            180 * Time.deltaTime // with a rate of 180 degrees per second.
        );  
    ```

## Exercise 1.
<!-- _backgroundColor: #29366f -->

Make a child GameObject rotate around its parent.

## Extra: How to rotate something by x degrees
<!-- _backgroundColor: #5d275d -->

* In a mishmash of vectors, rotations and transforms, it can be difficult to see what to do when trying to apply rotations!
  * Let's say, we want to rotate something around the global $z$ axis by $30\degree$.
* First, create a new rotation with `Quaternion.Euler`:
    ```c#
    Quaternion newRotation = Quaternion.Euler(0, 0, 30);
    ```
* Then, we use it to rotate whatever we need to rotate...

---
<!-- _backgroundColor: #5d275d -->

* To rotate a ***Vector3*** by a Quaternion:
    ```c#
    Vector3 newVector = newRotation * oldVector; 
    ```
* To rotate a ***Quaternion*** by a Quaternion:
    ```c#
    Quaternion newQuaternion = newRotation * oldQuaternion;
    ```
  * We can use this technique to rotate a ***Transform*** by a Quaternion:
      ```c#
      transform.rotation = newRotation * transform.rotation;
      ```
* ***Note:*** We do not need a Quaternion to rotate a transform. We can just apply the rotation with
  ```c#
  transform.Rotate(0, 0, 30);
  ```

## Extra: How to look instantly towards a point (3D)
<!-- _backgroundColor: #5d275d -->

* What if we don't know how many degrees we want to rotate something by, but instead want to rotate something so that it ***points*** to a given direction (vector)?
* To rotate to a direction given by another ***Transform***, use the previously mentioned [Transform.LookAt](https://docs.unity3d.com/ScriptReference/Transform.LookAt.html) method:
  ```c#
  transform.LookAt(otherGameObject.transform);
  ```
* To rotate to a direction given by another ***vector***, use [Quaternion.LookRotation](https://docs.unity3d.com/ScriptReference/Quaternion.LookRotation.html):
  ```c#
  transform.rotation = Quaternion.LookRotation(vector);
  ```

---
<!-- _backgroundColor: #5d275d -->

 There's also [Quaternion.FromToRotation](https://docs.unity3d.com/ScriptReference/Quaternion.FromToRotation.html) for rotating a vector to align another vector
* E.g., here's how to sets the the transform's $y$-axis (transform.up) to go along the directionVector
  ```c#
  transform.rotation = Quaternion.FromToRotation(transform.up, directionVector);
  ```

## Extra: How to look slowly towards a point (3D)
<!-- _backgroundColor: #5d275d -->

To ***slowly*** rotate towards a target, there are two methods available:
  * If you need to manipulate position vectors: [Vector3.RotateTowards](https://docs.unity3d.com/ScriptReference/Vector3.RotateTowards.html)
  * If you need to manipulate rotation quaternions: [Quaternion.RotateTowards](https://docs.unity3d.com/ScriptReference/Quaternion.RotateTowards.html)
<!-- _footer: "https://forum.unity.com/threads/look-rotation-2d-equivalent.611044/" -->

## Extra: How to instantly look towards a point (2D)
<!-- _backgroundColor: #5d275d -->

* The methods described in the previous slide do not (directly) work in 2D
* Even `transform.LookAt(Transform target)` does not work, because it aligns the `transform.forward` axis towards the target, which is the local $z$ axis - the one that points UP in 2D games!
* Instead, we want to align the `transform.right` axis towards the target:
  ```c#
  transform.right = target.transform.position - transform.position;
  ```
  (or if you want to use angles:)
  ```c#
  float angle = Mathf.Atan2(target.transform.position.y, target.transform.position.x) * Mathf.Rad2Deg;
  transform.rotation = Quaternion.Euler(new Vector3(0, 0, angle));
  ```

## How to slowly look towards a point (2D)
<!-- _backgroundColor: #5d275d -->

* uhhhh xx todo