---
title: Unity Cookbook. Saving and loading
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Saving and loading

## Data persistence between sessions

## PlayerPrefs

* [Script Reference: PlayerPrefs](https://docs.unity3d.com/ScriptReference/PlayerPrefs.html)
* You can store ints, floats or strings in PlayerPrefs
  * ...which are stored in the ***Registry*** :D
  * Not preferred for save files!!!
  * More suitable for saving game preferences
* Set value with `PlayerPrefs.SetInt(intValue)`
* Clear saved data with *Edit > Clear All PlayerPrefs*

## Serializing data to/from JSON

* [Unity Save Load JSON file tutorial in 10 minutes](https://myunity.dev/en/unity-save-load-json-file-tutorial-in-10-minutes/)

---

![](imgs/saving-tweet.png)

<!-- https://twitter.com/daisyowl/status/1620215845954912256?t=mNQx17OSVFs6PdwnkgZ3nQ&s=19 -->