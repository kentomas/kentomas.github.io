# DbContext and DbSet

Source: [https://learn.microsoft.com/en-us/ef/core/miscellaneous/nullable-reference-types#dbcontext-and-dbset](https://learn.microsoft.com/en-us/ef/core/miscellaneous/nullable-reference-types#dbcontext-and-dbset)

The common practice of having uninitialized DbSet properties on context types is also problematic, as the compiler will now emit warnings for them. This can be fixed as follows:

```cs
public class NullableReferenceTypesContext : DbContext
{
    public DbSet<Customer> Customers => Set<Customer>();
    public DbSet<Order> Orders => Set<Order>();

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder
            .UseSqlServer(
                @"Server=(localdb)\mssqllocaldb;Database=EFNullableReferenceTypes;Trusted_Connection=True");
}
```

OR

```cs
public DbSet<Customer> Customers = null!;
```
