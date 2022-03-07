---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Project Management 1. Git basics

# 1. About git & setup
## What is Git?

* Git is a version control tool originally created by Linus Torvalds in 2005
* Keeps track of code changes
* Can be used to backup code in the cloud
* Enables cooperation with other team members

## Git vs cloud storage

* Git is different from cloud storage services like Dropbox, Google Drive or OneDrive
  * instead of automatic syncing, you deliberately *push to* and *pull from* the cloud
  * cloud services are easier for starters
  * ...but in projects of more than one person, tracking changes would be a pain
* Git has a steep learning curve
	* To ease things, there are some visual tools like **Sourcetree** or **Sublime Merge**
	* To use them effectively, you still need to understand how Git works, though

## GitHub

* Git *could* be used locally, but is usually combined with a remote storage service like GitHub, GitLab or BitBucket
  * These services can also act as a programming portfolio
  * Commonly used in open source projects
* On this course' we'll use GitHub

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

# 2. Workflow

## Basic git workflow

* you have to tell everything you want to happen to git **explicitly** by using **git commands**
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
  * changes are synced between these two repositories **manually**
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

## Exercise 1. Creating a repo
<!-- _backgroundColor: teal -->
* Install Git to your machine.
* Create a new repository in GitHub and clone it with HTTPS to your machine.
* Then, create a new file `GitTest.md` with some lines of text in it.
* Add it, commit it, and push it to GitHub.
* Go to GitHub and see that the file is there!

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

## .gitignore

* Sometimes your project has local files that should NOT be uploaded to GitHub 
* .gitignore file in your git project folder says what files should **not** be included in the repository
* You can create it by yourself and define file names or folders which git will then ignore in the commits, e.g.,
  ```console
    someScript.js
    /folder
    *.html
  ```
## Unity .gitignore

* In Unity projects, we have to use a specific .gitignore template to keep the repository nice and clean
  * You WILL notice if you forget to add it
  * If you create a new Unity project repository in Github/etc, you can create the repo with a Unity template that adds the needed .gitignore file automatically to the remote repo
  * you can also add it by yourself before the first commit, though



## Exercise 2. Git+Unity
<!-- backgroundColor: teal -->

* create a remote repository for your week project with the Unity gitignore file. The repository should be named `WeekProject1Clock`.
* Initialize git in your Week project repository.
* Add the remote repository (the one you just created), and pull the changes.
* Commit and Push your code to GitHub.