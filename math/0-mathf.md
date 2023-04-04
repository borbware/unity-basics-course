---
marp: true
paginate: true
math: mathjax
title: Math 0. Helpful Math Functions
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# 0. Helpful Math functions

## The `Mathf` class
* [Important classes: Mathf class](https://docs.unity3d.com/Manual/class-Mathf.html)
* [Script reference: Mathf class](https://docs.unity3d.com/ScriptReference/Mathf.html)
* Unity has a built-in `Mathf` class that includes important methods and constants
* Before diving deeper, let's introduce just a few of them



## `Abs`

* `Mathf.Abs(number)`
* gives the ***absolute value*** of a number
* negative numbers become positive, positive numbers stay positive
	```c#
	Mathf.Abs(-3.0f) 	// returns 3.0f
	Mathf.Abs(2.5f) 	// returns 2.5f
	```
* good for ***magnitude comparisons*** where your value can be negative or positive
  * e.g., if you want to do stuff only when velocity is under a maximum value: 
	```c#
	if (Mathf.Abs(rb.velocity) < maxVelocity)
	{
	    // do stuff
	}
	```
  * how would this behave without `Abs`?

## `Min` and `Max`

* `Mathf.Min(value1, value2)`
  * returns the ***smaller*** of the two given values
  * use if you want that some value ***shouldn't be greater than an upper limit***
  	```c#
	HP = Mathf.Min(HP, maxHP) // makes sure HP is never greater than maxHP
	```
* `Mathf.Max(value1, value2)` 
  * returns the ***greater*** of the two given values
  * use if you want that some value ***shouldn't be smaller than a lower limit***
    ```c#
	HP = Mathf.Max(HP, 0.0f) // makes sure HP is never smaller than zero
	```

## `Clamp`

* `Mathf.Clamp(value, min, max)` 
  * a combination of `Min` and `Max`
  * if you want a value to always be between a lower and an upper limit, use this!
  * we can combine the previous HP examples into one:
    ```c#
	HP = Mathf.Clamp(HP, 0.0f, maxHP) // HP is never smaller than zero or greater than maxHP
	```

## Exercise 1: Minmaxing
<!-- _backgroundColor: #29366f -->
try out tms xx