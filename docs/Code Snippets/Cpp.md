# C++ Code Snippets

**References:** <https://en.cppreference.com/w/cpp/algorithm/lower_bound>

## Collections

```cpp
std::vector<int> lifo_list_1;
std::stack<int> lifo_list_2;
std::queue<int> fifo_list_1;
```

## Cout

### Print hex

```cpp
cout << left << showbase << nouppercase << hex << (long long)A << endl;
```

The `left`, `showbase`, `nouppercase`, and `hex` manipulators are being used to modify the behavior of the cout function.

- `left` : it will align the output to the left.
- `showbase` : it will cause the output to include a prefix indicating the base of the number being printed.
- `nouppercase` : it will cause the output to be in lowercase letters.
- `hex` : it will cause the output to be in hexadecimal format.

The `endl` is a manipulator which causes a newline character to be output and the buffer to be flushed.

The `(long long)` cast is used to ensure that the value of A is treated as a long long integer.

It will output the value of `A` in `left-aligned` `hexadecimal format`, including a `prefix` `indicating` that the `base` is `hexadecimal` and `using lowercase letters` for the digits.

### Print padded fixed-width output with sign

```cpp
cout << setprecision(2) << setw(15) << right << showpos << fixed << setfill('_') << B << endl;
```

The `setprecision(2)`, `setw(15)`, `right`, `showpos`, `fixed`, `setfill('_')` manipulators are being used to modify the behavior of the cout function.

- `setprecision(2)`: it will set the precision of the output to 2 decimal places.
- `setw(15)`: it will set the width of the output field to be 15 characters.
- `right`: it will align the output to the right.
- `showpos`: it will cause the output to include a sign (+ or -) for positive numbers.
- `fixed`: it will cause the output to be in fixed-point notation.
- `setfill('_')`: it will set the fill character for the output field to be '\_'.
- The `endl` is a manipulator which causes a newline character to be output and the buffer to be flushed.

It will output the value of `B` with `2 decimal places`, `right-aligned`, with a `field width` of `15 characters` and `filled with '_'`, a `sign prefix` for positive numbers, in `fixed point notation`.

### Print scientific notation

```cpp
cout << setprecision(9) << noshowpos << uppercase << scientific << C << endl;
```

The `setprecision(9)`, `noshowpos`, `uppercase`, `scientific` manipulators are being used to modify the behavior of the `cout` function.

- `setprecision(9)`: it will set the precision of the output to 9 decimal places.
- `noshowpos`: it will cause the output not to include a sign (+ or -) for positive numbers.
- `uppercase`: it will cause the output to be in uppercase letters.
- `scientific`: it will cause the output to be in scientific notation.
- The `endl` is a manipulator which causes a newline character to be output and the buffer to be flushed.

It will output the value of `C` with `9 decimal places`, `not show positive sign`, in `uppercase` letters and using `scientific notation`.

## Exceptions

### Exception Handling

```cpp
try {
    cout << Server::compute(A, B) << endl;
}
catch (std::bad_alloc& ba)
{
    cout << "Not enough memory" << endl;
}
catch (std::exception &e) {
    cout << "Exception: " << e.what() << endl;
}
catch (...)
{
    cout << "Other Exception" << endl;
}
```

### Custom Exception

```cpp
/* Define the exception here */
class BadLengthException : public std::exception {
    private:

    std::string what_message;

    public:
    BadLengthException(int length){
        what_message = std::to_string(length);
    }

    const char * what () {
        return what_message.c_str();
    }
};
```

## Long Long

```cpp
int _length;
int _breadth;
int _height;

long long CalculateVolume()
{
    // We can't do the following because of int overflow:
    // return _length * _breadth * _height;

    long long result = _length; // Need to cast to long long first before doing the multiplication.
    result = result * _breadth;
    result = result * _height;
    return result;
}
```

## Lower bound

```cpp
#include <algorithm>
#include <iostream>
#include <vector>

int main()
{
    const std::vector<int> data = {1, 2, 4, 5, 5, 6};

    for (int i = 0; i < 8; ++i)
    {
        // Search for first element x such that i ≤ x
        auto lower = std::lower_bound(data.begin(), data.end(), i);

        std::cout << i << " ≤ ";
        lower != data.end()
            ? std::cout << *lower << " at index " << std::distance(data.begin(), lower)
            : std::cout << "not found";
        std::cout << '\n';
    }
}

```

## Maps

```cpp
std::map <key_type, data_type>

//Creates a map m where key_type is of type string and data_type is of type int.
map<string,int> m;

int length = m.size(); //Gives the size of the map.

m.insert(make_pair("hello",9)); //Here the pair is inserted into the map where the key is "hello" and the value associated with it is 9.

m.erase(val); //Erases the pair from the map where the key_type is val.
map<string,int>::iterator itr=m.find(val); //Gives the iterator to the element val if it is found otherwise returns m.end() .

map<string,int>::iterator itr=m.find("Maps"); //If Maps is not present as the key value then itr==m.end().

// To get the value stored of the key "MAPS" we can do m["MAPS"] or we can get the iterator using the find function and then by itr->second we can access the value.
var mapsVal = m["MAPS"];
```

```cpp
#include <iostream>
#include <map>
using namespace std;
int main(void) {
   map<char, int> m = {
        {'a', 100},
        {'b', 200},
        {'c', 300},
        {'d', 400},
        {'e', 500},
    };

   auto it = m.find('c');

   cout << "Iterator points to " << it->first <<
      " = " << it->second << endl;

   return 0;
}
```

## Outputstream

```cpp
// ostream constructor
#include <iostream>     // std::cout, std::ostream, std::ios
#include <fstream>      // std::filebuf

int main () {
  std::filebuf fb;
  fb.open ("test.txt",std::ios::out);
  std::ostream os(&fb);
  os << "Test sentence\n";
  fb.close();
  return 0;
}
```

```cpp title="Overload <<"
ostream& operator<<(ostream& os, const Date& dt)
{
    os << dt.mo << '/' << dt.da << '/' << dt.yr;
    return os;
}
```

## Overloading

```cpp
#include <iostream>

using namespace std;

class Person {
public:
    Person(const string& first_name, const string& last_name) : first_name_(first_name), last_name_(last_name) {}
    const string& get_first_name() const {
      return first_name_;
    }
    const string& get_last_name() const {
      return last_name_;
    }
private:
    string first_name_;
    string last_name_;
};
// Enter your code here.

ostream& operator <<(ostream& out, const Person &p)
{
   out << "first_name=" << p.get_first_name() << ",last_name=" << p.get_last_name();
   return out;
}


int main() {
    string first_name, last_name, event;
    cin >> first_name >> last_name >> event;
    auto p = Person(first_name, last_name);
    cout << p << " " << event << endl;
    return 0;
}
```

Source: <https://www.hackerrank.com/challenges/overloading-ostream-operator/problem?isFullScreen=true>

## Print to console

```cpp
std::cout << "This string will be printed";
```

```cpp
printf("This string will be printed");
```

```cpp
int number = 1;
printf("This string will be printed %d.", number);
```

## Read line

```cpp
std::string input;
std::cin >> input;
```

```cpp
std::string input;
int num = 0;
std::cin >> input >> num;
```

```cpp
int i;
long l;
char c;
float f;
double d;

printf("Enter an integer value: ");
scanf_s("%d", &i);
printf("Enter a long value: ");
scanf_s("%ld", &l);
printf("Enter a character: ");
scanf_s(" %c", &c); //Note the space before %c to consume any leading whitespace
printf("Enter a float value: ");
scanf_s("%f", &f);
printf("Enter a double value: ");
scanf_s("%lf", &d);

printf("You entered: %d, %ld, %c, %f, %lf\n", i, l, c, f, d);
```

## Sets

- Ordered list.
  - Default: asc
- Insertion, lookup and deletion take at most `O(log n)` time

```cpp
set<int>s;              //Creates a set of integers.
int length=s.size();    //Gives the size of the set.
s.insert(x);            //Inserts an integer x into the set s.
s.erase(val);           //Erases an integer val from the set s.

set<int>::iterator itr=s.find(val); //Gives the iterator to the element val if it is found otherwise returns s.end() .
set<int>::iterator itr=s.find(100); //If 100 is not present then it==s.end().
```

### Set - ordering

```cpp
#include <iostream>
#include <vector>
#include <map>
#include <set>

using namespace std;

int main()
{
    std::set<int> input;

    input.insert(3);
    input.insert(2);
    input.insert(4);
    input.insert(1);
    input.insert(5);

    for (int n : input)
    {
        cout << n << endl;
    }
    return 0;
}

// OUTPUT:
// 1
// 2
// 3
// 4
// 5
```

```cpp Set order by desc.
//By default, std::set uses std::less. To cause it to sort in reverse order, use std::greater. E.g.
std::set<int, std::greater> s;
```

## Split String

```cpp
// for string delimiter
vector<string> split(string s, string delimiter) {
    size_t pos_start = 0, pos_end, delim_len = delimiter.length();
    string token;
    vector<string> res;

    while ((pos_end = s.find(delimiter, pos_start)) != string::npos) {
        token = s.substr(pos_start, pos_end - pos_start);
        pos_start = pos_end + delim_len;
        res.push_back(token);
    }

    res.push_back(s.substr(pos_start));
    return res;
}
```

## String

### std::string

```cpp
#include <string>

std::string myString("initialValue");
```

### Narrow String Literal

```cpp
char* pszStr = "Hello, world!";
```

- A `narrow string literal` is a string literal in `C++` that is `not prefixed` with `L`, such as "hello".
- A narrow string literal represents a string of narrow characters, which are typically a single byte each and are used to represent characters in the default character set of the system.
- On systems using the ASCII character set, the narrow characters have the same values as the corresponding ASCII characters, but on systems using other character sets, the values of the characters can be different.
- Narrow string literals are typically used to represent strings of text in the default character set of the system.
- In this example
  - `"Hello, world!"` is a `narrow string literal` and `pszStr` is a pointer to a `narrow character string` that points to the beginning of the string literal.
  - The `string literal` is `stored` in a `read-only section of memory`, and the `pointer pszStr` can be used to access the characters in the string.
  - Note that the `string literal is null-terminated`, meaning that the end of the string is marked by a `null character` with a `value` of `0`.

### Wide String Literal

```cpp
WCHAR* pwszConnStr = NULL;
pwszConnStr[0] = L'\0';
```

- The `L` before the string literal in L'\0' indicates that it's a wide string literal, rather than a narrow string literal.
- In `C++`, `wide string literals` are `prefixed` with `L`.
- The wide string literal `L'\0'` represents a `single-character wide string` containing the `null terminator`, which is equivalent to L"\0" in this context. This is used to initialize an empty wide string.

## Stringstream

```cpp
#include <sstream>

std::string str("This string will be processed.");
std::stringstream ss(str);
char delimiter = ' ';
std::string sub_string;
while (std::getstring(ss, sub_string, delimiter))
{
    printf(sub_string);
}
```

## Struct

```cpp

```

## Sub string

```cpp
// s.substr(start_position, length);
std:: substring = s.substr(pos_start, pos_end - pos_start);
```

## Switch

```cpp
switch(expression) {
  case x:
    // code block
    break;
  case y:
    // code block
    break;
  default:
    // code block
}
```

```cpp
const std::string getString(int n)
{
    switch (n) {
        case 1: return "one";
        case 2: return "two";
        case 3: return "three";
        case 4: return "four";
        case 5: return "five";
        case 6: return "six";
        case 7: return "seven";
        case 8: return "eight";
        case 9: return "nine";
        default: return "";
    }
}
```

## Template

### Template Function

```cpp
// function template
#include <iostream>
using namespace std;

template <class T>
T GetMax (T a, T b) {
    T result;
    result = (a>b)? a : b;
    return (result);
}

int main () {
    int i=5, j=6, k;
    long l=10, m=5, n;
    k=GetMax<int>(i,j);
    n=GetMax<long>(l,m);
    cout << k << endl;
    cout << n << endl;
    return 0;
}
```

### Template Class

```cpp
#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
#include <cassert>
using namespace std;

/*Write the class AddElements here*/
template <class T>
class AddElements {
    T element;
public:
    AddElements(T arg) { element = arg; }
    T add(T x) { return x + element; }
};
template <>
class AddElements <string> {
    string element;
public:
    AddElements(string arg) { element = arg; }
    string concatenate(string arg)
    {
        string s = element + arg;
        return s;
    }
};

int main() {
    int n, i;
    cin >> n;
    for (i = 0; i < n; i++) {
        string type;
        cin >> type;
        if (type == "float") {
            double element1, element2;
            cin >> element1 >> element2;
            AddElements<double> myfloat(element1);
            cout << myfloat.add(element2) << endl;
        }
        else if (type == "int") {
            int element1, element2;
            cin >> element1 >> element2;
            AddElements<int> myint(element1);
            cout << myint.add(element2) << endl;
        }
        else if (type == "string") {
            string element1, element2;
            cin >> element1 >> element2;
            AddElements<string> mystring(element1);
            cout << mystring.concatenate(element2) << endl;
        }
    }
    return 0;
}
```

### Template Specialization

```cpp
#include <iostream>
using namespace std;
enum class Fruit { apple, orange, pear };
enum class Color { red, green, orange };

template <typename T> struct Traits;

// Define specializations for the Traits class template here.
template <>
struct Traits<Fruit>{
    static string name(int index){
        switch(index){
                case 0:return "apple";
                case 1: return "orange" ;
                case 2: return "pear";
        }
        return "unknown";
    }
};

template <>
struct Traits<Color>{
    static string name(int index){
        switch(index){
                case 0:return "red";
                case 1: return "green" ;
                case 2: return "orange";
        }
        return "unknown";
    }
};


int main()
{
    int t = 0; std::cin >> t;

    for (int i=0; i!=t; ++i) {
        int index1; std::cin >> index1;
        int index2; std::cin >> index2;
        cout << Traits<Color>::name(index1) << " ";
        cout << Traits<Fruit>::name(index2) << "\n";
    }
}
```

Source: <https://www.hackerrank.com/challenges/cpp-class-template-specialization/problem?isFullScreen=true>

## Try catch

```cpp
try
{
    throw std::exception();
}
catch (std::exception ex)
{
    printf(ex.what());
}
```

## Tokenize string

```cpp
#include <iostream>
#include <vector>
#include <sstream>

int main() {
    std::string line;
    std::getline(std::cin, line);

    std::stringstream ss(line);
    std::vector<int> numbers;
    std::string token;
    char delimiter = ',';
    while (std::getline(ss, token, delimiter)) {
        numbers.push_back(std::stoi(token));
    }
    return 0;
}
```

## Vectors

```cpp
#include <vector>
std::vector<int> v;
```

### Using custom class in vector

> The Class needs to overload the `<` operator so it can be iterated over.

```cpp hl_lines="15-18"

class Message {
protected:
    int id;
    std::string txt;
public:
    Message(){
        id = numMessages++;
    }
    void setText(std::string m) { txt = m; }
    const string& get_text() {
        return txt;
    }

    bool operator<(const Message& m2)
    {
        return id < m2.id;
    }
};

```

## Virtual functions

```cpp
class Person {
protected:
    std::string name;
    int age;
public:
    virtual void getdata() {}
    virtual void putdata() {}
};

class Professor : public Person {
protected:
    int publications;
    int cur_id;
public:
    Professor()
    {
        cur_id = professorCount;
        professorCount++;
    }

    void getdata() {
        std::cin >> name >> age >> publications;
    }

    void putdata()
    {
        cout << name << " " << age << " " << publications << " " << cur_id << endl;
    }

};

int main ()
{
    Person* per = new Professor;
    per->getdata();
    per->pushdata();
}
```
