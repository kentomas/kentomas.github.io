# Test Driven Development

**Source**

From LinkedIn Learning

**[C# Test-Driven Development](https://www.linkedin.com/learning/c-sharp-test-driven-development-14275015?contextUrn=urn%3Ali%3AlearningCollection%3A6995167947543506944&u=2087740)**  
by: Christian Wenz  

Duration: 1h 22m - Intermediate - Released: 9/23/2021

## TDD Theory

### Advantages

1. Small tests lead to modular apps.
2. Refactor early, not late.
    1. Less refactoring later on.
3. ALlows automated testing.
    1. We write the test but not neccesarily the test runner.

### Disadvantages

1. Writing tests can be hard.
    1. This is the major block for many.
    2. Tests may not be complex and thus not useful.
2. Initially takes more time.
3. Danger of constant refactoring.
    1. Sometimes no application gets built...

### Software and Tooling

**Testing Frameworks:**

- MSTest
- Nunit (preferred)
- xUnit

**Mocking Libraries:**

- Moq (preferred)
- NSubstitute
- FakeItEasy
- Microsoft Fakes

## Getting Started with TDD

### 1. Create Test Class

=== "C#"

```cs  
// ShoppingCartTests.cs
namespace HPlusSportTDD.Core
{
    internal class ShoppingCartTests
    {
        [SetUp]
        public void SetUp()
        {

        }
    }
}
```

### 2. Create Test Method

=== "C#"

```cs 
// ShoppingCartTests.cs
namespace HPlusSportTDD.Core
{
    internal class ShoppingCartTests
    {
        [SetUp]
        public void SetUp(){}

        [Test]
        public void ShouldReturnArticleAddedToCard()
        {

        }
    }
}
```

### 3. Create Basic Test 

Create basic test generating classes and methods only (not implementing them).

=== "C#"

```cs 
// ShoppingCartTests.cs
namespace HPlusSportTDD.Core
{
    internal class ShoppingCartTests
    {
        [SetUp]
        public void SetUp(){}

        [Test]
        public void ShouldReturnArticleAddedToCard()
        {
            var item = new AddToCartItem()
            {
                ArticleId = 42,
                Quantity = 5
            };

            var request = new AddToCartRequest()
            {
                item = item
            };

            var manager = new ShoppingCartManager();

            AddToCartResponse response = manager.AddToCart(request);
        }
    }
}
```

### 4. Create Test Assertion

=== "C#"

```cs 
// ShoppingCartTests.cs
namespace HPlusSportTDD.Core
{
    internal class ShoppingCartTests
    {
        [SetUp]
        public void SetUp(){}

        [Test]
        public void ShouldReturnArticleAddedToCard()
        {
            var item = new AddToCartItem()
            {
                ArticleId = 42,
                Quantity = 5
            };

            var request = new AddToCartRequest()
            {
                item = item
            };

            var manager = new ShoppingCartManager();

            AddToCartResponse response = manager.AddToCart(request);

            Assert.IsNotNull(response);
            Assert.Contains(item, response.Items);
        }
    }
}
```

### 5. Run Test To Let It Fail

```
(Visual Studio)> Ctrl+R, A
```

### 6. Implement Function

=== "C#"

```cs 
// ShoppingCartManager.cs
using System.Collections.Generic;

namespace HPlusSportTDD.Core
{
    internal class ShoppingCartManager
    {
        private List<AddToCartItem> _shoppingCart;

        public ShoppingCartManager()
        {
            _shoppingCart = new List<AddToCartItem>();
        }

        internal AddToCartResponse AddToCart(AddToCartRequest request)
        {
            var item = _shoppingCart.Find(i => i.ArticleId == request.item.ArticleId);
            if (null != item)
            {
                item.Quantity += request.item.Quantity;
            }
            else
            {
                _shoppingCart.Add(request.item);
            }

            return new AddToCartResponse()
            {
                Items = _shoppingCart.ToArray()
            };
        }
    }
}
```

### 7. Run Test And Confirm It Passes

```
(Visual Studio)> Ctrl+R, A
```

## Advanced TDD Techniques

### Mocking

- What do we do when don't want to use the actual resource?
  - We use "Mocked"...

**Mock:**

- Handles indirect outputs of System Under Test (SUT).

**Stub:**

- Handles indirect inputs of SUT.
  - Usually returns hard coded values.

**Dummy:**

- Satisfies the compiler.

**Fakes:**

- Full implementations...
  - e.g. use in-memory database instead of production database.

Use Nuget package `Moq` by `Daniel Cazzulino, kzu`.
