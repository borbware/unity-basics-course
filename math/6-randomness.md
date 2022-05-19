---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->

# Randomness

## The Random class


* [Important classes: Random](https://docs.unity3d.com/Manual/class-Random.html)
  * This page has all the random examples you need
* [Script Reference: Random class](https://docs.unity3d.com/ScriptReference/Random.html)

### Random.Range

* [Script Reference: Random.Range](https://docs.unity3d.com/ScriptReference/Random.Range.html)
* **Note:** For ints, the maximum value is ***exclusive***, for float it's ***inclusive***!
  * `Random.Range(0,10)` returns random integer values 0,1,...,9
  * `Random.Range(0f,10f)` returns random float values 0f,...,10f

## Input randomness vs output randomness

* [GMTK: The two types of random in game design](https://www.youtube.com/watch?v=dwI5b-wRLic)

## Terrain generation with Perlin Noise