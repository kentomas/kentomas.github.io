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

``` cpp
cout << left << showbase << nouppercase << hex << (long long)A << endl;
```

The `left`, `showbase`, `nouppercase`, and `hex` manipulators are being used to modify the behavior of the cout function.

- `left` : it will align the output to the left.
- `showbase` : it will cause the output to include a prefix indicating the base of the number being printed.
- `nouppercase` : it will cause the output to be in lowercase letters.
- `hex` : it will cause the output to be in hexadecimal format.

The `endl` is a manipulator which causes a newline character to be output and the buffer to be flushed.

The `(long long)` cast is used to ensure that the value of A is treated as a long long integer.

It will output the value of A in left-aligned hexadecimal format, including a prefix indicating that the base is hexadecimal and using lowercase letters for the digits.

### Print padded fixed-width output with sign

``` cpp
cout << setprecision(2) << setw(15) << right << showpos << fixed << setfill('_') << B << endl;
```

The `setprecision(2)`, `setw(15)`, `right`, `showpos`, `fixed`, `setfill('_')` manipulators are being used to modify the behavior of the cout function.

- `setprecision(2)`: it will set the precision of the output to 2 decimal places.
- `setw(15)`: it will set the width of the output field to be 15 characters.
- `right`: it will align the output to the right.
- `showpos`: it will cause the output to include a sign (+ or -) for positive numbers.
- `fixed`: it will cause the output to be in fixed-point notation.
- `setfill('_')`: it will set the fill character for the output field to be '_'.
- The `endl` is a manipulator which causes a newline character to be output and the buffer to be flushed.

It will output the value of `B` with `2 decimal places`, `right-aligned`, with a `field width` of `15 characters` and `filled with '_'`, a `sign prefix` for positive numbers, in `fixed point notation`.

### Print scientific notation

``` cpp
cout << setprecision(9) << noshowpos << uppercase << scientific << C << endl;
```

The `setprecision(9)`, `noshowpos`, `uppercase`, `scientific` manipulators are being used to modify the behavior of the `cout` function.

- `setprecision(9)`: it will set the precision of the output to 9 decimal places.
- `noshowpos`: it will cause the output not to include a sign (+ or -) for positive numbers.
- `uppercase`: it will cause the output to be in uppercase letters.
- `scientific`: it will cause the output to be in scientific notation.
- The `endl` is a manipulator which causes a newline character to be output and the buffer to be flushed.

It will output the value of `C` with `9 decimal places`, `not show positive sign`, in `uppercase` letters and using `scientific notation`.

## Custom Exception

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

## Dictionary

```cpp

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

```cpp
set<int>s;              //Creates a set of integers.
int length=s.size();    //Gives the size of the set.
s.insert(x);            //Inserts an integer x into the set s.
s.erase(val);           //Erases an integer val from the set s.

set<int>::iterator itr=s.find(val); //Gives the iterator to the element val if it is found otherwise returns s.end() .
set<int>::iterator itr=s.find(100); //If 100 is not present then it==s.end().
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
