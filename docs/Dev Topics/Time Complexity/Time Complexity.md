# Understanding Time Complexity with Simple Examples

Source: [https://www.geeksforgeeks.org/understanding-time-complexity-simple-examples/](https://www.geeksforgeeks.org/understanding-time-complexity-simple-examples/)

A lot of students get confused while understanding the concept of time complexity, but in this article, we will explain it with a very simple example.

Q. Imagine a classroom of 100 students in which you gave your pen to one person. You have to find that pen without knowing to whom you gave it.

Here are some ways to find the pen and what the O order is.

- `O(n2)`: You go and ask the first person in the class if he has the pen. Also, you ask this person about the other 99 people in the classroom if they have that pen and so on,
  This is what we call O(n2).
- `O(n)`: Going and asking each student individually is O(N).
- `O(log n)`: Now I divide the class into two groups, then ask: “Is it on the left side, or the right side of the classroom?” Then I take that group and divide it into two and ask again, and so on. Repeat the process till you are left with one student who has your pen. This is what you mean by O(log n).
  I might need to do:

- The `O(n2)` searches if only one student knows on which student the pen is hidden.
- The `O(n)` if one student had the pen and only they knew it.
- The `O(log n)` search if all the students knew, but would only tell me if I guessed the right side.

## Constant time - O(1)

```cs
using System;

public class GFG{

    static public void Main (){

        // Code
          Console.WriteLine("Hello World");
    }
}
/
```

## Linear time - O(n)

```cs

using System;
public class GFG {

    public static void Main(String[] args)
    {
        int i, n = 8;
        for (i = 1; i <= n; i++) {
            Console.Write("Hello World !!!\n");
        }
    }
}

// This code contributed by Rajput-Ji
```

## Logarithmic time - O(log<sub>2</sub>(n))

```cs hl_lines="9"
using System;

public class GFG{

    static public void Main (){

        // Code
        int i, n = 8;
        for (i = 1; i <= n; i=i*2) {
            Console.Write("Hello World !!!\n");
        }
    }
}
// This code is contributed by lokeshmvs21.
```
