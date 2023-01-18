# Swagger

## ASP.NET Web API

Nuget Package Requirements:

1. `Swashbuckle.AspNetCore.Swagger`
2. `Swashbuckle.AspNetCore.SwaggerGen`
3. `Swashbuckle.AspNetCore.SwaggerUI`

``` cs title="C# - Program.cs"
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();

```

## References
