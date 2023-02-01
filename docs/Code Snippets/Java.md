# Java Code Snippets

## Arrays

### Int Array

```java
int[] marks = { 125, 132, 95, 116, 110 };
```

### Big Integer

```java
Scanner scan = new Scanner(System.in);
String aStr = scan.next(); 
String bStr = scan.next();

BigInteger a = new BigInteger(aStr);
BigInteger b = new BigInteger(bStr);

BigInteger sum = a.add(b);
BigInteger mult = a.multiply(b);

System.out.println(sum);
System.out.println(mult);
```

## Conversions

### String to Int

```java
int num = Integer.parseInt(string_varaible)
```

### Int to String

```java
public class IntToStringExample1{
public static void main(String args[]){
int i=200;
String s=String.valueOf(i);
System.out.println(i+100);//300 because + is binary plus operator
System.out.println(s+100);//200100 because + is string concatenation operator
}}
```

## Datetime

### Print day of week

Print the dates Day in all caps.

```java
public static String findDay(int month, int day, int year) {
    Calendar calendar = Calendar.getInstance();
    calendar.set(year, month-1, day);

    //SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyy");
    SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE");

    return dateFormat.format(calendar.getTime()).toUpperCase();

}
```

## Exceptions

``` java
class MyCalculator {
    /*
    * Create the method long power(int, int) here.
    */
    public static long power(int n, int p) throws Exception
    {
        if (n == 0 && p == 0)
            throw new Exception("n and p should not be zero.");

        if (n < 0 || p < 0)
            throw new Exception("n or p should not be negative.");
        
        return (long)Math.pow(n,p);
    }
}

void main() {
    try {
        System.out.println(my_calculator.power(n, p));
    } catch (Exception e) {
        System.out.println(e);
    }
}
// OUTPUT:
// 16
// java.lang.Exception: n and p should not be zero.
// java.lang.Exception: n or p should not be negative.
```

## Input Scanner

```java
Scanner scan = new Scanner(System.in);
int i = scan.nextInt();
double d = scan.nextDouble();
String s = scan.nextLine();
s = scan.nextLine();
// Write your code here.

System.out.println("String: " + s);
System.out.println("Double: " + d);
System.out.println("Int: " + i);

scan.close();
```

## Loops

### Foreach

```java
for (var num : numbers)
{
  // do something with num.
}
```

## Out

### Println

Print to console.

```java
System.out.println("Hello, world");
```

```java
long x=sc.nextLong();
System.out.println(x+" can be fitted in:");
if(x>=-128 && x<=127)System.out.println("* byte");
if(x>=-32768 && x<=32767)System.out.println("* short");
if(x>=-Math.pow(2,31) && x<=Math.pow(2,31)-1)System.out.println("* int");
if(x>=-Math.pow(2,63) && x<=Math.pow(2,63)-1)System.out.println("* long");
```

### Println with padding

```java
Scanner sc=new Scanner(System.in);
System.out.println("================================");
for(int i=0;i<3;i++){
    String s1=sc.next();
    int x=sc.nextInt();
    //Complete this line
    System.out.printf("%-15s%03d%n",s1,x);
}
System.out.println("================================");

sc.close();
```

- `%-15s` - The `-` sign tells the printf method to left-align the string within a field of `15 characters`.
  - If the string is shorter than 15 characters, it will be padded with spaces on the right to fill the field.
- `%03d` - Format specifier for the integer argument.
  - The `0` tells the printf method to pad the number with `leading zeros` if the number of digits is `less than 3`. The `3 sets` the `width` of the field to 3.

## Power

```java
Math.pow(2, 10) // 2^10.
```

## Prime Numbers

```java
String n = bufferedReader.readLine();

BigInteger bg = new BigInteger(n);
int cetaintity = 100;
if (bg.isProbablePrime(cetaintity))
{
    System.out.println("prime");
}
else
{
    System.out.println("not prime");
}
```

## Scanner

```java
import java.util.Scanner;  // Import the Scanner class

class Main {
  public static void main(String[] args) {
    Scanner myObj = new Scanner(System.in);  // Create a Scanner object
    System.out.println("Enter username");

    String userName = myObj.nextLine();  // Read user input
    System.out.println("Username is: " + userName);  // Output user input
  }
}
```

```java
Scanner scanner = new Scanner(System.in);

int count = 1;
while (scanner.hasNextLine())
{
    String line = scanner.nextLine();
    System.out.printf("%d %s\n", count, line);
    count++;
}
scanner.close();
```

## Static

### Static Initialization Blocks

```java
class Whatever {
    public static varType myVar = initializeClassVariable();

    private static varType initializeClassVariable() {

        // initialization code goes here
    }
}
```
