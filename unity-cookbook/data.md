## Scenes

* [Script Reference: SceneManager](https://docs.unity3d.com/ScriptReference/SceneManagement.SceneManager.html)
* [Script Reference: SceneManager.GetSceneByPath](https://docs.unity3d.com/ScriptReference/SceneManagement.SceneManager.GetSceneByPath.html)
* [Script Reference: SceneManager.LoadScene](https://docs.unity3d.com/ScriptReference/SceneManagement.SceneManager.LoadScene.html)
* move between scenes
  ```c#
  SceneManager.LoadScene (sceneBuildIndex:/*Put the number here*/);
  // Or, you can use this script to load a scene based on the name of a scene:
  SceneManager.LoadScene (sceneName:"Put the name of the scene here");
  ``` 

### List multiple scenes for a Level select screen

* Get a list of files in a given path:
  ```c#
  string [] files = System.IO.Directory.GetFiles(path);
  foreach (string file in files)
  {
      //Do work on the files here
  }
  ```
* Then, choose ones that `.EndsWith(".unity")`
* ***Hint:*** `Application.datapath` tells the root of Assets path


## Data persistence between scenes
* https://learn.unity.com/tutorial/implement-data-persistence-between-scenes?pathwayId=5f7e17e1edbc2a5ec21a20af#
* DontDestroyOnLoad
* Static classes & class members
* singleton pattern


## Data persistence between sessions

### Saving & Loading

* [Script Reference: PlayerPrefs](https://docs.unity3d.com/ScriptReference/PlayerPrefs.html)
* This stores Ints, Floats or Strings... in the Registry :D
* `PlayerPrefs.SetInt(intValue)`

## Extra: Resources

* [Script Reference: Resources](https://docs.unity3d.com/ScriptReference/Resources.html)

* [Script Reference: Resources.LoadAll](https://docs.unity3d.com/ScriptReference/Resources.LoadAll.html)
  * Loads all assets in a folder or file at path in a Resources folder.