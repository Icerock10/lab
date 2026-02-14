# JavaScript Closures

## What Is a Closure?

A **closure** is created when a `function` remembers and accesses `variables` from its **outer `lexical` scope**, even after that outer function has finished executing.

- A closure is a function + its lexical environment.

- Closures allow persistent state.

- Closures capture references, not snapshots.

- They are fundamental to callbacks, async code, and functional patterns.

---

## Key Properties

- A closure forms **automatically** when a function is defined inside another function.
- Inner functions can access:
  - their own variables
  - variables of the outer function
  - global variables
- The outer function’s variables **stay alive** as long as the inner function exists.
- Closures capture **variable references**, not copies.

---

## Basic Example

```js
function outer() {
  let count = 0;

  function inner() {
    count++;
    console.log(count);
  }

  return inner;
}

const fn = outer();
fn(); // 1
fn(); // 2
fn(); // 3

inner() keeps access to `count` even after outer() has finished.
```

## Closures Create Private Variables

```js
function createCounter() {
  let value = 0;

  return {
    inc() {
      value++;
    },
    get() {
      return value;
    },
  };
}

const counter = createCounter();
counter.inc();
console.log(counter.get()); // 1

`value` is private — not accessible from outside.
```

## Closures in Loops

```js
for (var i = 0; i < 3; i++) {
  setTimeout(() => console.log(i), 100);
}
// 3, 3, 3

fix - let creates a new lexical binding for each iteration.
// 0, 1, 2

```

## Closures + Callbacks

```js
function makeLogger(prefix) {
  return function (msg) {
    console.log(prefix, msg);
  };
}

const info = makeLogger('[INFO]');
info('Server started'); // [INFO] Server started

makeLogger('[INFO]')('Server started'); // [INFO] Server started

This expression works because you are calling two functions in a row:

First call: makeLogger('[INFO]')
		- This creates a closure.
		- It returns a new function that remembers the prefix value ("[INFO]").

Second call: ('Server Started')

		- This immediately calls the returned inner function.
		- That inner function prints both the saved prefix and the message.

```

## Closures + Function Factories

```js
function multiplyBy(n) {
  return function (x) {
    return x * n;
  };
}

const double = multiplyBy(2);
console.log(double(5)); // 10
```
