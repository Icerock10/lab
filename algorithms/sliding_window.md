# Sliding Window `O(n)`

## Concept:

- Find something in each window of length `pattern.length`.
- The window expands or shrinks depending on the problem.
- A window is defined by two pointers:
  - `left` — start of the window (_fixed sliding window_)
  - `right` — end of the window (_dynamic sliding window_)

| Window Type | When to Use                         | Core Idea                      |
| ----------- | ----------------------------------- | ------------------------------ |
| Fixed-size  | when window size = `pattern.length` | window always `pattern.length` |
| Dynamic     | when window depends on a condition  | expand → shrink                |

## Fixed Sliding Window

```
[left ... right] → | left and right move in the same direction
```

### find substring, find anagram window, compare windows of equal length.

```js
const findSubstring = (s, pattern) => {
  const patternLength = pattern.length;

  for (let left = 0; left <= s.length - patternLength; left++) {
    const right = left + patternLength;
    const window = s.slice(left, right);

    if (window === pattern) {
      return left; // match found
    }
  }

  return -1; // no match
};
```

## Dynamic Sliding Window

```
right → expands | moves straight
--------------------------------------------------
left → shrinks | moves only when the window "breaks"
```

### Find the longest/shortest substring where the condition is met.

```js
let left = 0;

for (let right = 0; right < arr.length; right++) {
  // expand window with arr[right]

  while (/* window is invalid */) {
    left++; // shrink window until valid
  }

  // window is valid here
  // update result if needed
}

```

- `right` always moves forward
- If the window has become “bad” → squeeze the `left` key
- when it's "good" again → update the result
