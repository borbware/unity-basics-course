---
marp: tru
---

# Week 1

---
## What to expect

- Familiarizing with the tools
- Learning the Unity interface
- C# basics
- Unity basics (in 3d)
- VS code basics
- Only a bit scripting
- Week project: Catlike Coding's clock exercise
---
# Day 1: Introduction
---
## About me
- developer & instructor at Buutti
- indie game developer
- participated in >20 game jams
- worked on 36 small games
- releasing first commercial game EMUUROM this year
---
## About this course

- We will make multiple video games with Unity
- Course is separated into three stages
- [Stages](stages.md)
- [Stage 1](stage1.md)
    - Learn the basics of Unity & game programming
    - With the acquired skills, make tiny games on your own
- Stage 2
	- Dive deeper in Unity
	- Learn about game design & game industry
	- Create a bit larger (yet still tiny) games in teams
- Stage 3
    - Create a single game project in the span of four weeks
---
## About YOU

- Your name
- Your gamedev/programming/art/music background
- Which video game you like pops to your mind first?
- What kind of a video game would you like to work on?
- What was your first video game experience?
- What is the last video game you played?
- Most disappointing game
- The worst game you've played
---
## Pienryhmiin jako
---
## Unity

[1. What is Unity](unity-basics/1-what-is-unity.md)
---
## Installing the tools

- Download [Unity Hub](https://unity3d.com/get-unity/download)
- Install latest Unity LTS (long term support) version 2020.3.27f1
- Install [Visual Studio Code](https://code.visualstudio.com/), aka VS code
  - during install: add to context menu
- Install [Discord](https://discord.com/)
  - (live streams don't work well with the browser version!)
- Personal accounts you'll need to create if you don't already have
	- Discord (for communication)
	- Unity
	- Google (for collaborating with Google Drive & Docs)
	- later: Github (for version control)
	- even later: Itch.io (for publishing your games)
---
## Exercise 1.

- Install and setup all the tools needed and create your first 3D project for the course with the name `Week1Clock`.
- This project will be worked on step by step in the coming exercises.
---
## Unity Documentation

- [Docs: Front page](https://docs.unity.com)
- if you don't know how something works, this should be the first place to learn from
- Docs will be heavily featured during the course!
---
## The Unity Interface

[2. The Unity Interface](unity-basics/2-the-unity-interface.md)

---
## Exercise 2.

Create a 3D model of a clock from Unity's primitives with three hands and 12 hour indicators.

Unlike in the picture below, set all the indicators to 12. They will be later rotated to correct positions with C# scripting.

![3d clock](imgs/week1-catlikeclock.png)
---
# Day 2: Assets

[3. Assets](unity-basics/3-assets.md)
---
## Console

- Error messages
- Debug messages
---
## Exercise 3.

Duplicate your clock.

---
# Day 3: Git

See: [Git basics](git.md)

---
## Exercise x.

Create a Github account.
Create a new repository with the Unity .gitignore template.
Initialize Git in your Week project folder, and push the project files to Github.

---
# Day 4
---
## Scripting basics

- adding functionality with C# script components
- [C# basics 1/2](#c-basics)
	- [Variables and conditionals](#variables-and-conditionals)
	- [Conventions](#conventions)
	- [Arrays and Loops](#arrays-and-loops)
---


## Unity and VS Code

### Basics

- Set VS Code as your default editor
  - Edit > Preferences > External Tools > External Script Editor
  - Install the prerequisities for code completion & other niceness
    - https://code.visualstudio.com/docs/other/unity

### Debugging, Warnings

### Using VS Code effectively

- [CTRL+SHIFT+UP/DOWN] move code line
- [CTRL+SHIFT+D] duplicate line
- [F2]: Rename variable and update references
- [CTRL+TAB] / [CTRL+SHIFT+TAB] View: Open Next Editor / View: Open Previous Editor
  - You need to change this manually
- [CTRL+.] for auto-"using" / auto-creating missing functions
- [CTRL+Ö] for showing/hiding terminal


## Exercise 4.

Make the clock hands move when time goes on.

---
# Day 5
---
## Working on week project

- one-on-one meetings
  - useana päivänä, ei riitä perjantai
  - ehkä vain eka viikolla kaikille???
---
## Week project presentations

- playtesting
- iteration based on feedback
- nopat, pelinappulat, kynäpaperit