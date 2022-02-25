---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Git
# 1. About git & setup
## What is Git?

* Git is a version control tool made by Linus Torvalds
* It keeps track of your changes done in the code and can be used to backup your code in the cloud
* It allows you to cooperate with other team members!
## Git vs cloud storage

* Git works quite differently when compared to cloud storage services like Dropbox, Google Drive or OneDrive
	* These services can be ok for starters because their ease of use
	* ...but only for small solo projects! Because collaboration and tracking changes is a pain
* Git has a learning curve
	* ...but there are some visual tools like **Sourcetree** or **Sublime Merge** to make starting out easier
	* You still need to understand how Git works, though, so let’s get started
## Git & cloud storage

* Note: Do not ever use Git inside a cloud storage (Dropbox, etc.) folder
* Git can be used only locally, but is usually combined with a remote storage service like GitHub, GitLab or BitBucket
	* These services also double as a portfolio if you’re into getting  hired in the industry
	* Even more crucial if you want to contribute to open source projects
## Alarming story
* Say, you have a Python code block like this:
  ```python
  if a == 1:
    print("a is one")
    break
  ```
* One missed tab and it becomes...
  ```python
  if a == 1:
    print("a is one")
  break
  ```
* It can take 2 weeks to find the bug
  * would be immediately noticed with Git!

## Benefits of Git
* So: git is a great backup tool and you also easily see if you accidentally change code
* If you want to do huge changes to your code you won't need to worry that you mess up too bad
	* you can always roll your code back and try again!
# 2. Workflow & basic commands
## Setup

* Needs to be done only once per machine
* Install Git
  * [Windows/Mac](https://git-scm.com)
  * Linux: sudo apt-get install git 
  * Make a new project folder on your desktop and create a text file there.
  * Open terminal/command line and navigate to this folder using `cd` and `ls` (linux/mac) or `dir` (windows)
* To configure your git username for every project:
  * Use `git config --global user.name "myUserName"`
  * and `git config --global user.email "my.email.address@domain.com"`
## Git workflow 1: basics
* unlike cloud storage apps, git doesn't upload changes automatically anywhere
* you have to tell everything you want to happen to git **manually**, by using **git commands**
* a common git workflow example:
 1) you make changes in some code file
 2) you tell git what files you've changed ([`git add`](#git-status--git-add))
 3) you tell git what changes you made in that file ([`git commit`](#git-commit--git-push))
 4) you upload those changes to a remote repository ([`git push`](#git-commit--git-push))

## Repositories

* repository is essentially a place to store code files in
* usually, we are dealing with *two* repositories: a **local** and a **remote** one
  * local repository is the one on your computer
  * remote repository is stored in a cloud service like github
    * [Here](https://github.com/borbware/unity-basics-course) is the remote repository for the materials of this course
  * changes are synced between these two repositories manually
## git init

* Initialization needs to be made for every new git repository
* If you're starting from scratch:
  * Use `git init` to make your current folder a new git repository
* If you've continuing an existing project, initialization happens when you **clone** the project into your computer
  * See: [`git clone`](#git-clone--git-remote)
## git status & git add

* Using the command `git status` shows your current situation.
* every time you want git to 
* The command `git add readme.txt` makes git track the file `readme.txt`
* Using the command `git add .` adds all files from the folder to git
* Using **wildcards** (`*`) can be useful. For example `git add *.txt` adds all .txt files to git
## git commit & git push

* When you have added all the files you want, you then have to explain what changes you've made
  * `git commit -m "add new enemy"`
* every new commit creates a new point in the project timeline.
  * you can always jump back between different points (See `git checkout`)
* Commit message should clearly, concisely tell what kind of changes you have made
* **Note**: The commit action is **local**, so any changes haven't gone to the remote repository yet
  * To actually upload changes to the remote repository, use: 
  * `git push`

## git pull

* when you have changes in the remote repository that you want to apply in the local repository, use `git pull`
* use cases:
  * if you are working in a team
  * if you work on multiple computers
  * that is to say, if you only work alone on a single computer, this isn't really ever needed
* **Note**: It's always a good idea to **PULL BEFORE PUSHING**.
* **Note 2**: `git pull` is actually two commands in one. It's the same thing as doing
  * `git fetch <branch>` + `git merge <branch>`
## git clone & git remote

* If you want to initialize local repository from an already existing remote repository:
  * run `git clone [URL]`
  * example: `git clone https://github.com/borbware/unity-basics-course.git`
  * `git init` not needed!
* it can be simpler to initialize the repo in the Github/Gitlab/etc website and then just clone the repo!
  * if you have inited the git repo already, though, then use:
  * `git remote add origin [URL]`
  * now, "origin" refers to the remote repository
* To check which remote repository the current local repository is linked to, use 
  * `git remote -v`


## Git workflow 2: branches
* a git repository can have multiple **branches**
  * by default, git repository has only one branch, named **master** or **main**
  * using multiple branches makes it possible to work on new features step by step in their own **feature branches**
    * meanwhile, the master branch is kept clean and in a working state
    * only when the feature is completed, the branch is merged into the master branch! 
* Even though your local repository can have multiple branches, only one of them is *active* at a given time
* `git status` tells you firsthand which branch you are on: "`On branch master`"
## git branch & git checkout

* You can create a new branch with `git branch branchName`
  * **Note:** this command does not make the branch active!
* You can move to a branch with `git checkout branchName`. 
  * For example, to move back to master use `git checkout master`
* Additionally, you can list local branches with `git branch` 
  * and all branches (incl. remote ones) with `git branch -a`
* delete a local branch with `git branch -d branchName`
  * remote branch can be deleted in the github/etc website, or like [this](https://koukia.ca/delete-a-local-and-a-remote-git-branch-61df0b10d323).
* **Note:** There's also a handy command `git checkout -b branchName`
  * It's a shorthand for `git branch branchName` + `git checkout branchName`
## Local vs. remote branches

* git branch branchName only creates a local branch
* when you try to push changes from a new local branch, git nags you that a matching remote branch doesn't yet exist
  * git tells you how to create the remote branch:
    * `git push --set-upstream origin newBranch`
    * afterwards, `git push` pushes the changes to the matching remote branch
## git merge

* when the feature is done and all the broken things fixed, you want to merge your feature branch back to master
* First, checkout the master branch with `git checkout master`
* Then, do a `git pull` so you have the newest version of the master branch
  * someone else might have done changes to it while you were working on your feature!
* Then, merge the feature branch to master with `git merge featureBranchName`
  * this is where **conflicts** can happen
## Exercise 1. Creating a repo
<!-- _backgroundColor: teal -->
* Install Git to your machine.
* Create a new repository in GitHub and clone it with HTTPS to your machine.
* Then, create a new file `GitTest.md` with some lines of text in it.
* Add it, commit it, and push it to GitHub.
* Go to GitHub and see that the file is there!
## Exercise 2. Pushing onwards
<!-- _backgroundColor: teal -->

* Create a new branch (with a name `new-feature`, for instance) in your local repository.
* Checkout the branch, make some changes to `GitTest.md` there, and push the changes to GitHub.
* Then, merge the changes from your `new-feature` branch to `master` branch by using
  a) git merge from command line
  b) pull request in GitHub
# 3. Conflicts
## GitLens

* to make git workflow easier, install the GitLens extension to VS code
  * helps in managing conflicts, comparing branches or commits
* Install it from the Extensions panel ([CTRL+SHIFT+X])
## Conflicts

* sometimes two people have made changes in the same lines of code!
* this leads to a conflict that looks like this:
  ```c#
  <<<<<<< HEAD:Player.cs
    if (Input.anyKey) {
      return true;
    }
  =======
    if (Input.anyKey)
        return true;
  >>>>>>> iss53:Player.cs
  ```
* "current change" is between `<<<<` and `====`, old code in `master`
* "incoming change" is between `>>>>` and `====`, new code from `featureBranch`
* use your text editor to choose which (or some combination of both) you want to preserve
## After resolving the conflict
* After resolving conflicting files, use `git add filename` to add them to the commit
* Then use `git commit` (without a message) to apply changes. This should finish the merge.
* Then just `git push` to apply changes in the remote repository

## Git workflow 3: Undoing
* git doesn't have a general "undo" command
* if you make a mistake, it is very case-specific what you need to do to fix it
  * See [undo options here](https://docs.gitlab.com/ee/topics/git/numerous_undo_possibilities_in_git/)  
  * Also, [ohshitgit.com](https://ohshitgit.com/)
## git log & git checkout commitHash

* use `git log` to see verbose history
* or `git log --oneline` for a more concise version
  * the newest changes are seen on top
  * on the left side of the commit message you see the *hashcode* of the commit
  * use `git checkout hashcode` to "time travel" into the commit
## .gitignore

* .gitignore file in your git project folder says what files should **not** be included in the repository
* You can create it by yourself and define file names or folders which git will then ignore in the commits, e.g.,
  ```console
    someScript.js
    /folder
    *.html
  ```
## Unity gitignore

* In Unity projects, we have to use a specific .gitignore template to keep the repository nice and clean
  * You WILL notice if you forget to add it
  * If you create a new Unity project repository in Github/etc, you can create the repo with a Unity template that adds the needed .gitignore file automatically to the remote repo
  * you can also add it by yourself before the first commit, though

# 4. Workflow examples
## Common workflow

`git status`

`git add filename`	(if new files added)

`git commit filename -m "make change"`

`git pull` (if working in a team, always pull before pushing!)

`git push`

## Creating a new branch

`git branch newBranch`

`git checkout newBranch`

`git add newFile.txt`

`git commit -m "add newFile.txt"`

`git push --set-upstream origin newBranch`

* (the line above creates a new remote branch. After doing it once, you can just use regular git push)

## Merging a feature branch to master

`git checkout master`

`git merge newBranch`

* this is where the conflicts happen. Fix them in VS code

`git add conflictedFile.txt`

`git commit`

`git push`

## Exercise 3. Team effort
<!-- backgroundColor: teal -->
* Work as a group for this assignment.
* Use someone's repository from previous assignments and clone local copies of it to other group members.
* **Note:** The owner of the repo has to authorize others so that others can push into the repo!
* Every group member creates an individual branch from the master, and makes some changes to the `GitTest.md` file.
* New files can be added as well.
* Do not tell other group members what you're going to change! :D
* Then, Merge the changes back to the master branch. Fix ensuing conflicts, if any appear.
## Exercise 4. Git+Unity
<!-- backgroundColor: teal -->

* create a remote repository for your week project with the Unity gitignore file. The repository should be named `WeekProject1Clock`.
* Initialize git in your Week project repository.
* Add the remote repository (the one you just created), and pull the changes.
* Commit and Push your code to GitHub.