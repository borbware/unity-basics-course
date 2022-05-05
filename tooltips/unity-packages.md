---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->

# Unity Packages
## Package manager

* Window > Package Manager
* Select Packages: Unity Registry on top left
* Search for [the package you want to install]
* Install button on the bottom right corner
* Now available on the Tools menu

## Some important packages

### Cinemachine
  * for sophisticated camera control
  * [Packages: Cinemachine](https://docs.unity3d.com/Packages/com.unity.cinemachine@2.3/manual/index.html)
  * [Packages: Cinemachine Virtual Camera properties](https://docs.unity3d.com/Packages/com.unity.cinemachine@2.3/manual/CinemachineVirtualCamera.html)
  * 3D third-person cameras
    * [Unity video: Third Person Camera using Cinemachine](https://www.youtube.com/watch?v=537B1kJp9YQ)
  * 2D cameras
    * deadzones
    * Super Mario World example
    * [Brackeys video: 2D camera (Cinemachine)](https://www.youtube.com/watch?v=2jTY11Am0Ig)

### Pixel Perfect Camera
  * for pixel art games
  * [Packages: Pixel Perfect Camera](https://docs.unity3d.com/Packages/com.unity.2d.pixel-perfect@1.0/manual/index.html)
### ProBuilder
  * for greyboxing 3d levels
### 2D extras
  * for faster tilemapping

### TextMeshPro
  * The better way to make text in Unity
  * [TextMeshPro documentation](http://digitalnativestudios.com/textmeshpro/docs/)
  * In code:
    ```c#
    using TMPro;
    ...
    TextMeshProUGUI textComponent;
    textComponent.text = "asdf";
    ```
  * Gotchas:
    * To remove the **T** icon from play mode, go to *Gizmos > TextMeshProUGUI* and click on the icon, ***NOT*** the gizmo checkbox
      * [Unity Answers: How to get rid of TextMeshPro's Icon when I'm not selecting it](https://answers.unity.com/questions/1582647/how-to-get-rid-of-textmeshpros-icon-when-im-not-se.html)


### Unity Recorder
  * for marketing: recording video in the Play mode
  * https://docs.unity3d.com/Packages/com.unity.recorder@2.0/manual/index.html