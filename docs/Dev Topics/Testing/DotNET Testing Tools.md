# DotNET (.NET) Testing Tools

## Overview

There are four types of “replacement objects” according to Martin Flower’s article:

- `Dummies` - objects are passed around but never actually used. Usually they are just used to fill parameter lists in method call
- `Fakes` - have the same behavior as the thing that it replaces. They have working implementations, but usually take some shortcut which makes them not suitable for production (an in memory database is a good example)
- `Stubs` - objects which have a "fixed" set of "canned" responses that are specific to test you setup. They have hard-coded responses to an expected request
- `Mocks` - have a set of expectations about calls that are made. If these expectations are not met, the test is fail. A mock is not setup in a predetermined way so you have code that does it in your test

`Tests` written with mocks usually follow below pattern:

`initialize` -> `set expectations` -> `exercise` -> `verify`

`Stub` would follow below pattern:

`initialize` -> `exercise` -> `verify`

…and one more thing: `Mocks != Stubs`

## Mocking Libraries

### FakeItEasy

FakeItEasy is an easy mocking library for .NET which enables creating all types of fake objects, mocks and stubs.

## Resources

1. <https://techmindfactory.com/Easy-mocking-in-C-code-with-FakeItEasy-library/>
