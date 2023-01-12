# Domain Driven Design

**Resources:**

- [https://www.dddcommunity.org/](https://www.dddcommunity.org/)

## Martin Fowler Description

Source: [https://martinfowler.com/tags/domain%20driven%20design.html](https://martinfowler.com/tags/domain%20driven%20design.html)

Domain-Driven Design is an approach to software development that centers the development on programming a domain model that has a rich understanding of the processes and rules of a domain. The name comes from a 2003 book by Eric Evans that describes the approach through a catalog of patterns.

- `Domain Model`
    - An object model of the domain that incorporates both behavior and data.
    - A Domain Model creates a web of interconnected objects, where each object represents some meaningful individual, whether as large as a corporation or as small as a single line on an order form.
- `Bounded Context`
    - Bounded Context is a central pattern in Domain-Driven Design. It is the focus of DDD's strategic design section which is all about dealing with large models and teams. DDD deals with large models by dividing them into different Bounded Contexts and being explicit about their interrelationships.
- `Command Query Responsibility Segregation` (CQRS)
    - It's a pattern that I first heard described by Greg Young. At its heart is the notion that you can use a different model to update information than the model you use to read information. For some situations, this separation can be valuable, but beware that for most systems CQRS adds risky complexity.
- `DDD Aggregate`
    - Aggregate is a pattern in Domain-Driven Design. A DDD aggregate is a `cluster of domain object`s that can be treated as a single unit. An example may be an order and its line-items, these will be separate objects, but it's useful to treat the order (together with its line items) as a single aggregate.
- `Value Object`
    - JavaScript tests equality for js objects by looking at their references, ignoring the values they contain.
    - When checking for equality, depending on the language, verify the evaluation function being used.

## Microsoft

Source: [https://learn.microsoft.com/en-us/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/](https://learn.microsoft.com/en-us/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/)

### Design a DDD-oriented microservice

Source: [https://learn.microsoft.com/en-us/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/ddd-oriented-microservice](https://learn.microsoft.com/en-us/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/ddd-oriented-microservice)

Domain-driven design (DDD) advocates modeling based on the reality of business as relevant to your use cases. In the context of building applications, DDD talks about problems as domains. It describes independent problem areas as Bounded Contexts (each Bounded Context correlates to a microservice), and emphasizes a common language to talk about these problems. It also suggests many technical concepts and patterns, like domain entities with rich models (no anemic-domain model), value objects, aggregates, and aggregate root (or root entity) rules to support the internal implementation.

- Keep the microservice context boundaries relatively small.
    - First, you want to initially create the smallest possible microservices, although that should not be the main driver; you should create a boundary around things that need cohesion.
    - Second, you want to avoid chatty communications between microservices.
    - These goals can contradict one another. You should balance them by decomposing the system into as many small microservices as you can until you see communication boundaries growing quickly with each additional attempt to separate a new Bounded Context.
- `Layers` in DDD microservices (==all different projects in the VS Solution==)
    - `Application Layer`
        - ASP.NET Web API
        - Network access to microservice
        - API contracts/implementaiton
        - Comamnds and command handlers
        - Queries (when using ann CQS approach)
            - Miro ORMs like dapper
    - `Domain Model Layer`
        - Domain Entity Model
        - PCO entity classes (clean C# code)
        - Domain entities with data + behaviour
        - DDD Patterns
            - Domain entity, aggregate
            - Aggregate root, value object
            - Repository contracts/interfaces
    - `Infrastructure Layer`
        - Data persistence infrastructure
            - Repository implementation
        - Use of ORMs or data access API
            - Entity Framework Core or any ORM
            - Any noSQL database API
        - Other infrastructure implementaiton used from the application layer
            - Logging, cryptography, search engine, etc.
