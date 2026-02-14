# Understanding `this` in JavaScript

## `this` **is not determined by the place of declaration**, but depends on the **call context** of the function.

## 1. Global Context

- **In Browser**: `this === window`
- **In Node JS**: `this === global` (outside of modules)

```js
console.log(this); // window (browser)
```

## Simple call → undefined (strict mode) / window (non‑strict)

```js
function f() {
  console.log(this);
}
f(); // undefined (strict)
```

## Method call

```js
const obj = {
  x: 10,
  getX() {
    console.log(this.x);
  },
};
obj.getX(); // 10
```

## 3. Arrow Functions

### Do not have own `this`, getting from lexical environment.

```js
const obj = {
  x: 10,
  f: () => console.log(this.x),
};
obj.f(); // undefined (this = global)
```

## 4. Constructors (new)

### When called via new, `this` points to this new object.

```js
function User(name) {
  this.name = name;
}
const u = new User('Alex');
```

## 5. Explicit Binding: `call`, `apply`, `bind`

```js
fn.call(obj, arg1, arg2); // call with a specific this
fn.apply(obj, [arg1, arg2]); // same, but `args` as array
const f = fn.bind(obj); // return a new function with a fixed this
```

## 6. `this` in Classes

### In class methods, `this` points to an instance. But when passing the method as a `callback` — it is lost.

```js
class A {
  m() {
    console.log(this);
  }
}
const a = new A();
setTimeout(a.m, 100); // undefined

//fix

setTimeout(a.m.bind(a), 100); || m = () => { console.log(this) }

```

## 7. Event Listeners (Browser)

### `this` points to the DOM element on which the handler is hanging.

```js
button.addEventListener('click', function () {
  console.log(this); // button

  button.addEventListener('click', () => {
    console.log(this); // external context
  });
});
```
