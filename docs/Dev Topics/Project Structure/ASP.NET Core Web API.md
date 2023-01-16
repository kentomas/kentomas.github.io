# ASP.NET Core Web API - Project Structure

## Project Structure Overview

- Project.sln
  - Project.API.csproj
    - Contollers
    - DbContexts
    - Entities
    - Migrations
    - Models
    - Profiles
    - Repositories

### Controllers

This folder contains the classes that handle incoming HTTP requests and return the appropriate HTTP response. These classes are typically derived from the ApiController base class and handle the incoming requests by calling methods on the service or repository classes.

??? example

    === "C#"

    ```cs
    using System.Collections.Generic;
    using Microsoft.AspNetCore.Mvc;
    using YourNamespace.Models;
    using YourNamespace.Services;

    namespace YourNamespace.Controllers
    {
        [ApiController]
        [Route("api/[controller]")]
        public class TodoController : ControllerBase
        {
            private readonly ITodoService _todoService;

            public TodoController(ITodoService todoService)
            {
                _todoService = todoService;
            }

            [HttpGet]
            public ActionResult<IEnumerable<TodoModel>> GetAll()
            {
                return Ok(_todoService.GetAll());
            }

            [HttpGet("{id}")]
            public ActionResult<TodoModel> GetById(int id)
            {
                var todo = _todoService.GetById(id);
                if (todo == null)
                {
                    return NotFound();
                }
                return Ok(todo);
            }

            [HttpPost]
            public ActionResult<TodoModel> Create(TodoModel todo)
            {
                return Ok(_todoService.Create(todo));
            }

            [HttpPut("{id}")]
            public ActionResult<TodoModel> Update(int id, TodoModel todo)
            {
                var updatedTodo = _todoService.Update(id, todo);
                if (updatedTodo == null)
                {
                    return NotFound();
                }
                return Ok(updatedTodo);
            }

            [HttpDelete("{id}")]
            public ActionResult Delete(int id)
            {
                if (_todoService.Delete(id))
                {
                    return NoContent();
                }
                return NotFound();
            }
        }
    }

    ```

### DbContexts

This folder contains the classes that handle the database context, typically using the Entity Framework. These classes are responsible for interacting with the database and providing an abstraction over the database.

DbContext is a class in the Entity Framework (EF) in ASP.NET that serves as a bridge between the domain or business objects and the database. It is responsible for communicating with the database, retrieving and saving data, and mapping the data between the domain objects and the database tables. The DbContext class is typically used in the repository pattern, where it is used to query the data and map the results to domain objects, and to persist changes made to the domain objects back to the database.

??? example

    === "C#"

    ``` cs
    public class MyDbContext : DbContext
    {
        public MyDbContext(DbContextOptions<MyDbContext> options)
            : base(options)
        {
        }

        public DbSet<Value> Values { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Value>()
                .ToTable("Values");
        }
    }

    ```

### Entities

This folder contains the classes that represent the entities in the application's domain model. These classes are typically used by the DbContexts to map to the database tables.

??? example

    === "C#"

    ``` cs
    public class Value
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    ```

### Migrations

This folder contains the classes that handle database migrations, typically using the Entity Framework. These classes are responsible for creating and updating the database schema.

??? example

    === "C#"

    ``` cs
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Values",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Name = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Values", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Values");
        }
    }

    ```

### Models

This folder contains the classes that represent the data that is sent in the body of the HTTP requests and responses. These classes are typically used by the controllers to handle the incoming requests and create the appropriate response.

??? example

    === "C#"

    ``` cs
    public class ValueModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    ```

### Profiles

This folder contains the classes that handle the mapping between the entities and the models, typically using AutoMapper. These classes are responsible for converting between the different representations of the data.

??? example

    === "C#"

    ``` cs
    public class ValueProfile : Profile
    {
        public ValueProfile()
        {
            CreateMap<Value, ValueModel>();
            CreateMap<ValueModel, Value>();
        }
    }
    ```

### Repositories

This folder contains the classes that handle the database logic, such as CRUD operations. These classes are responsible for interacting with the database and providing an abstraction over the database.

??? example

    === "C#"

    ``` cs
    public class ValueRepository : IValueRepository
    {
        private readonly MyDbContext _dbContext;

        public ValueRepository(MyDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public IEnumerable<Value> GetAll()
        {
            return _dbContext.Values.ToList();
        }
    }
    ```


## Reference

- [Youtube - Building a microservice architecture with ASP.NET Core - Gill Cleeren - NDC London 2022](https://www.youtube.com/watch?v=SR53SKIUYPA&t=2573s)
