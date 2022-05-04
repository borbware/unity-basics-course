---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->
# Classes and methods

## Classes & objects

* ***Classes*** are blueprints for specific kinds of collections of data & functionality
  * E.g., an Enemy class tells what shared properties do all enemies have
* ***Instance*** of a class is an implementation of that class
  * "This certain enemy right here"
* Classes can be very useful in game development
* C# is an object-oriented language (almost everything is a class)
  * All Unity scripts contain a class by default!
  * Usually, the term ***object*** also refers to an instance of a class

### Unity class example

```c#
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WrapAround : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}

```

## Creating a class from scratch

* This is all you need for creating a class:
    ```c#
    class Enemy
    {

    }
    ```
* The curly braces `{}` define a new scope
  * Everything inside them is inside the class
### Fields

* **Fields** are variables inside the class
    ```c#
    class Enemy
    {
        int HP; // this is a field
        string name = "Sanae"; // this is also a field
    }
    ```
* Fields can have initial values

### Methods

* **Methods** are functions inside the class
    ```c#
    class Enemy
    {
        int HP;
        string name;

        void SetHP() // this is a method
        {
            HP = 4;
        }
    }
    ```
* This function returns nothing, so its type is `void`

### About functionality
* You can declare fields and methods, but cannot have any functionality outside class methods
    ```c#
    class Enemy
    {
        int HP;
        string name = "Sanae"; // this works (initial value)

        name = "Reimu"; // this doesn't work
        HP += 4; // and neither does this. It needs to go inside a method

        void AddHP() 
        {
            HP += 1; // see, like this
        }
    }
    ```
## Instantiating a class
* Instances of a class can be created with the `new` keyword
* Instances have the same fields and methods, but their *values* can be different
    ```c#
    class Enemy
    {
        int HP;
    }

    class Program
    {
        static void CreateThreeEnemies()
        {
            Enemy enemy1 = new Enemy();
            Enemy enemy2 = new Enemy();
            Enemy enemy3 = new Enemy();
        }
    }
    ```
* ***NOTE:*** When creating new GameObjects, use `Instantiate()`
## Object variables
* The variables inside of an object can be accessed with the dot `.` operator
    ```c#
    static void CreateThreeEnemies()
    {
        Enemy enemy1 = new Enemy();
        Enemy enemy2 = new Enemy();
        Enemy enemy3 = new Enemy();
        
        enemy2.HP = 4; // wait, this does not work!?
    }
    ```
### Own variables of the class
* "dot scoping" is not needed when we're *inside* the class
    ```c#
    class Enemy
    {
        int HP;
        void SetHP()
        {
            HP = 4; // this works!
        }
    }
    ```
* We can also use the keyword `this` to refer to the class we're in
  ```c#
  class Enemy
  {
      int HP;
      void SetHP()
      {
          this.HP = 4; // "this" also works! :D
      }
  }
  ```
### Object variables: fix the previous example
* We could not change the Enemy HP from outside the class, because class members are `private` by default
* This can be changed with the `public` access modifier
    ```c#
    class Enemy
    {
        public int HP;
        string name;
    }
    ```

    ```c#
    enemy2.HP = 4;
    ```
## Access modifiers

* [C# Docs: Access modifiers](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/access-modifiers)
* Access modifiers can be used to give additional level of protection inside classes
  * `public`
    * Accessible and editable from anywhere
    * In Unity, public properties are also editable in the Inspector
  * `private`
    * Accessible only from within the class. it's the default, but we can make it more explicit by writing it out
  * `protected`
    * Like `private`, but accessible also by the *inheritors* of the class
  * `virtual`
    * Accessible and *overridable* by inheritors


## Casing conventions

* [C# Docs: Capitalization conventions](https://docs.microsoft.com/en-us/dotnet/standard/design-guidelines/capitalization-conventions)
* [C# Docs: Coding conventions](https://docs.microsoft.com/en-us/dotnet/csharp/fundamentals/coding-style/coding-conventions)
* Conventions are not mandatory, but following these makes for more readable code
  * You can also have your own conventions: it's more important to write consistently than to write in a way Microsoft wants you to
  * Also, in a project of many people, it's better if everyone writes with the same conventions
* My convention:
  * `GameObject gameObject`
  * Types start with uppercase, instances with lowercase!
  * Method names start with uppercase


## Class methods

* As seen in the Unity class example, classes can contain methods
* If the method is public, it can be called from outside of the class
* Here, a public method makes changes to a private property
    ```c#
    class Enemy
    {
        private int HP;
        public int maxHP;
        public void Heal()
        {
            HP = maxHP;
        }
    }
    ```
    ```c#
    Enemy enemy1 = new Enemy();
    enemy.maxHP = 2;
    enemy1.Heal();
    ```
### Static methods

* `static` methods can be called without instantiating the class
  * These methods can't change properties of a specific instance
  * They're especially useful for implementing helper functions 

    ```c#
    class MathFunctions
    {
        public static float VectorLength(Vector3 vector)
        {
            return Mathf.Sqrt(vector.x^2 + vector.y^2 + vector.z^2);
        }
    }
    ```
    ```c#
    Debug.Log(MathFunctions.VectorLength(transform.position));
    ```
* See how we're calling the method by referencing the class itself, never having to use the `new` keyword

### Warning about static variables in Unity

* ***Note:*** Static variables do not reset on `SceneManager.LoadScene("sceneWeAreAlreadyIn");`
    ![](imgs/no-statics.png)

<!-- _footer: "https://forum.unity.com/threads/c-scenemanager-loadscene-does-not-reset-all-variables.405823/" -->

## Static classes

* [C# Docs: Static classes and structs](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/static-classes-and-static-class-members)
* Even whole classes can be static, too
* Then you can call all methods and properties from the class without instantiating it
* Actually, you CAN'T instantiate a static class!

## Exercise 1. Class for helper functions
<!-- _backgroundColor: Khaki -->
<!-- _footer: "[About Inverse Lerp](https://www.gamedev.net/articles/programming/general-and-gameplay-programming/inverse-lerp-a-super-useful-yet-often-overlooked-function-r5230/)" -->
Create a new Script class for math helper functions and properties (do not add it to any GameObject).

Add this `Remap` function there
```c#
Remap(float iMin, float iMax, float oMin, float oMax, float v)
{
    float t = Mathf.InverseLerp(iMin, iMax, v);
    return Mathf.Lerp(oMin, oMax, t);
}
```
Try to call the method from a gameobject!

## Constructors
* Constructor is an optional function that is called when a class is instantiated
* In C#, constructor has the same name as the class itself
    ```c#
    class Enemy
    {
        private int HP;
        public int maxHP;
        public void Enemy()
        {
            maxHP = 4;
            HP = maxHP;
        }
    }
    ```
### Constructors with parameters

* You can pass in parameters to the constructor at initialization

    ```c#
    class Enemy
    {
        private int HP;
        public int maxHP;
        public string name;
        public void Enemy(int enemyMaxHP, string enemyName)
        {
            name = enemyName;
            maxHP = enemyMaxHP;
            HP = maxHP;
        }
    }
    ```
    ```c#
    Enemy grunt1 = new Enemy(4, "Grunt 1");
    Enemy grunt2 = new Enemy(4, "Grunt 2");
    Enemy boss = new Enemy(16, "Big boss");
    ```

## Exercise 2: Hello class
<!-- _backgroundColor: Khaki -->


1. Create a console application with a class Animal, that contains 
   * two strings: name and sound, and
   * a method `Greet()` that prints `[name] says [sound]!`
2. Create a few animals with different names and sounds 
3. Call their greet methods from the main program


## Inheritance
* Classes can be made to inherit functionality of some other class
* If class B inherits class A, all of the class A public functionality is available in class B
* A is called the ***base*** class (or ***parent*** class)
* B is called the ***derived*** class (or ***child*** class)

* Use the `:` symbol to make a class inherit from another
  ```c#
  class Grunt : Enemy
  {
      ...
  }
  ```

## Importing classes

* Classes (or namespaces) from other files can be imported with the `using` keyword
* See example in [Unity class example](#unity-class-example) ([slide 3](#3))!

## Reference type vs value type

  * Value types actually store the value
  * Reference types store *the memory address* to where the value is actually stored
  * Value types
    * [C# Docs: Built-in value types](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/value-types) 
    * `code`, `float`, `double`, `bool`, ...
    * Structs: `Vector3`, `Quaternion`, ...
  * Reference types
    * [C# Docs: Built-in reference types](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/reference-types)
    * Classes: `Transform`, `GameObject`, ...
    * Objects
### Reference vs value example
```c#
//Value type variable
Vector3 pos = transform.position;
pos = new Vector3(0, 2, 0); // TRANSFORM'S POSITION IS UNAFFECTED!!

//Reference type variable
Transform tran = transform;
tran.position = new Vector3(0, 2, 0);
```


## Extra: Properties with getters & setters

<!-- backgroundColor: pink -->
```c#
PlayerClass
{
    private int exp; // private field, not accessible from outside

    public int Experience // public property, accessible from outside
    {
        get
        {
            // do stuff...
            return exp;
        }
        set
        {
            // do stuff...
            exp = value;
        }
    }
}
```

### Properties vs fields

* [C# Docs: Using Properties](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/using-properties)
* Properties are used to expose fields to the outside world
* `get` is called when the property is retrieved somewhere
  * It can execute some code, and then give us some internal data we don't want to directly expose
    ```c#
    Debug.Log(PlayerClass.Experience);
    ```
* `set` is called when a new value is given
    ```c#
    PlayerClass.Experience = 10;
    ```

### Property example
```c#
// Level is a property that converts experience points into the level of a player automatically
public int Level
{
    get
    {
        return experience / 1000;
    }
    set
    {
        experience = value * 1000;
    }
}

public int Health{ get; set;} // This is an example of an auto-implemented property
```