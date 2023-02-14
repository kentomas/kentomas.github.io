# C# Code Snippets

## Delegate

### Function Abstraction Example

- A delegate is a type that represents a method with a specific signature, which can be used to encapsulate a reference to a method and pass it as a parameter, return value, or store it for later invocation.
- It allows for creating flexible, loosely-coupled and extensible code by enabling the separation of concerns between the invoker and the implementation of the method being invoked.
- Delegates can be used for event handling, asynchronous programming, and other scenarios where a method needs to be passed around as an object.

```cs
// Define a delegate type that takes two integer parameters and returns an integer
delegate int BinaryOperation(int a, int b);

// Define some methods that match the delegate signature
int Add(int a, int b)
{
    return a + b;
}

int Subtract(int a, int b)
{
    return a - b;
}

// Pass the methods as delegate arguments to a calculator method
int Calculate(BinaryOperation operation, int a, int b)
{
    return operation(a, b);
}

// Call the calculator method with the Add and Subtract methods as delegates
int result1 = Calculate(Add, 3, 4);    // result1 = 7
int result2 = Calculate(Subtract, 10, 5);   // result2 = 5
```

In this example:

- We define a delegate type `BinaryOperation` that takes two integers and returns an integer. We then define two methods `Add` and `Subtract` that match the delegate signature.
- We then define a method `Calculate` that takes a `BinaryOperation` delegate as its first argument, along with two integers `a` and `b`. The `Calculate` method invokes the delegate with the a and b arguments and returns the result.
- Finally, we call the `Calculate` method with the `Add` and `Subtract` methods as delegates, which are passed as arguments to the method. The method then invokes the delegate methods and returns the results.

### Message Handler Example

```cs
// Define a delegate type that takes a string message parameter
delegate void MessageHandler(string message);

// Define a class that can send and receive messages
class MessageService
{
    // Define an event that can be subscribed to by message handlers
    public event MessageHandler MessageReceived;

    // Define a method that simulates receiving a message and raising the event
    public void ReceiveMessage(string message)
    {
        // Check if any handlers are subscribed to the event
        if (MessageReceived != null)
        {
            // Invoke the event with the message parameter
            MessageReceived(message);
        }
    }
}

// Define some message handlers
class ConsoleMessageHandler
{
    public void HandleMessage(string message)
    {
        Console.WriteLine("Received message: " + message);
    }
}

class EmailMessageHandler
{
    public void HandleMessage(string message)
    {
        // Send the message via email
        Console.WriteLine("Sending message via email: " + message);
    }
}

// Create an instance of the MessageService and some message handlers
MessageService service = new MessageService();
ConsoleMessageHandler consoleHandler = new ConsoleMessageHandler();
EmailMessageHandler emailHandler = new EmailMessageHandler();

// Subscribe the message handlers to the MessageReceived event
service.MessageReceived += consoleHandler.HandleMessage;
service.MessageReceived += emailHandler.HandleMessage;

// Simulate receiving a message
service.ReceiveMessage("Hello, world!");
```

In this example:

- We define a `MessageHandler` delegate that takes a string message parameter. We then define a `MessageService` class that can send and receive messages. The `MessageService` class has an `event` called `MessageReceived` that can be subscribed to by `message handlers`.
- We also define `two` `message handlers`, `ConsoleMessageHandler` and `EmailMessageHandler`, that both `implement` the `MessageHandler delegate`.
- We then create an instance of the `MessageService` and some message handlers, and `subscribe` the `message handlers` `to` the `MessageReceived` `event` of the `MessageService`.
- Finally, we `simulate receiving` a `message` by `calling` the `ReceiveMessage` method of the `MessageService` with a message string. This causes the `MessageReceived` `event` to be `raised`, which `invokes` the `HandleMessage methods` of the `subscribed message handlers`, `passing` in the `message string` as a parameter. In this case, the `ConsoleMessageHandler` and `EmailMessageHandler` both handle the message in their own way.
