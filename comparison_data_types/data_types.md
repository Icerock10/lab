## JavaScript Data Types & Data Structures

### Primitive Types (7)

| Type      | Example       | Description                     |
| --------- | ------------- | ------------------------------- |
| number    | 42, 3.14, NaN | double‑precision floating point |
| bigint    | 10n           | arbitrary‑precision integer     |
| string    | "hello"       | immutable text                  |
| boolean   | true / false  | logical values                  |
| null      | null          | intentional empty value         |
| undefined | undefined     | uninitialized / missing value   |
| symbol    | Symbol("id")  | unique identifier               |

### Reference Types (Objects)

| Type     | Example       | Description                   |
| -------- | ------------- | ----------------------------- |
| object   | { a: 1 }      | key–value pairs               |
| array    | [1, 2, 3]     | ordered list (object subtype) |
| function | function() {} | callable object               |
| date     | new Date()    | time object                   |
| regexp   | /abc/         | regular expression            |
| error    | new Error()   | error object                  |

### Data Structures (Built‑in)

| Structure   | Example               | Description                             |
| ----------- | --------------------- | --------------------------------------- |
| Map         | new Map()             | key → value with any key type           |
| Set         | new Set()             | unique values                           |
| WeakMap     | new WeakMap()         | keys must be objects, weak references   |
| WeakSet     | new WeakSet()         | values must be objects, weak references |
| ArrayBuffer | new ArrayBuffer(8)    | raw binary data                         |
| TypedArray  | new Uint8Array([1,2]) | typed binary arrays                     |

### Special Values

| Value     | Type   | Description                        |
| --------- | ------ | ---------------------------------- |
| NaN       | number | “Not a Number”, but type is number |
| Infinity  | number | positive infinity                  |
| -Infinity | number | negative infinity                  |
| -0        | number | negative zero (rare edge case)     |

### typeof Results (Quick Reference)

| Expression          | typeof result     |
| ------------------- | ----------------- |
| typeof 123          | "number"          |
| typeof 10n          | "bigint"          |
| typeof "hi"         | "string"          |
| typeof true         | "boolean"         |
| typeof undefined    | "undefined"       |
| typeof null         | "object" (JS bug) |
| typeof {}           | "object"          |
| typeof []           | "object"          |
| typeof function(){} | "function"        |
| typeof Symbol()     | "symbol"          |
