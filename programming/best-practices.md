---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Best practices for programming

## Good programming

* You don't want to just learn programming
* You want to learn how to program ***well***
* What is good code, then?
  * We'll find out during these slides
* Let's go through some alarming examples and learn some best practices based on those

## Why make good code?

* "I just hack this quickly and move on"
  * A dangerous sentiment that ***will*** cost sweat, tears and person-hours
  * Every time I've thought this, I've either
    * a) had to eventually code it better
    * b) lost significant amount of time for deciphering what I've coded
* *You always code for someone else*
  * 1 - The compiler
  * 2 - Your teammates
  * 3 - ***You in the future***
    * I can't stress this enough:
    * *You in the future is a different person that you in the now.*

# Best practices


## The importance of whitespace

* The ***empty space*** & ***linebreaks*** have a huge impact on code readability
* Alarming example:
```c#
        if (controller.MoveDirection != Vector3.zero)
        {
            controller.Move(controller.targetDirection, speed);
                transform.rotation = Quaternion.LookRotation(controller.targetDirection);
        }

        if (!controller.isGrounded()) {
                state=State.InAir;
            }




    if (jumpBuffer > 0)
    {Jump();}
```
---
* Functionally, this is the same code, but ***much*** easier to read:

```c#
    if (controller.MoveDirection != Vector3.zero)
    {
        controller.Move(controller.targetDirection, KoiranNopeus);
        transform.rotation = Quaternion.LookRotation(controller.targetDirection);
    }

    if (!controller.isGrounded())
    {
        state = State.InAir;
    }

    if (jumpBuffer > 0)
    {
        Jump();
    }
```
### In a nutshell...

* Indent only when introducing a new logical block (if, for loop...)
* Choose which style you use (spacebar / tab, how many spaces wide...)
  * ...and ***stick to it***
* Separate 
* Use ***one*** empty line if you need to separate two concepts, no more!
* Use spacebar
* Choose how you like to line `{` braces:
  * On the same line as the `if`, or on the next one 

## Naming variables

* [Wikipedia: Naming convention](https://en.wikipedia.org/wiki/Naming_convention_(programming))
* One of the hardest things in programming
* Explain what the thing is!
  * a) `a = b * c;`
    * I have no idea what this line is really doing
  * b) `weeklyPay = hoursWorked * hourlyPayRate;`
    * That's more like it!


---
* How would you name a variable that stores what is the probability for player's attack to land?
  * `pAttack`, `attackLandProbability`, `player1HitPercentage`...
    * None of these are exceptionally good
  * Good variable names are always case-specific:
    * Sometimes you can go too descriptive...
      * `playerAttackToLandProbabilityAsPercentage`
    * but it's much more usual to go ***not descriptive enough***
      * `pAtk`
    * The golden route is somewhere in the middle!

## Write what you mean

* This concerns not only variable naming, but also how to generally use statements
* Do not leave anything implied - write what you mean ***explicitly***
* Let's have an innocious yet dangerous example:
  * Consider a player character that has two states, `Jump` and `Idle`.
  * We could play the animations as thus:
    ```c#
    if (state == PlayerState.Jump)
    {
      JumpAnimation.Play();
    } else {
      IdleAnimation.Play();
    }
    ```
  * However! What if the player gets a `Swim` state in the future?
  * Now the `else` block has to be refactored!
  * What if this implicit idea "else means idle" is present in multiple places?

---

* State your intent ***explicitly***!
    ```c#
    if (state == PlayerState.Jump)
    {
      JumpAnimation.Play();
    }
    else if (state == PlayerState.Idle)
    {
      IdleAnimation.Play();
    }
    ```

## Be cohesive!

* If you write one variable in a certain way, be sure to use that style for other variables as well
* Alarming example:
    ```c#
    int spr_smallhop = 993,
    bool drwOnAbove = true;
    int[] shinypals = [ 1, 4, 2 ];
    ```
  * three different variables, three different casings
    * `snake_case`
    * `camelCase`
    * `flatcase`

## Bad structure

* When do you have bad *structure* in your code?
* Cases of *code smell*: 
  * When changing one thing, you need to change something completely unrelated 
  * Having to jump between code files constantly when writing/reading code

## Principles for better structure

* [Separation of concerns](https://en.wikipedia.org/wiki/Separation_of_concerns):
  * One part of code (function, class...) handles only one thing
* [Locality of behaviour](https://htmx.org/essays/locality-of-behaviour/)
  * You can understand a concept by looking at a small portion of source code
* [DRY: Don't repeat yourself](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)
  * If you write a duplicate of old, ten lines of code with minimal changes, you might have a problem
  * Better idea to wrap it into a function (maybe)
* [KISS: Keep it simple, stupid](https://en.wikipedia.org/wiki/KISS_principle)
  * Complexity bad
* Remember, however: If abused, all of above can lead to bad code as well!
  * Unless maybe KISS. KISS is always good

# Conclusions

## What makes code *bad*?

* [Wikipedia: Anti-pattern](https://en.wikipedia.org/wiki/Anti-pattern)
* [Wikipedia: Code smell](https://en.wikipedia.org/wiki/Code_smell)

## What makes code good?

* Good code is...
  * cohesive
  * easy to read
  * self-explanatory
  * well-contained

## Reading

* [The Grug Brained Developer: A layman's guide to thinking like the self-aware smol brained](https://grugbrain.dev/)