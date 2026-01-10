# JavaScript Array Methods (Algorithm Essentials)

## A compact reference of the most useful array operations for solving algorithmic problems in JavaScript.

## Creation

```js
[]; // empty array
[(1, 2, 3)]; // literal
Array(n).fill(value); // create filled array
Array.from(iterable); // convert iterable to array
Array.isArray(x); // check if value is array [];
```

## Access & Basics

```js
array.length; // get array length
array[i]; // access element by index
array.at(i); // access with negative indexes allowed
```

## Adding & Removing Elements

```js
array.push(x); // add to end
array.pop(); // remove from end

array.unshift(x); // add to start
array.shift(); // remove from start
```

## Slicing & Copying

```js
array.slice(start, end)   // copy portion (non-destructive)
array.concat(otherArray)  // merge arrays
[...array]                // spread: shallow copy
```

## Searching

```js
array.indexOf(x); // find index or -1
array.includes(x); // check existence
array.find(fn); // find element by condition
array.findIndex(fn); // find index by condition
```

## Transformations

```js
array.map(fn); // transform each element
array.filter(fn); // keep elements that match condition
array.reduce(fn, acc); // accumulate into a single value
array.flatMap(fn); // map + flatten one level
array.reverse(); // reverse array (mutates)
array.sort(fn); // sort array (mutates)

array.flat(depth); // flatten nested arrays (default depth = 1)

[1, [2, 3]].flat(); // [1, 2, 3]
[1, [2, [3]]].flat(2); // [1, 2, 3]
[1, [2, [3]]].flat(Infinity); // full flatten
```

## Checks (Boolean Methods)

```js
array.some(fn); // true if at least one element matches
array.every(fn); // true if all elements match
```

## Iteration

```js
for (let i = 0; i < array.length; i++) {
  array[i]; // classic loop
}

for (const item of array) {
  item; // clean iteration
}

for (const [index, value] of array.entries()) {
  // index — строка, value — элемент
}

array.forEach((item) => {
  item; // callback iteration
});
```

## Modifying In‑Place

```js
array.splice(start, deleteCount, ...items); // remove/insert elements

arr[i] = arr[j];
```

## Converting Between Strings & Arrays

```js
string.split(delimiter); // string → array
array.join(delimiter); // array → string
```
