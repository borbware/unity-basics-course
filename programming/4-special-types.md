---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->

# Types

## Type system

* [C# Fundamentals: Type system overview](https://docs.microsoft.com/en-us/dotnet/csharp/fundamentals/types/)
* [C# Reference: Type-testing operators and cast expression](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/type-testing-and-cast)


## Typeof

## Type casting


[C# Docs: Casting and type conversions](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/types/casting-and-type-conversions)

## Generics

[C# Fundamentals: Generic classes and methods](https://docs.microsoft.com/en-us/dotnet/csharp/fundamentals/types/generics)

```c#
GetComponent<Rigidbody>();
```

## Special types

## Enums
```c#
public class EnumScript : MonoBehaviour 
{
    enum Direction {North, East, South, West};

    void Start () 
    {
        Direction myDirection;
        myDirection = Direction.North;
    }
    
    Direction ReverseDirection (Direction dir)
    {
        if(dir == Direction.North)
            dir = Direction.South;
        else if(dir == Direction.South)
            dir = Direction.North;
        else if(dir == Direction.East)
            dir = Direction.West;
        else if(dir == Direction.West)
            dir = Direction.East;
        return dir;     
    }
}
```
## Create your own type
## Structs