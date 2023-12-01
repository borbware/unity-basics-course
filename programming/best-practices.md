---
marp: true
paginate: true
title: Best practices for programming
math: mathjax
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Best practices for programming

## Good programming

* You don't want to just learn programming
* You want to learn how to program ***well***
* What is good code, then?
  * Let's go through some alarming examples
  *  $\Rightarrow$ learn what ISN'T good code

## why make code good when bad code do job

* "I'll just hack this together quickly and move on"
  * A dangerous sentiment that ***will*** cost sweat, tears and person-hours
  * Every time I've thought this, I've either
    * a) had to eventually code it better
    * b) lost significant amount of time for deciphering later what the hell have I written
* *You always code for someone else*
  * 1 - The compiler
  * 2 - Your teammates
  * 3 - You in the future
    * I can't stress this enough:
    * *You in the future is a different person that you in the now.*

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

* Indent only when introducing a new logical block (if, for loop, etc...)
* Choose which style you use (spacebar / tab, how many spaces wide...)
  * ...and ***stick to it***
* Use ***one*** empty line if you need to separate two blocks of code if needed
* Make lines breathe: `a = b + c;`, not `a=b+c;`
* Choose how you like to line `{` braces:
  ```c#
  if (true) {
    ...
  }
  ```
  or
  ```c#
  if (true)
  {
    ...
  }
  ```

### Line width

* If your lines are getting too wide (over ~120 characters), split the code to multiple lines
* As the lines get shorter, the code gets more readable
* If you just do one thing per line, it's much easier to follow along
* Example: refactor
  ```c#
  if (controller.MoveDirection != Vector3.zero && !controller.isGrounded() && jumpBuffer > 0)
  ```
  to
  ```c#
  if (controller.MoveDirection != Vector3.zero
    && !controller.isGrounded()
    && jumpBuffer > 0)
  ```
<!-- _footer: "Some programmers prefer line widths of 100 or even 80 characters." -->

### But we can go further

* Do not try to minimize code size
* Rather try to maximize *debuggability*
* This can usually happen by introducing "redundant" variables. Consider
  ```c#
  if (controller.MoveDirection != Vector3.zero
    && !controller.isGrounded()
    && jumpBuffer > 0)
  ```
* vs.
  ```c#
  const bool notMoving = controller.MoveDirection != Vector3.zero;
  const bool onAir = !controller.isGrounded();
  const bool canJump = jumpBuffer > 0;

  if (notMoving && onAir && canJump)
  ```

## Naming variables

* [Wikipedia: Naming convention](https://en.wikipedia.org/wiki/Naming_convention_(programming))
* *"There are two hard things in computer science: cache invalidation, naming things, and off-by-one errors."*
* For real, naming is one of the hardest tasks in programming.
* It's all about communicating enough, but not too much
* First rule: Explain what the variable stores!
  * a) `a = b * c;`
    * I have no idea what this line is *really* doing
  * b) `weeklyPay = hoursWorked * hourlyPayRate;`
    * That's more like it!

---

* How would you name a variable that stores what is the probability for player's attack to land?
  * `pAttack`, `attackLandProbability`, `player1HitPercentage`...
    * None of these are exceptionally good
  * Good variable names are always case-specific:
    * Sometimes you can go too descriptive...
      * `playerAttackToLandProbabilityAsPercentage`
    * However! It's much more usual to go ***not descriptive enough***
      * `pAtk`
    * The golden route is somewhere in the middle!


## Get rid of magic numbers!

* Consider this:
  ```c#
  rotationsPerDay = rotationsPerSecond * 60 * 60 * 24;
  ```
* Vs. this:
  ```c#
  secondsPerDay = 60 * 60 * 24;
  rotationsPerDay = rotationsPerSecond * secondsPerDay;
  ```
* This might seem like stating the obvious, but we usually want to do this!
  * What may seem obvious to you, might not be to the reader of the code
  * ...which will be you one day

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
  * What if this implicit idea of "else equals idle" is present in multiple places?

---

* State your intent!
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

## Dangers of overgeneralization

* Sometimes you might think it's smart to account for possible future use cases
* This leads to unnecessary complexity: you have code that is there just IN CASE
* The problem is, you usually can't know beforehand what use cases are actually needed
  * Actually, it's downright impossible to predict what structure is optimal for your use case
  * After you have created the structure, you know what kind of structure you should have written
* Write code that solves the problem you have, not some problem you might possibly have in the future!

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
  * When changing one thing in code, you have to change something completely unrelated to make it work.
  * When writing/reading code, you have to jump between code files constantly.
  * You need to reread lines of code again and again to understand what's going on
  * Everything breaks if the code isn't used in a very specific manner
* [Wikipedia: Anti-pattern](https://en.wikipedia.org/wiki/Anti-pattern)
* [Wikipedia: Code smell](https://en.wikipedia.org/wiki/Code_smell)

## Some principles for better structure

* [Separation of concerns](https://en.wikipedia.org/wiki/Separation_of_concerns):
  * One part of code (function, class...) handles only one thing
* [Locality of behaviour](https://htmx.org/essays/locality-of-behaviour/)
  * You can understand a concept by looking at a small portion of source code
* [DRY: Don't repeat yourself](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)
  * If you write a duplicate of old, ten lines of code with minimal changes, you might have a problem
  * Better idea to wrap it into a function (maybe)
* [KISS: Keep it simple, stupid](https://en.wikipedia.org/wiki/KISS_principle)
  * Complexity bad

### But beware!

* Even following the principles shown can lead to bad code
* An experienced programmer can decide for themselves, when they should use them
* For example, creating two almost identical functions than creating a single function that covers two almost identical cases might sometimes result in much easier-to-read code
  * It's yours to decide when that "sometimes" holds true 

# Conclusions

## What makes code good?

* Good code is...
  * readable
  * pretty
  * self-consistent
  * self-explanatory
  * well-contained
  * reusable (to some extent)

### Extra: Linters
<!-- _backgroundColor: #5d275d -->

* "You can use [linters](https://en.wikipedia.org/wiki/Lint_(software)) to format code automatically
* [Here's](https://johnnyreilly.com/eslint-your-csharp-in-vs-code-with-roslyn-analyzers) a guide to C# formatting with ESLint, a popular linter

## Reading

* [The Grug Brained Developer: A layman's guide to thinking like the self-aware smol brained](https://grugbrain.dev/)