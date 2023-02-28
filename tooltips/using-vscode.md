---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Using VS Code

## VS code shortcuts

* ***CTRL+F*** find from file
* ***CTRL+SHIFT+F*** find from all files
* ***CTRL+SHIFT+H*** find and replace from all files
* ***ALT+UP/DOWN*** move code line
* ***CTRL+.*** for auto-"using" / auto-creating missing functions
* ***CTRL+K***, then ***CTRL+C*** comment selection
* ***CTRL+K***, then ***CTRL+U*** uncomment selection
* ***CTRL+SHIFT+P*** command palette
* ***CTRL+P*** search for files palette
* ***CTRL+Ö*** for showing/hiding terminal

### Omnisharp shortcuts
  * ***F2***: Rename variable and automatically update references
    * Naming things correctly on the first go is difficult!
  * ***CTRL+LMB*** 
    * when clicking a method reference: *jump to definition*
    * when clicking the method definition: *jump to references*

### Editing keyboard shortcuts

* In *Preferences > Keyboard Shortcuts*, you can add own shortcuts and change existing ones 
* For example, ***CTRL+TAB*** / ***CTRL+SHIFT+TAB***:
  * Default behaviour is *View: Open Next/Previous Recently Used Editor*
  * This opens the tabs in the order of recent use, and it can be confusing
  * I tend to set the behaviour to *View: Open Next Editor* / *View: Open Previous Editor* instead
* Some shortcuts need an additional `When` parameter to know when the shortcuts are used
  * Examples in the next slide

### Extra shortcuts that I like to use (not enabled by default)
* ***CTRL+TAB*** / ***CTRL+SHIFT+TAB*** *View: Open Next Editor* / *View: Open Previous Editor*
* ***ALT+F3*** *Select All Occurrences of Find Match* when `editorFocus`
* ***CTRL+SHIFT+D*** *Copy line down* when `editorTextFocus && !editorReadOnly`
* ***CTRL+SHIFT+⬇*** *Move line down* when `editorTextFocus && !editorReadOnly`
* ***CTRL+SHIFT+⬆*** *Move line up* when `editorTextFocus && !editorReadOnly`
* ***CTRL+Ä*** 
  * *View: Focus Active Editor Group* when `terminalFocus`
  * *Terminal: Focus Terminal* elsewhere
* ***CTRL+SHIFT+Ä*** *View: Toggle Maximized Panel* (makes terminal big)