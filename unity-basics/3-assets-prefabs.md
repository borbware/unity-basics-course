---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->
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
  * With [ProBuilder](../unity-cookbook/3dplatforming.md#probuilder), you can apply a material into individual parts of an object
* There are two ways to apply a Texture to a property.
  * Drag it from the Project View on top of the Texture square
  * Click the Select button, and choose the texture from the drop-down list that appears
## WP Exercise X: Materials
<!-- _backgroundColor: lightgreen -->
* Create three materials for the clock: ***White***, ***Red*** and ***Black***.
* Create a picture in your project's Assets folder and use it as a texture for ***White***.

![](imgs/clock-face-materials.png)

## Prefabs

* [Manual: Prefabs](https://docs.unity3d.com/Manual/Prefabs.html)
* ***Prefab*** is short for *prefabricated object*
* use cases...
  * objects you want to instantiate, i.e., create, during runtime
  * "Same thing, but what if many?"
    * also, objects that share common traits but have different *overrides*
### Creating prefabs
* [Manual: Creating Prefabs](https://docs.unity3d.com/Manual/CreatingPrefabs.html)
* How to turn a GameObject into a Prefab:

1) Drag a GameObject from Hierarchy to Project view
2) It turns blue - It's now an ***instance*** of a prefab
3) You can now create multiple other instances of it

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
