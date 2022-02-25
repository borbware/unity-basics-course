---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->
# Lists and Loops
## Loops
* used for
  * repeating blocks of code 
  * looping through collections of data (more later...)
* While
* Do While
* For
* Foreach


## While loop
* while loop keeps executing its code block as long as the condition in its statement is true:
```c#
int count = 0;
while(count < 4)
{
    Debug.Log(count);
    count++;
}

// Outputs '0', '1', '2' and '3'
```
## Do while loop

* similar to while loop, but it executes the code block once **even if the statement isn't true**
* try the following code: what happens if you change the initial value of `count` to 5?

```c#
int count = 0;
do
{
    Debug.Log(count);
    count++;
} while (count < 4);

// Outputs '0', '1', '2' and '3'
```
## For loop
* for loops are used when the number of iterations is **predefined**
* for loop is initialized in three steps:
```c#
for (initialvalue;condition;increment)
{
    doStuff();
}
```
* **The initial value** is set *before the first* iteration
* **The condition** is checked *before each* iteration
* **The increment** is executed *after each* iteration

### For loop example



## Breaking out of loops
## Nested loops
## While vs. for: when to use?

* for loops when the number of iterations is **predefined**
  * when going through a list, for example.
* while loops when we want to do something many times, but don't know when to stop



## Arrays and lists
* Collections of data
  * `[2, 14, 2, 123, 5]`
* Use Lists if you are changing the size of the array
* If there are a fixed number of elements, use arrays
* Creating and accessing an array
```c#
public GameObject[] players;

void Start ()
{
	players = GameObject.FindGameObjectsWithTag("Player");
	
	for(int i = 0; i < players.Length; i++)
	{
		Debug.Log("Player Number "+i+" is named "+players[i].name);
	}
}
```
## Array methods
  * Find
  * Filter
