---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->
# Unity and VS Code
## Basics

* Set VS Code as your Unity default editor
  * Unity: *Edit > Preferences > External Tools > External Script Editor*
* Install the prerequisities for code completion & other niceness
  * https://code.visualstudio.com/docs/other/unity
  * dotnet
  * C# extension
* Open the project folder in VS Code
  * VSC: *File >  Open Folder...*

## Other extensions

* *Marp for VS Code*
  * if you want to read these slides inside VS code
  * after installation, open this .md file from the course repository
  * click on the *Open preview to the side* button
    * a vertically split square with a magnifying glass on the top right corner
* *GitLens*
  * if you're serious about git


## VS code shortcuts

* ***CTRL+SHIFT+UP/DOWN*** move code line
* ***CTRL+SHIFT+D*** duplicate line
* ***CTRL+Ö*** for showing/hiding terminal
* ***CTRL+.*** for auto-"using" / auto-creating missing functions
* ***CTRL+TAB*** / ***CTRL+SHIFT+TAB*** 
  * *View: Open Next/Previous Recently Used Editor*
  * By default, these shortcuts open the recently used tab, and it can be confusing
  * You can change the behaviour in *Preferences > Keyboard Shortcuts*
  * Set behaviour to *View: Open Next Editor* / *View: Open Previous Editor*
  
## C# tips

* ***F2***: Rename variable and automatically update references
  * Naming things correctly on the first go is difficult!
* ***CTRL+LMB*** 
  * when clicking a method reference: *jump to definition*
  * when clicking the method definition: *jump to references*
* Hover over a method name to see details
  ![](imgs/hover-over-method.png)
  * argument types, return types, method overloads...
  * this feature only works if dotnet and the C# extension are installed