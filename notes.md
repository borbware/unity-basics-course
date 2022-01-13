# Unity gotchas

- changes made during the playmode do not persist
  - protip: change playmode tint in Edit > Preferences > Colors to red.
- 3D: In blender3d, asdf. In Unity, "y" is the "up" axis.
- "The associated script cannot be loaded"
  - if you rename a script file, rename the class inside as well >:)

# Unity and VS Code

## Basics

- Set VS Code as your default editor
  - Edit > Preferences > External Tools > External Script Editor
  - Install the prerequisities for code completion & other niceness
    - https://code.visualstudio.com/docs/other/unity

## Debugging, Warnings

## Using VS Code effectively

- [CTRL+SHIFT+UP/DOWN] move code line
- [CTRL+SHIFT+D] duplicate line
- [F2]: Rename variable and update references
- [CTRL+TAB] / [CTRL+SHIFT+TAB] View: Open Next Editor / View: Open Previous Editor
  - You need to change this manually
- [CTRL+.] for auto-"using" / auto-creating missing functions
- [CTRL+Ö] for showing/hiding terminal
  
# Collaboration in Unity

- logging into Github
  - cannot use password anymore, you have to create a token for https. https://github.blog/2020-12-15-token-authentication-requirements-for-git-operations/#what-you-need-to-do-today
  - repo, workflow, gist


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

# Links

- Component vs Behaviour vs Monobehaviour
  - https://stackoverflow.com/questions/44540747/what-is-the-difference-between-component-behaviour-and-monobehaviour-and-why-t

- Lerping in Unity properly
  - https://gamedevbeginner.com/the-right-way-to-lerp-in-unity-with-examples/#lerp_vector3