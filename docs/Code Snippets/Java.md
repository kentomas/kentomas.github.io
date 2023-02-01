# Java Code Snippets

## Abstract Class

- Abstract class: is a restricted class that `cannot be used to create objects` (to access it, it must be inherited from another class).
- Abstract method: can only be used in an abstract class, and it does not have a body.

```java
// Abstract class
abstract class Animal {
  // Abstract method (does not have a body)
  public abstract void animalSound();
  // Regular method
  public void sleep() {
    System.out.println("Zzz");
  }
}

// Subclass (inherit from Animal)
class Pig extends Animal {
  public void animalSound() {
    // The body of animalSound() is provided here
    System.out.println("The pig says: wee wee");
  }
}

class Main {
  public static void main(String[] args) {
    Pig myPig = new Pig(); // Create a Pig object
    myPig.animalSound();
    myPig.sleep();
  }
}
```

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

```java
import java.time.LocalDateTime; // Import the LocalDateTime class
import java.time.format.DateTimeFormatter; // Import the DateTimeFormatter class

public class Main {
  public static void main(String[] args) {
    LocalDateTime myDateObj = LocalDateTime.now();
    System.out.println("Before formatting: " + myDateObj);
    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");

    String formattedDate = myDateObj.format(myFormatObj);
    System.out.println("After formatting: " + formattedDate);
  }
}
// OUTPUT:
// Before Formatting: 2023-02-01T21:32:08.627580
// After Formatting: 01-02-2023 21:32:08
```

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

## Enum

```java
public class Main {
  enum Level {
    LOW,
    MEDIUM,
    HIGH
  }

  public static void main(String[] args) {
    Level myVar = Level.MEDIUM; 
    System.out.println(myVar);
  }
}
```

```java title="Loop through enums"
for (Level myVar : Level.values()) {
  System.out.println(myVar);
}

// OUTPUT:
// LOW
// MEDIUM
// HIGH
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

## Extends

```java
class Animal {
  public void animalSound() {
    System.out.println("The animal makes a sound");
  }
}

class Pig extends Animal {
  public void animalSound() {
    System.out.println("The pig says: wee wee");
  }
}

class Dog extends Animal {
  public void animalSound() {
    System.out.println("The dog says: bow wow");
  }
}

class Main {
  public static void main(String[] args) {
    Animal myAnimal = new Animal();  // Create a Animal object
    Animal myPig = new Pig();  // Create a Pig object
    Animal myDog = new Dog();  // Create a Dog object
    myAnimal.animalSound();
    myPig.animalSound();
    myDog.animalSound();
  }
}
```

## Function Parameters

### Varargs

Varargs were introduced in Java 5 and provide a short-hand for methods that support an arbitrary number of parameters of one type.

```java
// BEFORE
public String format() { ... }
public String format(String value) { ... }
public String format(String val1, String val2) { ... }

// AFTER
public String formatWithVarArgs(String... values) {
    // ...
}
```

```java
class Add
{
    public Add()
    {
        
    }
    
   void add(int... n){
        String result= "";
        int sum = 0;
        for(int i = 0; i < n.length; i++) {
            sum += n[i];
            result+=n[i];
            if(i != n.length-1){
                result+="+";
            }
        }
        result += "="+sum;
        System.out.println(result);
    }
};

void main()
{
    Add ob=new Add();
    ob.add(n1,n2);
    ob.add(n1,n2,n3);
    ob.add(n1,n2,n3,n4,n5);	
    ob.add(n1,n2,n3,n4,n5,n6);
}
```

## Hashset

```java
HashSet<String> cars = new HashSet<String>();
cars.add("Volvo");
cars.add("BMW");
cars.add("Ford");
cars.add("BMW");
cars.add("Mazda");
System.out.println(cars);
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

## Interface

```java
// interface
interface Animal {
  public void animalSound(); // interface method (does not have a body)
  public void run(); // interface method (does not have a body)
}
```

## Loops

### Foreach

```java
for (var num : numbers)
{
  // do something with num.
}
```

## Modifiers

```java title="Access Modifiers"
public
private
protected
```

```java title="Non-Access Modifiers"
final           // Attributes and methods cannot be overridden/modified
static          // Attributes and methods belongs to the class, rather than an object
abstract        // Can only be used in an abstract class, and can only be used on methods.
transient       // Attributes and methods are skipped when serializing the object containing them
synchronized    // Methods can only be accessed by one thread at a time
volatile        // The value of an attribute is not cached thread-locally, and is always read from the "main memory"
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

## Sorting

```java
public static List<Integer> missingNumbers(List<Integer> arr, List<Integer> brr) {
// Write your code here
    ArrayList<Integer> missingElements = new ArrayList<>();
    
    for (int i = 0; i < arr.size(); i++)
    {
        brr.remove(arr.get(i));
    }
    
    for (Integer val : brr)
    {
        if (!missingElements.contains(val))
        {
            missingElements.add(val);
        }
    }
    
    Collections.sort(missingElements); // <--- THIS
    
    return missingElements;
}
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

## Tokens

```java
Scanner scan = new Scanner(System.in);
String s = scan.nextLine();
// Write your code here.

StringTokenizer st= new StringTokenizer(s," ,'!@?_@.");
System.out.println(st.countTokens());
while(st.hasMoreTokens())
{
    System.out.println(st.nextToken());
}

scan.close();
```