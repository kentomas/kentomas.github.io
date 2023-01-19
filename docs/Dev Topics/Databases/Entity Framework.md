# Entity Framework

## Join Query In Entity Framework

Source: <https://www.tektutorialshub.com/entity-framework/join-query-entity-framework/>

=== "C#"

```cs linenums="1"
using (AdventureWorks db = new AdventureWorks())
{
    var person = (from p in db.People
                join e in db.EmailAddresses
                on p.BusinessEntityID equals e.BusinessEntityID
                where p.FirstName == "KEN"
                select new {
                    ID = p.BusinessEntityID,
                    FirstName = p.FirstName,
                    MiddleName = p.MiddleName,
                    LastName = p.LastName,
                    EmailID = e.EmailAddress1
                }).ToList();

    foreach (var p in person)
    {
        Console.WriteLine("{0} {1} {2} {3} {4}", p.ID, p.FirstName, p.MiddleName, p.LastName, p.EmailID);
    }
}
```

Other example:
=== "C#"

```cs linenums="1"
using (AdventureWorks db = new AdventureWorks())
{
    var person = db.People
                .Join(db.EmailAddresses,
                    p => p.BusinessEntityID,
                    e => e.BusinessEntityID,
                    (p, e) => new {
                        FirstName = p.FirstName,
                        MiddleName = p.MiddleName,
                        LastName = p.LastName,
                        EmailID = e.EmailAddress1 }
                    ).Take(5);
    foreach (var p in person)
    {
        Console.WriteLine("{0} {1} {2} Email ID : {3}", p.FirstName, p.MiddleName, p.LastName, p.EmailID);
    }
}
```
