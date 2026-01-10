# Stack - `O(1)`

## Concept:

- A stack is a linear data structure that follows the LIFO principle (Last In, First Out).
- You only interact with the top of the stack.
- Common operations:

`push(x)` → add element to the top

`pop()` → remove and return the top element

`peek()` → top() → read the top element without removing → `stack[stack.length - 1];`

`isEmpty()` → check if stack has no elements → `stack.length === 0;`

```js
const stack = [];

for (let i = 0; i < input.length; i++) {
  const char = input[i];

  if (/_ condition to push _/) {
    stack.push(char);
  } else {
    // condition to pop
    stack.pop();
  }
}

// final result often depends on stack content
return stack;
```

## When to Use a Stack

- When you need to process elements in reverse order

- When the problem involves matching pairs (brackets, tags, paths)

- When you need to remember previous states

- When recursion is too deep → convert to iterative + stack
