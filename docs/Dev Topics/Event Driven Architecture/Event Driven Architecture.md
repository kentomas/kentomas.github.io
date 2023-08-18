# Event Driven Architecture

## Overview

### 1. What are Events and Event Streams?

1. Consumers can choose what data they want to consume
2. Events provide a record of something that has happened in the business (Fact).
    1. We name events using past-tense terminology
        1. e.g. flight_booked, order_shipped, etc.
3. Events are immutable (they cannot change).

### 2. Fact vs Delta Event Types

1. A **Fact** details the entire details the entire scope of what happened at a specific point in time.
   1. It describes all the details necessary to describe the fact in the context of your business.
   2. Think of it as a row in a database, which is a complete set of data points at that point in time.
2. **Delta Events** detail the changes between one state and another.
   1. Contents typically include information about the state change, including the reasons for the change.
   2. Delta events do not contain information about data that hasn't changed.
3. One of the biggest reasons for using fact events is due to its simplicity and effectiveness in transferring state.
   1. This pattern is known as `event-carried state transfer`, which is one of the best ways to
      asynchronously distribute immutable state to all consumers who need it.
   2. As a consumer you don't need to built up the state yourself from multiple delta event types.

| -         | **Objective**: Obtain the Current State                                      | **Objective**: React to a specific action or change                                                           |
| --------- | ---------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| **Fact**  | **Good Choice** - Get full description of the current state.                 | **Possible Choice** - Consumer can detect any change in value but may not contain reason why change occurred. |
| **Delta** | **Bad Choice** - Clients must replicate logic to build up the current state. | **Good Choice** - Notifying external consumers for choice events.                                             |

### 3. Hands-On Exercise: Fact vs Delta Event Types

### 4. Normalization vs Denormalization

### 5. Hands-On Exercise: Normalization vs Denormalization

### 6. Single vs Multiple Event Streams

### 7. Single vs Multiple Event Streams

### 8. Terminating vs Non-Terminating Entities

### 9.  Event Design and Event Streams Best Practices

## Resources

- <https://www.youtube.com/playlist?list=PLa7VYi0yPIH145SVtPoh3Efv8xZ1ehUYy>
- 