# JavaScript Objects (Algorithm Essentials)

## Creation

```js
{}                     // empty object
{ a: 1, b: 2 }         // literal
Object.create(null)    // object without prototype

```

## Access & Basics

```js
obj.key; // access property
obj['key']; // access with string key
obj[keyVar]; // dynamic key
```

## Adding & Removing

```js
obj.newKey = value; // add/update
delete obj.key; // remove
```

## Checking Keys

```js
'key' in obj; // check existence
obj.hasOwnProperty('k'); // own key only
```

## Iteration

```js
for (const key in obj) {
  obj[key]; // iterate keys
}

Object.keys(obj); // array of keys
Object.values(obj); // array of values
Object.entries(obj); // array of [key, value]
```

## Copying

```js
{ ...obj }                 // shallow copy
Object.assign({}, obj);   // shallow copy

```

## Useful Algorithm Patterns

```js
// frequency map
const freq = {};
for (const char of str) freq[char] = (freq[char] || 0) + 1;

// grouping
const groups = {};
for (const item of arr) {
  const key = item.type;
  (groups[key] ||= []).push(item);
}
```
