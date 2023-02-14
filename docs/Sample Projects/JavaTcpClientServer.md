# Sample Java TCP Client Server Application

## Overview

- The Server is a standalone application.
- The Client is a standalone application.
- This is a TCP connection.

## Specifications

1. The server is listening on port `4444`.
2. The server is available on `localhost`.
3. The server will stay open until the client sends a message with exactly `"Bye."` within it.
4. The server will respond to any messages sent from the client with an `"ACK: <Client_Message>"`.

## Server

```java title="Server.java"
package com.example;

import java.io.*;
import java.net.*;

public class Server {
    public static void main(String[] args) throws IOException {
        ServerSocket serverSocket = null;
        try {
            serverSocket = new ServerSocket(4444);
        } catch (IOException e) {
            System.err.println("Could not listen on port: 4444.");
            System.exit(1);
        }

        Socket clientSocket = null;
        try {
            System.out.println("Waiting for client connection...");
            clientSocket = serverSocket.accept();
        } catch (IOException e) {
            System.err.println("Accept failed.");
            System.exit(1);
        }

        PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
        BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
        String inputLine, outputLine;

        while ((inputLine = in.readLine()) != null) {
            System.out.println("Received from client: " + inputLine);
            outputLine = "ACK: " + inputLine;
            out.println(outputLine);
            if (outputLine.equals("ACK: Bye."))
                break;
        }

        out.close();
        in.close();
        clientSocket.close();
        serverSocket.close();
    }
}

```

## Client

```java title="Client.java"
package com.example;
import java.io.*;
import java.net.*;

public class Client {
    public static void main(String[] args) throws IOException {
        Socket clientSocket = null;

        try {
            clientSocket = new Socket("localhost", 4444);
            System.out.println("Connected to server.");
        } catch (UnknownHostException e) {
            System.err.println("Unknown host: localhost.");
            System.exit(1);
        } catch (IOException e) {
            System.err.println("Could not get I/O for the connection to: localhost.");
            System.exit(1);
        }

        PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
        BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
        BufferedReader stdIn = new BufferedReader(new InputStreamReader(System.in));
        String inputLine;

        while ((inputLine = stdIn.readLine()) != null) {
            out.println(inputLine);
            System.out.println("Server response: " + in.readLine());
            if (inputLine.equals("Bye."))
                break;
        }

        out.close();
        in.close();
        stdIn.close();
        clientSocket.close();
    }
}

```

## Advanced

### Server Supporting Multiple Clients

In this version of the server:

- A new instance of ClientHandler is created for each client that connects to the server.
- Each instance of ClientHandler runs on its own thread and communicates with its corresponding client using the socket instance variable.
- This allows multiple clients to connect to the server and receive responses at the same time.

```java title="Server.java"
import java.io.*;
import java.net.*;

public class Server {
  public static void main(String[] args) throws IOException {
    ServerSocket serverSocket = null;
    try {
      serverSocket = new ServerSocket(4444);
    } catch (IOException e) {
      System.err.println("Could not listen on port: 4444.");
      System.exit(1);
    }

    while (true) {
      Socket clientSocket = null;
      try {
        System.out.println("Waiting for client connection...");
        clientSocket = serverSocket.accept();
      } catch (IOException e) {
        System.err.println("Accept failed.");
        System.exit(1);
      }

      System.out.println("Client connected from " + clientSocket.getInetAddress().getHostAddress());
      new ClientHandler(clientSocket).start();
    }
  }

  static class ClientHandler extends Thread {
    private Socket socket;

    ClientHandler(Socket socket) {
      this.socket = socket;
    }

    public void run() {
      try {
        PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
        BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        String inputLine, outputLine;

        while ((inputLine = in.readLine()) != null) {
          System.out.println("Received from client: " + inputLine);
          outputLine = "ACK: " + inputLine;
          out.println(outputLine);
          if (outputLine.equals("ACK: Bye."))
            break;
        }

        out.close();
        in.close();
        socket.close();
        System.out.println("Client disconnected.");
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }
}
```
