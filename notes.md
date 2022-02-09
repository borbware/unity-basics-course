# Unity gotchas

- changes made during the playmode do not persist
  - protip: change playmode tint in Edit > Preferences > Colors to red.
- 3D: In blender3d, asdf. In Unity, "y" is the "up" axis.
- "The associated script cannot be loaded"
  - if you rename a script file, rename the class inside as well >:)

# Snippets
- check component type:
  - `c.GetType() == typeof(Transform)`

- move between scenes
```c#
SceneManager.LoadScene (sceneBuildIndex:/*Put the number here*/);
// Or, you can use this script to load a scene based on the name of a scene:
SceneManager.LoadScene (sceneName:"Put the name of the scene here");
``` 

- `[ExecuteInEditMode]`
