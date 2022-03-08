## Scenes

* move between scenes
  ```c#
  SceneManager.LoadScene (sceneBuildIndex:/*Put the number here*/);
  // Or, you can use this script to load a scene based on the name of a scene:
  SceneManager.LoadScene (sceneName:"Put the name of the scene here");
  ``` 


## Data persistence between scenes
* https://learn.unity.com/tutorial/implement-data-persistence-between-scenes?pathwayId=5f7e17e1edbc2a5ec21a20af#
* DontDestroyOnLoad
* Static classes & class members
* singleton pattern


## Data persistence between sessions

### Saving & Loading