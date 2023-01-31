# Time Complexity Practice questions

## Geeks for Geeks

**Source:** <https://www.geeksforgeeks.org/practice-questions-time-complexity-analysis/>

### 1. O(N+M) time, O(1) space

```cpp
int a = 0, b = 0;
for (i = 0; i < N; i++) {
    a = a + rand();
}

for (j = 0; j < M; j++) {
    b = b + rand();
}
```

Options:

1. O(N \* M) time, O(1) space
2. (N + M) time, O(N + M) space
3. O(N + M) time, O(1) space
4. O(N \* M) time, O(N + M) space

Answer: 3. O(N + M) time, O(1) space

**Explanation:** The first loop is `O(N)` and the second loop is `O(M)`. Since N and M are independent variables, so we can’t say which one is the leading term. Therefore Time complexity of the given problem will be `O(N+M)`.

Since `variables` size does not `depend on` the size of the `input`, therefore Space Complexity will be constant or `O(1)`.

### 2. O(N\*N), O(1) Space

```cpp

int a = 0;
for (i = 0; i < N; i++) {
    for (j = N; j > i; j--) {
        a = a + i + j;
    }
}
```

### 3. O(nlogn)

```cpp
int i, j, k = 0;
for (i = n / 2; i <= n; i++) {
    for (j = 2; j <= n; j = j * 2) {
        k = k + n / 2;
    }
}
```

### 4. Asymptotically

What does it mean when we say that an algorithm `X` is `asymptotically` more efficient than `Y`?

```md
1. X will always be a better choice for small inputs
2. X will always be a better choice for large inputs
3. X will always be a better choice for small inputs
4. X will always be a better choice for all inputs
```

Answer: 2. X will always be a better choice for large inputs

**Explanation:** In `asymptotic` analysis, we consider the `growth` of the `algorithm` in terms of `input size`. An algorithm X is said to be asymptotically better than `Y` if `X` takes smaller time than y for all input sizes `n` larger than a value `n0` where `n0 > 0`.

### 5. O(logn)

```cpp
int a = 0, i = N;
while (i > 0) {
    a += i;
    i /= 2;
}
```

### 6. Efficiency of Algorithms

Which of the following best describes the useful criterion for comparing the efficiency of algorithms?

1. Time
2. Memory
3. Both of the above
4. None of the above

**Answer:**
3. Both of the above (Time and Memory).

### 7. Time Complexity Measurement

How is time complexity measured?

1. By counting the number of algorithms in an algorithm.
2. By counting the number of primitive operations performed by the algorithm on a given input size.
3. By counting the size of data input to the algorithm.
4. None of the above

**Answer:**
2. By counting the number of primitive operations performed by the algorithm on a given input size.

### 8. O(log<sub>k</sub>n)

```cpp
for(int i=0;i<n;i++){
  i*=k;
}
```
