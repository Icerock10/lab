# Two pointers

## Concept:

```
left →      ← right
```

- Two pointers toward each other:
  - The two pointers meet towards the center, reducing the search space.
  - Used when you need to compare elements from both ends.

```js
let left = 0;
let right = arr.length - 1;

while (left < right) {
  // process arr[left] and arr[right]

  if (/* move left */) left++;
  else right--;
}
```

- Two pointers in the same direction
  - `right` reads, `left` writes. Used for filtering, removing duplicates, and partitioning.

```js
let left = 0;

for (let right = 0; right < arr.length; right++) {
  if (/* valid element */) {
    arr[left] = arr[right];
    left++;
  }
}
```
