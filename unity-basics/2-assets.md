---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->
# 2. Assets
## Project window

* [Manual: Project window](https://docs.unity3d.com/Manual/ProjectView.html)
* List of Assets & Packages in your projects
* Assets
	* Scenes
	* Materials
	* Prefabricated game objects
	* Graphics
	* Sound effects
	* Music

## Using assets

xx
## WP Exercise 1: Importing a texture

* Create a picture with an image editor to use as a clock face.
* Add it to your project's Assets folder and use it as a material for the clock face.

## Prefabs
### Introduction to prefabs

* [Manual: Prefabs](https://docs.unity3d.com/Manual/Prefabs.html)
* short for prefabricated object
* use cases...
  * "Same thing, but what if many?"
    * also, objects that share common traits but have different *overrides*
  * objects you want to instantiate during runtime
### How to prefab
* How to turn a gameobject into a prefab:
  * [Manual: Creating Prefabs](https://docs.unity3d.com/Manual/CreatingPrefabs.html)
  * drag a gameobject from Hierarchy to Project view
  * it turns blue! 
  * this means it's now an instance of a prefab

### Open, select, overrides

* special buttons
  * [Manual: Editing a Prefab via its instances](https://docs.unity3d.com/Manual/EditingPrefabViaInstance.html)
  * Open
    * opens the prefab in Prefab mode, a scene where only the prefab exists
    * [Manual: Editing a Prefab in Prefab mode](https://docs.unity3d.com/Manual/EditingInPrefabMode.html)
  * Select
    * selects the Prefab asset in the Project window
  * Overrides dropdown
    * variations for the prefab presets
    * when you make changes into a prefab instance, you can set those changes to be the new default
    * [Manual: Instance overrides](https://docs.unity3d.com/Manual/PrefabInstanceOverrides.html)
* overridden values in Inspector are indicated in **bold**


## WP Exercise 2: Using prefabs

Create a prefab out of the clock and then create a duplicate of it in the scene.
