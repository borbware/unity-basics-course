---
title: Unity Basics 3. Assets & Prefabs
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# 3. Assets & Prefabs

## Asset workflow

* [Manual: Asset Workflow](https://docs.unity3d.com/Manual/AssetWorkflow.html)
* [Manual: Importing Assets](https://docs.unity3d.com/Manual/ImportingAssets.html)

## Materials, Shaders and Textures

* [Materials](https://docs.unity3d.com/Manual/materials-introduction.html) define how a surface should be rendered: textures, color, lighting...
* [Shaders](https://docs.unity3d.com/Manual/shader-introduction.html) are scripts that calculate how color of a pixel should be rendered
* [Textures](https://docs.unity3d.com/Manual/Textures.html) are bitmap images that can be used to draw shapes to materials, but also manipulate material's surface

### Using materials

* [Old Manual: Creating and Using Materials](https://docs.unity3d.com/560/Documentation/Manual/Materials.html)
  * Materials are by default applied to the whole GameObject
  * With [ProBuilder](../unity-cookbook/3dplatforming#probuilder), you can apply a material into individual parts of an object
* There are two ways to apply a Texture to a property.
  * Drag it from the Project View on top of the Texture square
  * Click the Select button, and choose the texture from the drop-down list that appears

## Prefabs

* [Manual: Prefabs](https://docs.unity3d.com/Manual/Prefabs.html)
* ***Prefab*** is short for ***prefabricated object***
* use cases...
  * GameObjects you want to instantiate, i.e., create, during runtime
  * "Same thing, but what if many?"
    * not necessary completely identical, however!
    * share common traits but have different details

### Creating prefabs

* [Manual: Creating Prefabs](https://docs.unity3d.com/Manual/CreatingPrefabs.html)
* How to turn a GameObject into a Prefab:

1) Drag a GameObject from Hierarchy to Project view
2) It turns blue - It's now an ***instance*** of a Prefab
3) You can now create multiple other instances of it

### Open & select

![](https://docs.unity3d.com/uploads/Main/PrefabsInspectorControls1.png)
  * [Manual: Editing a Prefab via its instances](https://docs.unity3d.com/Manual/EditingPrefabViaInstance.html)
  * ***Open***
    * opens the Prefab in ***Prefab mode***, a scene where only the Prefab exists
    * [Manual: Editing a Prefab in Prefab mode](https://docs.unity3d.com/Manual/EditingInPrefabMode.html)
  * ***Select***
    * selects the Prefab asset in the Project window

### Overrides

![](https://docs.unity3d.com/uploads/Main/PrefabsOverridesDropdown1.png)
  * [Manual: Instance overrides](https://docs.unity3d.com/Manual/PrefabInstanceOverrides.html)
  * ***Overrides*** dropdown menu
    * lists all the overridden values ("overrides") on this Prefab instance
    * overrides can be ***applied*** to set them to be the new default in the Prefab asset
    * ...or ***reverted*** to discard your changes and go back to asset defaults
* overridden values in Inspector are indicated in **bold**

## Extra: Nested prefabs
<!-- _backgroundColor: #5d275d -->

* Prefab inside Prefab
* [Manual: Nested Prefabs](https://docs.unity3d.com/Manual/NestedPrefabs.html)

## Extra: Instantiating Prefabs
<!-- _backgroundColor: #5d275d -->

* You can use code to create instances of prefabs when the game is running
* [Manual: Instantiating Prefabs at run time
](https://docs.unity3d.com/Manual/InstantiatingPrefabs.html)