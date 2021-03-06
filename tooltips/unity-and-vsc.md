---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->
# Unity and VS Code

## VS Code installation

* During installation, check these two options:
  ![](imgs/vscode-installation.png)

## Unity side setup

* Include the *Visual Studio Code Editor* Package in your projects
  * If you removed it, you can add it in *Window > Package Manager*
* Set VS Code as your Unity default editor
  * *Edit > Preferences > External Tools > External Script Editor*
  * You might have to click the *Regenerate project files* button to get all features working 

## VS Code side setup
* Install the prerequisities for code completion & other niceness
  * You need to install these applications:
    * [.NET Core SDK](https://code.visualstudio.com/docs/other/unity#_prerequisites)
      * Remember to reboot your computer after installing
    * [.NET Framework 4.7.1 Developer Pack](https://code.visualstudio.com/docs/other/unity#_enabling-code-completion-for-recent-versions-of-unity)
      * ***Be sure to download the Developer pack, not Runtime!!***
  * And these VS Code extensions:
    * C#
    * Unity code snippets
* Open the project folder in VS Code
  * Either by opening the folder from File Explorer context menu (*Open with Code*)
  * Or in VS Code *File >  Open Folder...*

## Omnisharp

* After the previous procedure, VS code should have ***Omnisharp*** enabled
  * Number of references are shown on top of every variable & class
    ![](imgs/references.png)
  * You can hover over a method name to see details
    ![](imgs/hover-over-method.png)
    * argument types, return types, method overloads...
### Omnisharp shortcuts
  * ***F2***: Rename variable and automatically update references
    * Naming things correctly on the first go is difficult!
  * ***CTRL+LMB*** 
    * when clicking a method reference: *jump to definition*
    * when clicking the method definition: *jump to references*

### Omnisharp troubleshooting

* Sometimes Omnisharp stops working, here's something you can try to fix it:
    1) Check that .NET is installed by running `dotnet` in the VS code terminal
    2) In Unity: *Edit > Preferences > External tools > Regenerate Project Files*
    3) In VS Code: ***CTRL+SHIFT+P*** *> Omnisharp: Restart Omnisharp*
    4) In VS Code: Add this line inside the curly braces to the configuration file `.vscode/settings.json`:
        ```
        "omnisharp.useModernNet": false
        ``` 

## VS code shortcuts

* ***CTRL+SHIFT+F*** find from all files
* ***CTRL+SHIFT+H*** find and replace from all files
* ***ALT+UP/DOWN*** move code line
* ***CTRL+??*** for showing/hiding terminal
* ***CTRL+.*** for auto-"using" / auto-creating missing functions
* ***CTRL+K***, then ***CTRL+C*** comment selection
* ***CTRL+K***, then ***CTRL+U*** uncomment selection
### Extra shortcuts that I like to use (not enabled by default)
* ***CTRL+TAB*** / ***CTRL+SHIFT+TAB*** 
  * *View: Open Next/Previous Recently Used Editor*
  * By default, these shortcuts open the recently used tab, and it can be confusing
  * You can change the behaviour in *Preferences > Keyboard Shortcuts*
  * Set behaviour to *View: Open Next Editor* / *View: Open Previous Editor*

* ***CTRL+SHIFT+D*** copy line down (not by default, change to this if you like)


## Extra: Other extensions
<!-- _backgroundColor: pink -->
* *Marp for VS Code*
  * if you want to read these slides inside VS code
  * after installation, open this .md file from the course repository
  * click on the *Open preview to the side* button
    * a vertically split square with a magnifying glass on the top right corner