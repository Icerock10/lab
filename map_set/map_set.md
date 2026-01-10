# JavaScript Set (Algorithm Essentials)

## Creation

```js
new Set(); // empty set
new Set([1, 2, 3]); // from array
```

## Operations

```js
set.add(x); // add value
set.delete(x); // remove value
set.has(x); // check existence
set.size; // number of elements
set.clear(); // remove all
```

## Iteration

```js
for (const value of set) {
  value;
}
```

## Use Cases in Algorithms

```js
// unique values
new Set(arr);

// visited nodes
visited.add(node);

// fast membership check
if (set.has(x)) {
}
```

## Map vs Set

| Feature           | Map                                   | Set                           |
| ----------------- | ------------------------------------- | ----------------------------- |
| Purpose           | store **key → value** pairs           | store **unique values**       |
| Key types         | any type (objects, arrays, functions) | no keys, only values          |
| Value uniqueness  | keys must be unique                   | all values must be unique     |
| Access            | map.get(key)                          | set.has(value)                |
| Insertion         | map.set(key, value)                   | set.add(value)                |
| Deletion          | map.delete(key)                       | set.delete(value)             |
| Iteration         | for (const [k, v] of map)             | for (const v of set)          |
| Typical use cases | caches, memoization, adjacency lists  | unique tracking, visited sets |

# JavaScript Map (Algorithm Essentials)

## Creation

```js
new Map(); // empty map
new Map([['a', 1]]); // from entries
```

## Operations

```js
map.set(key, value); // add/update
map.get(key); // read
map.has(key); // check
map.delete(key); // remove
map.size; // number of entries
map.clear(); // remove all
```

## Iteration

```js
for (const [key, value] of map) {
  key;
  value;
}

map.keys(); // iterator of keys
map.values(); // iterator of values
map.entries(); // iterator of [key, value]
```

## Use Cases in Algorithms

```js
// adjacency list
const graph = new Map();
graph.set(node, []);

// memoization
const memo = new Map();
if (memo.has(n)) return memo.get(n);
```
