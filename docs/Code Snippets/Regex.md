# Regex

## Sample 1

Requirements:

1. Consists of `8` to `30` characters inclusive.
2. Only contain `alphanumeric` `characters` and `underscors(_)`.
   1. Alphanumeric describes the character set consisting of lower case characters `[a-z]`, upper cases characters `[A-Z]`, and digits `[0-9]`.
3. First character of the username must be an alphabetic character.

```java
    public static final String regularExpression = "^[A-Za-z]\\w{7,29}$";
```

Breakdown:

- `^[A-Za-z]` = starts with any letter.
- `\\w{7,29}` = a "word character" that is a `minimum` of `7` in `length`, and `max` of `29`.
  - Worder character is a letter, number or underscore.

## Resources

- <https://www.computerhope.com/unix/regex-quickref.htm>