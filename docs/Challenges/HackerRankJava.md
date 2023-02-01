# Hacker Rank Problems - Java

**Source:** <https://www.hackerrank.com/domains/algorithms>

## Apple and Oranges

```java
void countApplesAndOranges(int s, int t, int a, int b, vector<int> apples, vector<int> oranges) {
    int countApples = 0;
    int countOranges = 0;
    
    for (Integer apple : apples)
    {
        if (apple + a >= s && apple + a <= t) 
        {
            countApples++;
        }   
    }
    
    for (Integer orange : oranges)
    {
        if (b + orange >= s && b + orange <= t) 
        {
            countOranges++;
        }   
    }
    
    System.out.println(countApples);
    System.out.println(countOranges);
}
```

## Number Lines Jumps

```java

```
