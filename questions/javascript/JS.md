# Functions

<details>
  <summary>🔵 1. Function Declaration vs Expression</summary>

### Function Declaration

- Declared using the `function` keyword
- `Hoisted` (can be called before declaration)

### Function Expression

- `Function` assigned to a `variable`
- `Not hoisted` (cannot be called before initialization)
</details>

<details>
  <summary>🔵 2. Arrow Functions main differences?</summary>

- Can omit return and parantheses when single param
- Do not have their own `this` (its taken from the lexical scope)
- Cannot be used as constructors (new)
- Cannot be changed using `call`, `apply`, or `bind`
- does not have `arguments`

```js
const add = (b) => b;

// this

const obj = {
  value: 10,
  arrow: () => this.value,
};

console.log(obj.arrow()); // undefined
```

</details>

<details>
  <summary>🔵 5. `...rest` && Spread && `arguments`</summary>

```js
function sum(...numbers) {
  return numbers.reduce((a, b) => a + b, 0);
}
// Collects multiple arguments into an array
```

```js
const arr1 = [1, 2];
const arr2 = [3, 4];

const merged = [...arr1, ...arr2]; // [1, 2, 3, 4]
```

</details>

<details>
  <summary>🔵 6. IIFE (Immediately Invoked Function Expression)</summary>

- A function that runs immediately after definition
- Used to create a private scope

```js
(function () {
  const secret = 'hidden';
  console.log('IIFE executed');
})();
```

</details>

<details>
  <summary>🔵 7. Function Scope vs Block Scope</summary>

**Function Scope** - Variables declared with var are function-scoped
**Block Scope** - Variables declared with let and const are block-scoped

```js
function example() {
  if (true) {
    let x = 10;
    var y = 20;
  }

  // console.log(x); // ReferenceError
  console.log(y); // 20
}
```

</details>

<details>
  <summary>🔵 9. Function `Prototypes`, `__proto__`, `[[Proto]]`</summary>
- A `prototype` is an `object` from which another object inherits properties.

- `[[Prototype]]` — its a hidden reference to the next object in the inheritance chain, setting upon `new` call
- `__proto__` used with **objects** - an accessor (getter/setter) that allows you to get or change the [[Prototype]] of an object.
- `prototype` used with **functions** - property of a constructor function which defines the prototype, used only when called via `new`
- `constructor` is a reference to the function that created the object

### Small statements

- `obj.__proto__` === `Object.getPrototypeOf(obj)`
- `obj.constructor` === `obj.__proto__.constructor`
- `Func.prototype` // an object that will become the prototype of all instances created via new Func()
- `Func.prototype.constructor` // reference to a constructor function (Func)
- `obj.constructor` // access to the constructor through the prototype chain

### Prototype commands

- `obj.__proto__` // access to [[Prototype]]
- `Object.getPrototypeOf(obj)` // returns [[Prototype]] of an object (right replacement of \***\*proto\*\***)
- `Object.setPrototypeOf(obj, proto)` // sets `__proto__` as the object's prototype (slowly, carefully)
- `Object.prototype.isPrototypeOf(obj)`// checks whether an object is in the `prototype chain`
- `Object.create(proto)` // creates a new object with an explicitly specified prototype
- `obj instanceof Constructor` // checks if Constructor.prototype is in the object's prototype chain
- `obj.hasOwnProperty(prop)`// checks if a property is own (not from prototype)
- `prop in obj`// checks if a property exists in an object OR in the prototype chain
- `for (const key in obj)` // iterates over its own + prototype enumerable properties
- `Object.keys(obj)` // returns only its own enumerable properties

#### Explanation

- `Func.prototype = { ... }` // completely replaces prototype (constructor can be broken)
- `Func.prototype = { constructor: Func, ... }` // Correct replacement of prototype while preserving constructor

### Prototype chain

`obj.someProp`

- Looks for someProp in the object itself.
- If not found, it looks in `obj.__proto__.`
- If not found, it moves further down the chain.
- The end of the chain is `Object.prototype`
- After that, it's `null`.

### How `new` call works?

```js
const user = new User();
// Creates an empty object {}
// Sets user.__proto__ = User.prototype (links this object)
// Calls User.call(user) where this = user, and returns user
user = {
  name: 'Max',
  __proto__: User.prototype,
};
```

### Practical examples

**1.Adding method to arrays**

```js
Array.prototype.last = function () {
  return this[this.length - 1];
};

console.log([1, 2, 3].last());
```

**2. A separate method for all objects**

```js
Object.prototype.sayHi = function () {
  console.log('Hi from', this);
};
({}).sayHi();
```

**3. Properties are searched in a chain**

```js
const a = { x: 1 };
const b = Object.create(a);
const c = Object.create(b);

console.log(c.x); // 1
```

4. **Inheritance outside classes**

```js
Function2.prototype = Object.create(Function1.prototype)
Function2.prototype.constructor = Function2

// This creates a chain:

new Function2()
   → Function2.prototype
       → Function1.prototype
           → Object.prototype

```

5. **Overriding the entire prototype**

```js
Function2.prototype = {
  constructor: Function2,
  sayHello() {
    return `hello from here, ${this.name}`;
  },
};
```

6. `Object.setPrototypeOf(obj, proto)` - **direct way to change the prototype of an existing object**

```js
const a = { name: 'Max' };
const b = {
  sayHi() {
    return `Hi, ${this.name}`;
  },
};

Object.setPrototypeOf(a, b);

a.sayHi(); // "Hi, Max"
```

7. **Create an object with `Object.create()`**

```js
const dict = Object.create(null); // without prototype
dict.key = 'value';

---------------------------

const animal = { eats: true }
const dog = Object.create(animal) // with a custom prototype

dog.eats // true
```

### How string "" knows methods?

**String has no methods since it is primitive, but under the hood it creates a temporary wrapper with `new String('')` and search inside it's `prototype`**

`'hello'` -> (creates wrapper) `new String('hello')` -> `String.prototype` -> `Object.prototype` -> `null`

### When to:

✔️ **1. Memory Optimization**

- Prototype methods are one instance of all.

✔️ **2. Creating ES6 classes.**

- Legacy code.

✔️ 3. **Inheritance without classes**

- `Object.create(proto).`

✔️ **4. Polyfills**

- For example, adding methods to `Array.prototype.`

✔️ **5. Lesson "Understanding How It Works."**

- To understand what JS does under the hood.
</details>

# Classes

<details>
  <summary>🔵 1. Extends && `super()` Keyword</summary>

- `super.method(...)` - **to call a parent method.**
- `super` - **to call a parent constructor (inside our constructor or method).**
- Arrow functions have no `super` / `this` / `arguments`, and search for them in `outer context` (one level above)

```js
class Animal {
  constructor(name) {
    this.speed = 0;
    this.name = name;
  }

  stop() {
    this.speed = 0;
    console.log(`${this.name} stands still.`);
  }
}

class Rabbit extends Animal {
  hide() {
    console.log(`${this.name} hides!`);
  }

  stop() {
    super.stop(); // call parent stop
    this.hide(); // and then hide
  }
}

let rabbit = new Rabbit('White Rabbit');

rabbit.run(5); // White Rabbit runs with speed 5.
rabbit.stop(); // White Rabbit stands still. White Rabbit hides!
```

<details>
  <summary> Overriding constructor</summary>
**`Constructors` in inheriting classes must call `super(...)`, and (!) do it before using this.**

```js
class Animal {
  constructor(name) {
    this.speed = 0;
    this.name = name;
  }

  // ...
}

class Rabbit extends Animal {
  constructor(name, earLength) {
    super(name);
    this.earLength = earLength;
  }

  // ...
}

// now fine
let rabbit = new Rabbit('White Rabbit', 10);
console.log(rabbit.name); // White Rabbit
console.log(rabbit.earLength); // 10
```

</details>
</details>

<details>
  <summary>🔵 2. What are Static methods</summary>

- used when we’d like to store class-level data
- `this` will work inside `static` method only if a `prop` is also `static`

```js
class MyClass {
  static property = ...;

  static method() {
    ...
  }
}
```

</details>

<details>
  <summary>🔵 2. What are Private && Protected methods</summary>

- `#field` is truly private, accessible only within the class.
- `Getters/setters` are the only way to provide controlled access to a private field.
- Child classes do not have access to the parent's private fields.

```js
class CoffeeMachine {
  _waterAmount = 0; // protected property
  #waterHeat = 5; // private property

  constructor(power) {
    this._power = power;
  }
  set waterAmount(value) {
    if (value < 0) {
      value = 0;
    }
    this.#waterAmount = value;
  }

  get waterAmount() {
    return this.#waterAmount;
  }
}

// create the coffee machine
let coffeeMachine = new CoffeeMachine(100);
// add water
coffeeMachine.waterAmount = -10; // _waterAmount will become 0, not -10
```

</details>

<details>
  <summary>🔵 3.  Getters and setters</summary>

- access/control of private fields
- validation of incoming data before recording
- encapsulation - hiding internal implementation
</details>

# 🔴 JS-Core

## Types & coercion

<details>
  <summary>🔵 1. Which data types are in JS?</summary>

- **Primitives**: `number`, `bigint`, `string`, `boolean`, `null`, `undefined`, `symbol`
- **Non-Primitives**: `object`(objects, arrays, functions, maps, sets, etc.)
</details>

<details>
  <summary>🔵 2. Which Data Structures are in JS?</summary>

- `array`, `object`, `Map`, `Set`, `WeakMap/Set` (has no `.size`, not iterable), `ArrayBuffer` for binary data

### What is WeakMap/Set?

**JavaScript has a garbage collector that automatically clears memory for objects that are no longer referenced. WeakMap and WeakSet hold ‘weak’ references, so if an object is not used anywhere else, it can be removed by GC. This is useful for caches or temporary storage.**

| Feature / Structure     | Object                               | Map                   | Set                         |
| ----------------------- | ------------------------------------ | --------------------- | --------------------------- |
| Purpose                 | Key–value storage                    | Key–value storage     | Collection of unique values |
| Key types               | `string` / `symbol`                  | Any type              | N/A                         |
| Key uniqueness          | Yes                                  | Yes                   | Yes (values)                |
| Order guaranteed        | Partial (insertion order with rules) | Yes (insertion order) | Yes (insertion order)       |
| JSON support            | ✅ Native                            | ❌ Needs conversion   | ❌ Needs conversion         |
| Can use objects as keys | ❌                                   | ✅                    | N/A                         |

</details>

<details>
  <summary>🔵 3. Primitives vs Objects</summary>
	
- `primitives` are copied by value
- `objects` are copied by reference
</details>

<details>
  <summary>🔵 4. Falsy values (there are 8)</summary>

```js
false;
0;
-0;
0n;
('');
null;
undefined;
NaN;
```

</details>

<details>
  <summary>🔵 5. `||` vs `??` vs `&&`</summary>

- `||` reacts on falsy value
- `??` reacts on `null` and `undefined`
- `&&` has priority more than `||`

```js
const count = 0;

count || 10; // 10 ❌
count ?? 10; // 0 ✅
(true || false) && false; // false, while parantheses
```

</details>

<details>
  <summary>🔵 6. `==` vs `===`</summary>

- `==` does type coercion

```js
typeof null; // object
null == undefined; // true
```

### Special Cases

```js
NaN === NaN; // false
Number.isNaN(NaN); // true
null === null; // true
null == undefined // true, both treated as “empty” values
{} === {} // false (different references)
arr1 === arr2 // false unless same reference
'2' > 10; // false ("2" → 2)
'20' > '3'; // false (string comparison: "2" < "3")
" \n" == 0 // true, whitespace → "" → 0
[] == "" // true, [] → ""
[1] == 1 // true, [1] → "1" → 1
{} == "[object Object]" // false, object → NaN
JSON.stringify(obj) === JSON.stringify(obj2) // true
Symbol('x') === Symbol('x') // false
```

### + Unary Operator Coercion

```js
+'123'; // 123
+''; // 0
+true; // 1
+false; // 0
+null; // 0
+undefined; // NaN
```

</details>

## Strict mode — use strict

<details>
<summary>1. What is 'use strict'</summary>

`use strict`

- What: strict mode in JS
- Where: `global` / `function` / `modules`
- Why: stricter parsing and error handling on the code at runtime
- **ES modules** are always in 'strict mode'

```js
'use strict';

function test() {
  console.log(this); // undefined
}
test();

const obj = {};
Object.defineProperty(obj, 'x', {
  value: 1,
  writable: false,
});
obj.x = 2; // TypeError

function foo(a, a) {} // SyntaxError
a = 10; // ReferenceError
```

</details>

## Scopes & Hoisting

<details>
<summary>1️⃣. What scopes are in JS? </summary>

- Global
- Function
- Block (`let`, `const`)

</details>

<details>
<summary>2️⃣ What is Lexical scope? </summary>

- `Scope` is determined by where the declaration is in the code, not where the call is made.

```js
const x = 10;

function foo() {
  console.log(x);
}

function bar() {
  const x = 20;
  foo();
}

bar(); // 10
```

</details>

<details>
<summary>3️⃣ What is scope chain? How JS search a variable? </summary>

- First in the current scope, then up the chain to global.

```js
const a = 1;

function test() {
  const b = 2;
  console.log(a);
}

test(); // 1
```

</details>

<details>
<summary>4️⃣ What is Hoisting? Why do `let` and `const` behave differently?</summary>

- Hoisting **variables** (`var`) and function declarations (`foo() {}`) above.
- `let` and `const` are in the Temporal Dead Zone until initialization.

```js
var b;
console.log(b); // undefined
var b = 2;

console.log(a); // ReferenceError
let a = 10;
```

</details>

## Arrays

<details>
<summary>1️⃣. Which methods mutate an array? </summary>

- `push`, `pop`
- `shift`, `unshift`
- `splice`
- `sort`, `reverse`
</details>

<details>
<summary> 2️⃣. How do I copy an array? Shallow && Deep copy </summary>

- Nested objects are copied by reference.!!!

```js

Shallow copy:
- [...arr]
- arr.slice()
- { ...obj }
- Object.assign({}, obj)

Deep copy:
- structuredClone()
- JSON.parse(JSON.stringify()) ❌ limitations

```

</details>

## `this`

<details>
  <summary>🔵 3. `this` Keyword, `bind` / `call`/ `apply`</summary>

| Вызов          | this                   |
| -------------- | ---------------------- |
| `obj.method()` | `obj`                  |
| `fn()`         | `window` / `undefined` |
| `fn.call(obj)` | `obj`                  |
| `new fn()`     | new object             |
| `arrowFn()`    | lexical `this`         |

- In regular functions, `this` depends on how the function is called
- In Arrow Functions, `this` is lexically bound (from outer scope)
- `call` / `apply` / `bind` are used to explicitly set `this`

```js
function greet() {
  return this.name;
}

const user = { name: 'Max' };

greet.call(user, arg1, arg2); // "Max"
greet.apply(user, [arg1, arg2]); // "Max"

greet.bind(user)(); // "Max"
```

**Partial application with `bind`**

```js
function multiply(a, b) {
  return a * b;
}

const double = multiply.bind(null, 2); // first argument of a is 2, b argument will be passed later

console.log(double(5)); // 10
```

**Method borrowing**

```js
const person = {
  name: 'Alice',
  sayHi() {
    return `Hi, I'm ${this.name}`;
  },
};

const robot = { name: 'R2D2' };

// Borrow sayHi from person
console.log(person.sayHi.call(robot));
// "Hi, I'm R2D2"
```

</details>

## Closures

<details>
  <summary>🔵 4. Closures</summary>

- A closure is a `function` that remembers its outer variables, even after the outer function has finished.
- Used for data encapsulation (hiding internal data and exposing only controlled access) and `private` variables

```js
function counter() {
  let count = 0;

  return function () {
    count++;
    return count;
  };
}

const inc = counter();
inc(); // 1
inc(); // 2

function createBankAccount() {
  let balance = 0; // private variable

  return {
    deposit(amount) {
      balance += amount;
    },
    withdraw(amount) {
      if (amount <= balance) {
        balance -= amount;
      }
    },
    getBalance() {
      return balance;
    },
  };
}

const account = createBankAccount();

account.deposit(100);
account.withdraw(30);

console.log(account.getBalance()); // 70
```

**Fix the var scope problem**

```js
for (var i = 0; i < 3; i++) {
  setTimeout(() => console.log(i), 100); // 3 3 3
}

// solution 1, IIFE to create a new scope
// solution 2, pass 3rd argument as a new variable each call
```

</details>

## Async / Event Loop

## Pure function:

- same input → same output
- no side effects

Not pure:

- mutation
- external state
- randomness

```js
function updateUser(user) {
  return {
    ...user,
    age: user.age + 1,
  };
}
```

# 🟡 Nice

## Objects (Deep vs Shallow Copy — Object.assign, spread, structuredClone)

## Modules

## Errors (Error Handling Patterns — try/catch, Promise.catch, async/await)

# 🟢 Bonus

## Symbols

<details>
<summary>1. What is Symbol?</summary>

- `Symbol` is a unique and immutable primitive (used as a property key or for special metadata)

```js
const sym1 = Symbol('id');
const sym2 = Symbol('id');

console.log(sym1 === sym2); // false

const id = Symbol('id');
const user = {
  name: 'Max',
  [id]: 123,
};

console.log(user[id]); // 123
console.log(Object.keys(user)); // ['name'] — Symbol не виден

// How to get a Symbol key?

Object.getOwnPropertySymbols(user); // [Symbol(id)]
Reflect.ownKeys(user); // ['name', Symbol(id)]
```

</details>

## Memory

<details>
<summary>Q1: How is memory managed in JavaScript?</summary>
A: JS uses automatic garbage collection. Memory is shared for primitives (stack) and objects/arrays/functions (heap). Unreachable objects are cleaned up by the GC.
</details>

<details>
<summary>Q2: What causes memory leaks in JavaScript?</summary>

- Unreleased global variables
- Closures holding large objects
- Unremoved `event listeners` or `timers`

</details>
<details>
<summary>Q3: What is a WeakMap / WeakSet?</summary>

A: Collections with weak references. Objects referenced inside a WeakMap/WeakSet do not prevent garbage collection. Useful for caches or temporary metadata.

</details>
<details>
<summary>Q4: How can you prevent memory leaks?</summary>

- Remove unused references
- Clear timers (clearInterval) and event listeners
- Use WeakMap / WeakSet for temporary associations
- Avoid unnecessary global variables

</details>

# 🔵 Specific

- Common Patterns — debounce/throttle, pub-sub, factory, singleton
- Testing Basics — jest, describe/it, mock/stub
- Security Basics — XSS, CSRF, CORS (если фронт затрагивается)
- JSON methods — JSON.stringify, JSON.parse, edge cases
- Set/Map vs Object — когда использовать, особенности
- DevTools & Debugging — как искать баги, профилировать
