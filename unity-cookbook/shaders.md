---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Introduction to shaders

## What is a shader?

* [Wikipedia: Shader](https://en.wikipedia.org/wiki/Shader)
* [Manual: Shaders](https://docs.unity3d.com/Manual/Shaders.html)
* Shaders are algorithms that modify the appearance of materials, or the whole screen of a video game
* Unlike the game logic code that runs on CPU, most shader code runs on the GPU
* Uses dedicated programming language like HLSL or GLSL
* In Unity, there are many ways to write shaders
* There's also a node-based approach - no code needed!

## Shader graph

* [Manual: Shader graph](https://docs.unity3d.com/Manual/shader-graph.html)
* [Shader Graph documentation](https://docs.unity3d.com/Packages/com.unity.shadergraph@16.0/manual/index.html)
* A node-based tool for creating shaders
* A package you can install in the package manager
* Previously, only worked with URP & HDRP
* Nowadays also works on the Built-in RP
* [Brackeys video: Basics of shader graph](https://www.youtube.com/watch?v=Ar9eIn4z6XE)