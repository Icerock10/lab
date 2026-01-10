# Comparison in JavaScript (Algorithm Essentials)

## Equality Operators

```js
==   // loose equality (allows type coercion)
===  // strict equality (no coercion)

```

## Strict Equality (===)

```js
1 === '1'; // false
0 === false; // false
null === null; // true
NaN === NaN; // false (!)
```

## Special Cases

```js
NaN === NaN; // false
Number.isNaN(NaN); // true
```

## Object Comparison

```js
{} === {} // false (different references)
arr1 === arr2 // false unless same reference
```

## + Unary Operator Coercion

```js
+'123'; // 123
+''; // 0
+true; // 1
+false; // 0
+null; // 0
+undefined; // NaN
```

## Boolean Coercion (truthy / falsy)

### Falsy values:

```js
false
0
-0
0n
""
null
undefined
NaN

Everything else → truthy.
```

## Comparison with <, > (string vs number)

```js
'2' > 10; // false ("2" → 2)
'20' > '3'; // false (string comparison: "2" < "3")
```

## Loose Equality (==) — Tricky Cases

## Loose Equality (==) Tricky Cases

| Expression              | Result | Explanation                    |
| ----------------------- | ------ | ------------------------------ |
| null == undefined       | true   | both treated as “empty” values |
| null === undefined      | false  | different types                |
| 0 == false              | true   | false → 0                      |
| 0 === false             | false  | number vs boolean              |
| "" == false             | true   | "" → 0, false → 0              |
| "" === false            | false  | string vs boolean              |
| "0" == false            | true   | "0" → 0                        |
| "0" === false           | false  | string vs boolean              |
| " \n" == 0              | true   | whitespace → "" → 0            |
| [] == ""                | true   | [] → ""                        |
| [] == 0                 | true   | [] → "" → 0                    |
| [1] == 1                | true   | [1] → "1" → 1                  |
| [1,2] == "1,2"          | true   | array → string                 |
| {} == "[object Object]" | false  | object → NaN                   |
| {} == {}                | false  | different references           |
