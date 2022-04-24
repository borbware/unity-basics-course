---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->

# Tile-based backgrounds

## Tilemaps

* Tilemaps are images that are split into constant-size tiles
  * They're used often for creating loads of background art in 2D games
* A good introduction to Unity tilemaps:
  * [Brackeys video: Tilemaps](https://www.youtube.com/watch?v=ryISV_nH8qw)
* See this [free asset pack](https://cupnooble.itch.io/sprout-lands-asset-pack) for example!

### Creating a tilemap 

* [Manual: Tilemap workflow](https://docs.unity3d.com/Manual/Tilemap-workflow.html)
* To create a new tilemap, import a tilemap sprite (See: [2D basics: Sprite renderer component](2d-basics.md#sprite-renderer-component))
  * Then, open Sprite Editor in the Sprite asset Inspector
  * Slice Grid by cell size
  * Then, create a [Tilemap](https://docs.unity3d.com/Manual/class-Tilemap.html) GameObject
    * A [Grid](https://docs.unity3d.com/Manual/class-Grid.html) GameObject will be its parent!
* For multiple layers, you can create multiple tilemaps under the same grid
  * It's a good idea to have at least two layers: 
  * "Terrain tiles" for traversable background
  * "Wall tiles" for collidable walls
## Tilemap GameObject

* Tilemap GameObject has two components
* Tilemap Component
  * [Manual: Tilemap](https://docs.unity3d.com/Manual/class-Tilemap.html)
* Tilemap Renderer Component
  * [Manual: Tilemap renderer](https://docs.unity3d.com/Manual/class-TilemapRenderer.html)

### Creating a level with Tile Palette

* Open ***Tile Palette***: *Window > 2D > Tile Palette*
* Drag the previously-imported Tilemap from the Project window to the Tile Palette window.
* This creates a ***Tile Asset***
  * [Manual: Tile Assets](https://docs.unity3d.com/Manual/Tilemap-TileAsset.html)
* Then, paint away to create your tile-based level!

## Collision

* To add collision to your tilemap layer, just add the ***Tilemap Collider 2D*** component to it
* [Manual: Tilemap collider 2d](https://docs.unity3d.com/Manual/class-TilemapCollider2D.html)

## 2D Extras

* [Packages: 2D Tilemap Extras](https://docs.unity3d.com/Packages/com.unity.2d.tilemap.extras@1.6/manual/index.html)
* For autotiling and other goodies, you need the ***2d Extras*** Package
  * It's in the Unity Package Manager
## 2D extras: Autotiling

* ***Autotiling*** is a technique for creating 2d levels faster with ***rule tiles***
* After installing 2D extras you can follow this:
  * [How To Use Auto Tiling in Unity 2020](https://www.youtube.com/watch?v=nfjAznD_MaU)
* *Create > 2D > Tiles > Rule Tile*
  * Drag a sprite to Inspector
  * Add *Tiling Rules* (see next slide)
  * Then, Drag the Rule Tile to your Tile Palette
  * Use the Rule tile to draw levels faster!

### Autotiling: Tiling Rules

![](imgs/autotiling.png)

## 2d extras: Animated tile
<!-- backgroundColor: pink -->

* Use the Animated Tile to create tiles with animations in them.
  * *Create > 2D > Tiles > Animated Tile* 


## Exercise 1. A tiled level
<!-- _backgroundColor: Khaki -->

Import a tilemap from an existing sprite sheet. Create a tiny level out of your tile assets!
