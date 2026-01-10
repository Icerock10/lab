# Binary Search - `O(log n)`

## Concept:

## Goal: Find an element or boundary in a sorted array.

```
left →   mid   ← right
```

- We are using `3` pointers **`left = 0, right = array.length - 1, mid = Math.floor((right + left) / 2)`**
- Commonly used with a **`while`** or **`for(; condition ;)`** loop where **`left < right or <=`**).
- We divide each step in half, choose the left or right half
- Works only for sorted arrays

```js
const binarySearch = (nums, target) => {
  let left = 0;
  let right = nums.length - 1;
  while (left <= right) {
    let mid = Math.floor((left + right) / 2);
  }
};
```

## Condition examples:

`nums[mid] === target` → found

`nums[mid] < target` → searching at right side → `left = mid + 1`

`nums[mid] > target` → searching at left side → `right = mid - 1`
