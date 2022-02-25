---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->
# 3. Assets
## Project window

* [Docs: Project window](https://docs.unity3d.com/Manual/ProjectView.html)
* List of Assets & Packages in your projects
* Assets
	* Scenes
	* Materials
	* Prefabricated game objects
	* Graphics
	* Sound effects
	* Music
## Prefabs
### Introduction to prefabs

* [Docs: Prefabs](https://docs.unity3d.com/Manual/Prefabs.html)
* short for prefabricated object
* use cases...
  * "Same thing, but what if many?"
    * also, objects that share common traits but have different *overrides*
  * objects you want to instantiate during runtime
### How to prefab
* How to turn a gameobject into a prefab:
  * [Docs: Creating Prefabs](https://docs.unity3d.com/Manual/CreatingPrefabs.html)
  * drag a gameobject from Hierarchy to Project view
  * it turns blue! 
  * this means it's now an instance of a prefab

### Open, select, overrides

* special buttons
  * [Docs: Editing a Prefab via its instances](https://docs.unity3d.com/Manual/EditingPrefabViaInstance.html)
  * Open
    * opens the prefab in Prefab mode, a scene where only the prefab exists
    * [Docs: Editing a Prefab in Prefab mode](https://docs.unity3d.com/Manual/EditingInPrefabMode.html)
  * Select
    * selects the Prefab asset in the Project window
  * Overrides dropdown
    * variations for the prefab presets
    * when you make changes into a prefab instance, you can set those changes to be the new default
    * [Docs: Instance overrides](https://docs.unity3d.com/Manual/PrefabInstanceOverrides.html)
* overridden values in Inspector are indicated in **bold**
## Tags & Layers
* Edit > Project Settings > Tags and Layers
### Tags
* GameObject.FindWithtag("tagname");
* GameObject.FindGameObjectsWithTag("tagname");

### Layers
* [Docs: Layers](https://docs.unity3d.com/Manual/Layers.html)
* Some layers...
	* Default
	* Ignore Raycast
	* Custom
* Ignore some layers in camera
	* Inspector > Camera > Culling Mask > Layers
* Ignore some layers in Viewport
	* Top right: Layers...
* Layers can be used for selective collision detection
  * [Docs: Layer-based collision detection](https://docs.unity3d.com/Manual/LayerBasedCollision.html)

