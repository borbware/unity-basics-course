---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->
# Transform class

## Transform

* [Script Reference: Transform](https://docs.unity3d.com/ScriptReference/Transform.html)
* [Manual: Transform](https://docs.unity3d.com/Manual/class-Transform.html)
* [Important classes: Transform](https://docs.unity3d.com/Manual/ScriptingTransform.html)
* The GameObject's ***position***, ***rotation*** and ***scale*** can be manipulated via its ***Transform*** component
  * either by using the included methods, or by directly manipulating fields
  * fields are either ***global*** or ***local***: e.g., `position` vs `localPosition`
  * local coordinates are with respect to the GameObject's ***parent***



### Translation
* Translation (movement) methods
  * [`transform.Translate(Vector3 displacement)`](https://docs.unity3d.com/ScriptReference/Transform.Translate.html)
    ```c#
    float moveSpeed = 3.0f;
    if(Input.GetKey(KeyCode.UpArrow))
      transform.Translate(Vector3.forward * moveSpeed * Time.deltaTime);

    if(Input.GetKey(KeyCode.DownArrow))
      transform.Translate(-Vector3.forward * moveSpeed * Time.deltaTime);
    ```
* Translation fields (Vector3)
  * `transform.position`
  * `transform.localPosition`
### Rotation

* [Manual: Rotation and orientation in Unity](https://docs.unity3d.com/Manual/QuaternionAndEulerRotationsInUnity.html)
* Rotation methods
  * [`transform.RotateAround(Vector3 pivot)`](https://docs.unity3d.com/ScriptReference/Transform.RotateAround.html)
  * [`transform.LookAt(Transform target)`](https://docs.unity3d.com/ScriptReference/Transform.LookAt.html)
  * [`transform.Rotate`](https://docs.unity3d.com/ScriptReference/Transform.Rotate.html)
    * multiple variants available
    ```c#
    if(Input.GetKey(KeyCode.LeftArrow))
      transform.Rotate(Vector3.up, -turnSpeed * Time.deltaTime);

    if(Input.GetKey(KeyCode.RightArrow))
      transform.Rotate(Vector3.up, turnSpeed * Time.deltaTime);
    ```
---
* Rotation fields
  * `transform.rotation`, global rotation as a Quaternion
  * `transform.localRotation`, local rotation as a Quaternion
  * `transform.eulerAngles`, global rotation as Euler angles (Vector3)
  * `transform.localEulerAngles`, local rotation as Euler angles (Vector3)



### Scale

* `transform.localScale`
  * [Script Reference: localScale](https://docs.unity3d.com/ScriptReference/Transform-localScale.html)
* `transform.lossyScale`
  * Read-only!
  * [Script Reference: lossyScale](https://docs.unity3d.com/ScriptReference/Transform-lossyScale.html)

## Local axes

* `transform.up`, `transform.right` and `transform.forward` refer to the ***local axes*** of the GameObject: green, red and blue, respectively
  * Global versions are `Vector3.up`, `Vector3.right` and `Vector3.forward` 
* you can use them to e.g., rotate the GameObject around these axes:
    ```c#
    if (Input.GetKey(KeyCode.LeftAlt))
        transform.RotateAround(
            transform.position,  // rotates along the GameObject's origin point...
            transform.right,     // around the GameObject's red axis... 
            180 * Time.deltaTime // with a rate of 180 degrees per second.
        );  
  ```

## Exercise 1.
<!-- _backgroundColor: Khaki -->

Make a child GameObject rotate around its parent.