# Mockito (Java)

## Overview

Mockito is a mocking library for Java.

## Steps Overview

1. Add Mockito as module dependency.

    ```xml title="pom.xml" linenums="1" hl_lines="12-17"
    <?xml version="1.0" encoding="UTF-8"?>
    <project xmlns="http://maven.apache.org/POM/4.0.0"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
        <modelVersion>4.0.0</modelVersion>

        <groupId>org.example</groupId>
        <artifactId>Server</artifactId>
        <version>1.0-SNAPSHOT</version>

        <dependencies>
            <dependency>
                <groupId>org.mockito</groupId>
                <artifactId>mockito-junit-jupiter</artifactId>
                <version>5.1.1</version>
                <scope>test</scope>
            </dependency>
        </dependencies>
    </project>
    ```

2. Extend Test Class.

    ```java
    
    ```

3. Create Mocked Object.
4. Create Stubbed function of Mocked Object.
5. Perform test.

## Getting Started

## Sample Test Class

```java title="SimpleHandlerTest.java" linenums="1" hl_lines="13 18-24 30-37 48"
package org.example;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class SimpleHandlerTest {

    private SimpleHandler simpleHandler;

    //region Mocked Objects
    @Mock
    Context context;

    @Mock
    LambdaLogger logger;
    //endregion

    //region Test Setup
    @BeforeEach
    public void setup()
    {
        // Initialise the replacement of the Mocked Logger whenever the Mocked Context calls "getLogger()".
        Mockito.when(context.getLogger()).thenReturn(logger);

        // Stub out the "log()" function with the code described in the "call".
        Mockito.doAnswer(call -> {
            System.out.println((String)call.getArgument(0));
            return null;
        }).when(logger).log(Mockito.anyString());

        simpleHandler = new SimpleHandler();
    }
    //endregion

    @Test
    void shouldReturnUppercaseOfInput() {
        // Arrange
        String input = "hello world!";
        // Mock out the "getFunctionName()" else the function will return "null" as the functionName.
        Mockito.when(context.getFunctionName()).thenReturn("handleRequest");

        // Act
        String res = simpleHandler.handleRequest(input,context);

        // Assert
        String expectedOutput = "HELLO WORLD!";
        Assertions.assertEquals(expectedOutput, res);
    }
}
```

Source: [AWS Lambda Java Tutorial: How to use the AWS Lambda Java Core Library](https://www.youtube.com/watch?v=kyWllXOGMWQ)

## References

- <https://site.mockito.org/>