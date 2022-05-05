---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->

# Scenes

## Scene manager

* Scene Manager, uh, manages scenes
* [Script Reference: SceneManager](https://docs.unity3d.com/ScriptReference/SceneManagement.SceneManager.html)
* [Script Reference: SceneManager.GetSceneByPath](https://docs.unity3d.com/ScriptReference/SceneManagement.SceneManager.GetSceneByPath.html)


## Loading a scene

* [Script Reference: SceneManager.LoadScene](https://docs.unity3d.com/ScriptReference/SceneManagement.SceneManager.LoadScene.html)
  * moving between scenes:
    ```c#
    SceneManager.LoadScene(sceneBuildIndex);
    SceneManager.LoadScene(sceneName);
    ``` 
  * loading the same scene where you are resets the scene (but NOT static variables!)

### Loading complex scenes

* To load a scene without unloading your current scene, use [LoadSceneMode.Additive](https://docs.unity3d.com/ScriptReference/SceneManagement.LoadSceneMode.Additive.html)
  ```c#
  SceneManager.LoadScene("YourScene", LoadSceneMode.Additive);
  ```
  * useful for big open worlds
  * If you use it, you might need to unload previously loaded levels as well
  * [Script Reference: SceneManager.UnloadSceneAsync](https://docs.unity3d.com/ScriptReference/SceneManagement.SceneManager.UnloadSceneAsync.html)

## Data persistence between scenes
* [Learn: Data persistence between scenes](https://learn.unity.com/tutorial/implement-data-persistence-between-scenes?pathwayId=5f7e17e1edbc2a5ec21a20af#)
* By default, no values persist when moving from a scene to another
* You can change this by adding a [DontDestroyOnLoad](https://docs.unity3d.com/ScriptReference/Object.DontDestroyOnLoad.html) method call
  ```c#
  private void Awake()
  {
      DontDestroyOnLoad(this.gameObject);
  }
  ```
  * Note: this only works for root GameObjects

## Creating a data manager

* We can create a data manager for bookkeeping score etc.
* We create a `static` variable that refers to it (here named `instance`)
  * -> we can use it easily from anywhere
    ```c#
    public class ScoreManager : MonoBehaviour
    {
        public static ScoreManager instance;

        private void Awake()
        {
            instance = this;
            DontDestroyOnLoad(gameObject);
        }
    }
    ```
    ```c#
    ScoreManager.instance.AddScore(1);
    ```
### Prevent other instances of data manager from appearing

* To make sure you only have one ScoreManager at all times, add these lines to the top of your ScoreManager's `Awake` method.

    ```c#
    if (instance != null)
    {
        Destroy(gameObject);
        return;
    }
    ```
* This is commonly known in software development as the ***singleton pattern***.

## Extra: Listing multiple scenes 
<!-- _backgroundColor: pink -->

* Usable for a Level select screen, etc
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

## Extra: Resources
<!-- _backgroundColor: pink -->

* [Script Reference: Resources](https://docs.unity3d.com/ScriptReference/Resources.html)
* [Script Reference: Resources.LoadAll](https://docs.unity3d.com/ScriptReference/Resources.LoadAll.html)
  * Loads all assets in a folder or file at path in a Resources folder.