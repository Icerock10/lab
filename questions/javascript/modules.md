# JavaScript Modules: ESM vs CommonJS

## What Are Modules?

Modules allow you to split code into separate files and control what is **public** (exported) and what is **private** (kept inside the file).  
JavaScript supports two major module systems:

- **ESM (ECMAScript Modules)** — modern standard (`import` / `export`)
- **CommonJS (CJS)** — older Node.js module system (`require` / `module.exports`)

---

# ESM (ECMAScript Modules)

## Syntax

### Named exports

```js
export { a, b };
export { a as c };
export default function greet() {} // ⚠️ only one export per module
export * from './file.js'; //exports all named imports without default
export const value = 10;

import { a } from './file.js';
import { a as b } from './file.js';
import defaultExport from './file.js';
import * as ns from './file.js'; // 📌 Imports all named exports as an object
import './file.js';
```

## Dynamic import

```js
const module = await import('./module.js');
import('./module.js').then((mod) => mod.value);
```

## Importing

```js
import { value, greet } from './module.js';
import myDefault from './module.js';
```

## Mixed imports

```js
import myDefault, { value } from './module.js';
```

## Characteristics of `ESM`

- Static imports (resolved at compile time)
- Top‑level import / export only
- Supports tree‑shaking
- Asynchronous loading in browsers
- Native support in modern browsers

  In Node.js, requires:

- `"type": "module"` in `package.json`, or `.mjs` file extension

# CommonJS (CJS)

## Exporting

```js
module.exports = {
  value: 10,
  greet() {},
};

or;

exports.value = 10;
```

## Importing

```js
const { value, greet } = require('./module');
```

## Characteristics of CJS

- Dynamic imports (resolved at runtime)
- Synchronous loading
- Default in Node.js (without ESM mode)
- Does not support tree‑shaking
- Not supported natively in browsers

# How Modules Work in Browsers

## ESM is supported natively:

```html
<script type="module" src="app.js"></script>
```

Browser behavior:

- Loads modules asynchronously
- Uses strict mode automatically
- Resolves imports relative to the file
- Each module has its own scope

```js
// app.js
import { greet } from './utils.js';
greet();
```

# How Modules Work in `Node.js`

## CommonJS (default)

```js
const utils = require('./utils');
```

### Node loads modules synchronously and wraps each file in a function:

```js
(function (exports, require, module, __filename, __dirname) {
  // module code
});
```

# `ESM` in `Node.js`

```js
{
  "type": "module"
}

or

import { greet } from "./utils.mjs"; // .mjs extension
```
