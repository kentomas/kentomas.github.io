# C++ Code Snippets

**References:** <https://en.cppreference.com/w/cpp/algorithm/lower_bound>

## Collections

```cpp
std::vector<int> lifo_list_1;
std::stack<int> lifo_list_2;
std::queue<int> fifo_list_1;
```

## Custom Exception

``` cpp
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

``` cpp
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

``` cpp
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

## Try catch

``` cpp
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
