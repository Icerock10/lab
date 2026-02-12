# HTML

## Semantic tags:

```html
<header> | <footer> | <nav> | <aside> (sidebar) | <main> | <section> | <article>

<details> <summary> </details> | <figure> <figcaption> </figure>

<fieldset> <legend> </fieldset> | <dialog> (modal)

<address> (contact details) | <blockquote> (citation) | <time datetime="2025-02-05">05 February</time>
```

## HTML Attributes:

`[disabled]` vs `[readonly]`:

```CSS
readonly - only for text fields => can't be edited => the value will be sent in the form

disabled - completely disabled from the interface => value WON"T be sent in the form => no focus

```

`[data-*]`

```html
<div data-user-id="123"></div>
element.dataset.userId;
```

`[aria-*]`:

```CSS
aria-label="name" /*  —> text description of the element */
aria-hidden="true" /* —> hide from screen reader */
aria-expanded="true/false" /* —> isOpened dropdown*/
aria-checked="true/false" /* —> custom checkbox state*/
aria-disabled="true" /* —> "logically" locked*/
aria-controls="menu" /* —> controls another element*/

```

`[role="button | checkbox | progressbar"]`:

```CSS
<div role="button" tabindex="0" aria-pressed="false">
/* If there is native HTML (<button>, <input type="checkbox">) → role is not needed */
```

`[tabIndex]`

```html
<div tabindex="0 | 1+ | -1"></div>
<!-- 
 0 → receives focus in the normal order
-1 → can only be focused via JS
1+ → manual order
 -->
```

`<input>`

```CSS
<label for="id_input">Input label</label> /* binds to input */
<input
  type="text | range | search | checkbox | number | password"
  id="username"
  name="username"
  title="Only letters and numbers"
  class=""
  value=""
  placeholder=""
  minlength="3"
  maxlength="20"
  autocomplete="on" /* autofill of the input */
  autofocus
  pattern="[A-Za-z0-9]+"
  size="30" /*defines the width of the <input> and the height of the <select>*/
  multiple /* multiple values can be chosen, only for type="file", type="email", <select> */
  required
  disabled
  readonly
  checked
  data-test="example"
>

<input type="range" min="0" max="100" step="10"> /* 0 → 10 → 20 → 30 → 40 */

```

`<button>`

```CSS
<button
type="button | submit | reset" /* type="submit" by default */
disabled
name=""
value=""
>
```

`<img>`

```CSS
<img
src="elva-fairy-800w.jpg"
alt="Elva dressed" /* for Accessibility */
srcset="elva-480w.jpg 480w, elva-800w.jpg 800w"
sizes="(width <= 600px) 480px,800px"
width=""
height=""
loading="lazy"
```

`<a>`

```CSS
<a
href=""
target="_blank" /* open in a new tab */
rel="noopener"
download
```

`<form>`

```CSS
<form
action="url"
method="GET | POST"
enctype="multipart/form-data" /* for files upload */
/>
```

`<script>`

```CSS
<script
src="url"
defer /* after the DOM is loaded */
async /* parallel loading */
type="module"/>
```

`<select>`

```CSS
<select name="" multiple disabled>
  <option value="1" selected>One</option>
</select>
```

## Accessibility (All2) — Quick Overview

| User Group                           | Key Mechanisms            | Important Attributes                            |
| ------------------------------------ | ------------------------- | ----------------------------------------------- |
| Physical disabilities                | Keyboard navigation       | `tabindex`, `disabled`, `aria-disabled`         |
| Visual disabilities (screen readers) | Screen reader             | `aria-*`, `role`, `alt`, `aria-hidden`          |
| Color / perception issues            | Contrast & visible labels | `alt`, visible text labels, sufficient contrast |

# CSS

## `::pseudoelements`:

| Pseudo-element   | What it means                                       |
| ---------------- | --------------------------------------------------- |
| `::before`       | Inserts content before element (requires `content`) |
| `::after`        | Inserts content after element (requires `content`)  |
| `::first-line`   | Styles first line of text block                     |
| `::first-letter` | Styles first letter of text block                   |
| `::selection`    | Styles highlighted/selected text                    |
| `::placeholder`  | Styles placeholder text in inputs                   |
| `::marker`       | Styles list item markers (`<li>`, `<summary>`)      |
| `::backdrop`     | Styles backdrop behind modal/fullscreen             |
| `::scroll-thumb` | Styles scrollbar thumb                              |
| `::scroll-track` | Styles scrollbar track                              |

## `:pseudoclasses`:

#### Inputs (`input`, `textarea`, `select`)

| Pseudo-class         | What it means                              |
| -------------------- | ------------------------------------------ |
| `:focus`             | Element has focus (clicked or tabbed into) |
| `:focus-visible`     | Focus visible via keyboard navigation      |
| `:active`            | Being clicked                              |
| `:disabled`          | Has `disabled` attribute                   |
| `:enabled`           | Not disabled                               |
| `:read-only`         | Has `readonly`                             |
| `:read-write`        | Editable field                             |
| `:required`          | Has `required`                             |
| `:optional`          | Not required                               |
| `:valid`             | Passes validation                          |
| `:invalid`           | Fails validation                           |
| `:in-range`          | Value within `min/max`                     |
| `:out-of-range`      | Value outside `min/max`                    |
| `:checked`           | Checked (checkbox/radio)                   |
| `:placeholder-shown` | Placeholder visible (empty input)          |
| `:autofill`          | Autofilled by browser                      |

#### Buttons (`button`, `input[type="button|submit"]`)

| Pseudo-class     | What it means       |
| ---------------- | ------------------- |
| `:active`        | While clicking      |
| `:focus`         | Has focus           |
| `:focus-visible` | Focus from keyboard |
| `:disabled`      | Disabled button     |
| `:enabled`       | Active button       |

#### Generic elements

| Pseudo-class                   | What it means                                             |
| ------------------------------ | --------------------------------------------------------- |
| `:first-child`                 | First child in parent                                     |
| `:last-child`                  | Last child in parent                                      |
| `:nth-child(n)`                | Specific child index                                      |
| `:not(selector)`               | Exclude elements                                          |
| `:has(selector)`               | Allows to select an element that has something inside it. |
| `:is(selector1, selector2)`    | apply styles to all elements inside group                 |
| `:where(selector1, selector2)` | the same as `:is` but without `specificity = 0`           |
| `:empty`                       | No children/text inside                                   |

## CSS-selectors

[Open PDF](./css-selector.pdf)

## `Grid` - **two dimensional axis**

`Parent props`

```CSS
grid-template-columns: 200px 1fr; /* defines width of columns */
grid-template-rows: 1fr; /* defines height of rows */
grid: rows / columns; /* shorthand */
grid-template-areas:
"header header"
    "sidebar main"
    "footer footer";
/* names grid areas for easier placement */
gap / row-gap / column-gap: 1rem;  /* spacing between grid items*/
grid-auto-rows / columns: min-content / auto;
grid-auto-flow: row, column, dense; /* automatic placement*/
place-items <align-items> | <justify-items>: start, end, stretch;
 /* vertically + horizontally - (for items inside their cells) */
place-content <align-content> | <justify-content>: center;
```

`Child props`

```CSS
grid-column <start> | <end>: 1 / span 3;
/* defines the start/end of col, span - current pos */
place-self <align-self> | <justify-self>: start, center, stretch;
                ↑            ↑
/*           vertical    horizontal  */
grid-column-end: 3;

grid-area: header;

order: 1;

grid-area: 1 / 2 / 3 / 4;
/* row-start / col-start / row-end / col-end */
```

`Examples`

```CSS

repeat(count, track-size); /* repeats func */
repeat(auto-fill/auto-fit, 200px); /* auto-fill auto-fit 1st argument (count) */

/* auto-fill → creates empty tracks, cells have same size (wont expand) */
/* auto-fit → cells will be expanded to a full width */

minmax(min, max); auto / 1fr / min-content / max-content; /* The size cannot be less than min and greater than max. */
fit-content(200px);  /* Fit content to its size with max limit */
order: -1; /* moves item to start */
grid-template-rows: auto 1fr auto; /* Create asymmetric layouts easily */
grid-template-columns: repeat(3, 150px) 1fr;  /* last col take remaining space */

```

## `Flex` - **one dimensional axis**

`Parent props`

```CSS
flex-flow <flex-direction> | <flex-wrap>: row wrap;
justify-content: flex-start | center | space-around; /* Align items horizontal */
align-items: baseline | center | flex-start | stretch; /* Align items vertically */
align-content: flex-start | center | space-between; /* Align multiple lines (only works with flex-wrap) */
column-gap: 30px;
```

`Child props`

```CSS
flex <flex-grow> | <flex-shrink> | <flex-basis> : 0 1 auto;
align-self: flex-start | center | baseline | stretch; /* Override parent's align-items for single item */
margin-left: auto /* push item to the right */
margin: auto; /* center item in all directions */
order: -1; /* move earlier */
```

`Flex Examples`:

```CSS
/* Create flex grid alternative */
.parent {
display: flex;
flex-wrap: wrap;
gap: 20px;
}
.child {
flex: 1 1 calc(33.333% - 20px);
} /* 3 cols with gap or with px */


/* Holy Grail layout with flex */
.container {
display: flex;
flex-direction: column;
min-height: 100vh;
}
.header,
.footer { flex-shrink: 0; }
.main { flex: 1; } /* takes remaining space */

```

## Responsive

`Relative units:`

```CSS
width: 100%; /* percentage of parent */
width: 50vw; /* 50% of viewport width */
width: 50vh; /* 50% of viewport height */
padding: 2em; /* relative to font-size */
padding: 2rem; /* relative to root font-size */
```

`Container-responsive:`

```CSS

/* Prevent too wide on large screens */
.container {
	width: 100%;
  max-width: 1200px;
  margin: 0 auto;
}
/* Prevent too small on small screens */
.container {
	width: 100%;
  min-width: 300px;
}

```

`Common breakpoints:`

```
sm: 640px
md: 768px
lg: 1024px;
xl: 1280
2xl: 1536px
```

`Image-responsive:`

```CSS
/* Scale with parent */
img {
	width: 100%;
  height: auto;
}

/* Responsive background image */
background-image: url('small.jpg');
background-size: cover;
background-position: center;

@media (min-width: 1024px) {
	background-image: url('large.jpg');
}

/* Picture element (HTML) */
<picture>
  <source media="(min-width: 1024px)" srcset="large.jpg">
  <source media="(min-width: 768px)" srcset="medium.jpg">
  <img src="small.jpg" alt="">
</picture>
```

`Clamp() calc():`

```CSS

/* common patterns with clamp + calc */
clamp(min, preferred, max)

width: calc(100% - 2rem); //-1 rem from left and right
min-height: calc(100vh - 80px); //height - header
---------------------------------------------------
font-size: clamp(1.8rem, 1.5vw, 3.5rem);

font-size: clamp(1rem, 2.5vw, 3rem);
/* min 1rem, grows with 2.5% of vw, max 3rem */

/* Dynamic sizing */
width: clapm(300px, 95vw, 1200px);

```

## Animations

`<transition>`

**What can be animated?:**

- `opacity | transform | width/height | margin/padding | color | border-radius | filter | SVG | scroll`

```CSS

transition <property> | <duration> | <timing-function> | <delay>: margin-right 4s ease-in-out 1s;
transition-timing-function: linear, steps(4, jump), cubic-bezier /* ease sets up by default */

transition-behavior: allow-discrete; /* Transitions for discrete animated properties.
 (display, visibility, content: "", overflow, position ), will work only for outer animation */

 will-change: transform, background-color;  /* property to prevent repaint */

```

**transition triggers**:

```html
- pseudo-classes (:hover, :active, :focus, :checked, ...)` - class changes (JS / frameworks)` -
media queries` - attribute changes ( input[aria-invalid="true"] )` - pseudo-elements (::before /
::after)`
```

```html
- transition runs when computed value of property changes - transition is applied on state CHANGE
(:hover, :active), not on the state itself
```

---

`<transform>`: 📌 **Transform functions are applied from left to right,each one to a transformed system**

**What for?**:

- `hover`
- `open / close`
- `show / hide`
- `simple UI`

```CSS
transform <translate(px | %)> | <skew(deg)> | <scale(number)> | <rotate(deg, rad, turn);

translate <X> | <Y> | <Z>: 5px 5px 30px;

transform: translateX(10px) rotate(10deg) translateY(5px);/* Multiple function values */

transform-origin <x-offset> <y-offset> <z-offset>: bottom right 60px;  /* sets the origin for transformations. */

/* performance */
transform | opacity; /* GPU */
will-change: transform;
top | left | width | height | margin; /* layout / paint heavy */

```

**`@keyframes`:**

```html
- animation on :hover is removed immediately on hover out - animation cannot animate exit state -
use transition for hover in/out - use classes + animation for enter/leave
```

---

```CSS
@keyframes animation-name {
  from {
    transform: translateX(0%);
    animation-timing-function: ease-out;
  }

  to {
    transform: translateX(100%);
    animation-timing-function: ease-in;
  }
}

@keyframes animation-name {
0% {}
50%{}
100%{}
 }

/* fill-mode */
forwards | backwards | both;

/* direction */
normal | reverse | alternate;

/* animation itself */

animation: <name> | <duration> | <timing-function> | <delay> | <iteration-count>
<direction> | <fill-mode> | <play-state>

.element {
  animation: animation-name 3s linear 1s infinite alternate both;
 }

```

# JS-Core

## Async

### `<Promises>`: `pending` | `fulfilled` | `rejected`

```js
const promise = new Promise((resolve, reject) => resolve(any));
// resolve(value) -> fulfilled | reject(error) -> rejected

promise
  .then((res) => {}) // Response<type, status>
  .catch((error) => {})
  .finally(() => {}); // finally for side effects | does not receive data | doesn't break the chain

try {
} catch (error) {
} finally {
}
```

### `Promise API`:

```js
// all or nothing, ❌ rejects if any fails
Promise.all([promise1, promise2]); // -> [Response, Response]` | needs 'await'

// show everything, ✅ never rejects
Promise.allSettled([p1, p2]); // -> [{status: 'fulfilled', value: Response}]

// fastest wins (resolve or reject)
Promise.race([p1, p2]); // -> Response<type, status>

// first success, ❌ rejects only if all reject
Promise.any([p1, p2]); // -> Response<type, status>
```

---

### 📦 Micro/Macrotasks:

| MacroTasks                 | MicroTasks          |
| -------------------------- | ------------------- |
| `setTimeout()`             | `Promise.then()`    |
| `setInterval()`            | `Promise.catch()`   |
| `setImmediate() (Node.js)` | `Promise.finally()` |
| `DOM events`               | `queueMicrotask()`  |

`Microtask queue (runs before macroTasks)`:

```js
console.log(1);
Promise.resolve().then(() => console.log(2));
setTimeout(() => console.log(3));
console.log(4);

// 1 4 2 3
```

## DOM

### DOM patterns:

```js
const DOM = {
  myButton: document.querySelector('.btn'),
  input: document.querySelector('.input'),
};

DOM.myButton = document.createElement({ tagName: 'div' });
```

### DOM traversal:

- `closest()` -> **search to `BOTTOM` (finds the first matching child element within the current node.)**
- `querySelector()` -> **search to `TOP` (going through the parents until it finds an element that matches the selector.)**
- `matches()` -> **show `current Element` (gets element itself)**

```js
const itemById = document.getElementById('myId'); // HTMLParagraphElement
const itemBySelector = document.querySelector(selector); // selector: "tag" | ".myClass" | "#id"
const itemsBySelector = document.querySelectorAll('form, form .input'); // Nodelist
const getClosest = element.closest(selector); // "[data-role='modal']" | "ul > li.active" | "#id"
const getMatched = element.matches(selector);

// Access

element.parentNode; // HTMLDivElement
element.children; // HTMLCollection live {}
element.childNodes; // NodeList
element.firstElementChild; // HTMLDivElement
element.nextElementSibling; // HTMLDivElement
```

### Change of content:

```js
const element = document.createElement('div');
element.textContent = 'text'; // Set text content
element.innerHTML = '<b>HTML</b>'; // Set inner HTML, updates DOM
```

### Modify:

```js
// Class changes
element.classList.remove('class'); // Remove class
element.classList.toggle('class'); // Toggle class
element.classList.contains('class'); // check existence

// get/set Attribute

element.getAttribute('attr-name');
element.setAttribute('attr-name', 'value');

// Append/Remove elems
element.remove(); // Remove element from DOM
element.appendChild(element); // adds element
element.append / prepend(childElem, 'text'); //Append multiple elements or text
```

### **addEventListener**(`type`, `listener`, `options`):

**Event Flow (3 phases):**

- `1. Capturing (from top to bot)` ↓
- `2. Target (on the element)` ●
- `3. Bubbling (from bot to top)` ↑

---

- **type**: `click` | `change` | `input`(insta value track) | `animationend` (lets animation run)
- **options**: `once: true` (cleans listener) | `capture: boolean`

```js
element.addEventListener('click', callback, false); // ✅ bubbling (default)
element.addEventListener('change', callback, true); // ✅ capturing
element.addEventListener('animationend', callback, { once: true, capture: false }); // once runs function only once
```

---

**Event delegation (one listener per container):**

```js
container.addEventListener('click', (e) => {
  if (e.target.matches('button')) {
    handler();
  }
  if (e.target.tagName === 'BUTTON') {
    handler();
  }
});
```

## Arrays

### `Create`:

```js
// create with indexes
[...Array(3).keys()]; // [0, 1, 2]
// empty array with undefineds, we can insert into fill('')
Array(3).fill(); // [undefined, undefined, undefined]
```

### `Searching`:

```js
// returns the first element in the array that satisfies testing function or undefined
[2, 12].find((el) => el > 10); // → 12

// returns the index of first element in the array that satisfies testing function or -1
[2, 12].findIndex((el) => el > 10); // → 1 (index)

// returns the first index at which a given element can be found in the array, or -1
['first', 'second'].indexOf('first'); // → 0 (index)
// determines whether an array includes a certain value among its entries, returning true or false as appropriate.

['first', 'second'].includes('none'); // → false
```

### `Adding & Removing Elements (mutates array)`:

```js
[2, 12].push('a'); // → [2, 12, ‘a’]

// add an item to the start of the array and returns new length of the array
['first', 'second'].unshift(item); // → 3 (length)

// remove an item from the end and return it
[2, 12].pop(); // → 12

// remove an item from start of the array and returns it
['first', 'second'].shift(); // → first

// splice(start, deleteCount, ...items), Removes/adds elements by index
[1, 2, 3].splice(1, 1, 99); // → [1, 99, 3]

// sort(compareFn), sorts the elements of an array in place and returns the reference to the same sorted arr
[3, 2, 1].sort((a, b) => a - b); // → [1, 2, 3]
```

### `Transformations & Checks`:

```js
// slice(start, end), returns a shallow copy of a portion of an array into a new array
[2, 12, 45].slice(0, 2); // -> [2, 12]

// initialValue is → start from it.initialValue no → start from arr[0], skipping it.
[].reduce((acc, value) => {}, init); // -> init = {}

// returns Boolean if it finds one element in the array that satisfies the testing function
[1, 2, 3].some((el) => el % 2 === 0); // -> true

// returns Boolean if it finds one element in the array that does not satisfy the testing function

[2, 10, 15].every((el) => el < 40); // -> true
```

## Objects

### `Searching (by index, or elem itself)`:

```js
const obj = { name: 'Alice' };
// checks if any key exists, returns Boolean
'key' in obj; // true

// checks own key only (not prototype), returns Boolean
obj.hasOwnProperty('k');
Object.hasOwn(obj, 'name'); // false

// returns an object describing the configuration of a specific property
const descriptor = Object.getOwnPropertyDescriptor(obj, 'id');
console.log(descriptor.configurable); // true
```

### `Basic operations { add / remove / copy, compare }`:

```js
// add or update value (mutates)
obj.newKey = value;
delete obj.key;

// Strict comparison (NaN === NaN,+0 !== -0)
Object.is(false, false); // true

// creates deep copy of an object
const deep = structuredClone(obj); // {}
JSON.parse(JSON.stringify(obj));

// create and update without mutating (shallow)

const newObj = { ...obj, newKey: value };
Object.assign({}, obj, { newKey: value });

const obj = { name: 'Alice', age: 5 };
Object.keys(obj); // ['name', 'age']
Object.values(obj); // ['Alice', 5]
Object.entries(obj); // [Array(2), Array(2)]

// fromEntries -> transforms FormData/Map
Object.fromEntries(iterable); // pairs into { key: val }
```

## Map/Set

### `Map()`:

```js
const map = new Map([
  ['a', 1],
  ['b', 5],
]); // Map(2) {'a' => 1, 'b' => 5}
map.set('name', 'Alex'); // add/update
map.get('a'); // 1
map.keys(); // MapIterator {'a', 'b', 'name'}
map.values(); // MapIterator {1, 5, 'Alex'}
map.entries(); // iterator of [key, value]
```

### `Set()`:

```js
const set = new Set(); // Set(0) {size: 0}
const unique = new Set([1, 2, 3, 3, 3]); // Set(3) {1, 2, 3}
unique.add('banana'); // Set(4) {1, 2, 3, 'banana'}
const first = unique.values().next().value; // 1, returns first value
const last = [...unique][unique.size - 1]; // 'banana', returns last
set.delete('banana'); // Set(3) {1, 2, 3} removes elem
set.has('apple'); // checks for prop
set.size; // 3, shows size of the Set
set.clear(); // remove all
```

## Iterable

### `forEach((elem, index) => {})`:

```js
arrays []
new Set()
new Map()
```

### `for(const elem of iterable) {}`:

```js
arrays []`
strings ''
new Set {}
new Map() -> [key, val]
NodeList[]
```

### `for(const key in obj) {}`:

```js
arrays [] // -> for(const index in arr) {}` -> `indices as strings`
objects {}
```

## `Destructuring [] {}`:

```js
const [first, , third] = [1, 2, 3]; // 1, 3 -> Skipping elements

const [a = 5, b = 10] = [1]; // 1, 10 -> default values

const { role = 'guest' } = user;

const [head, ...rest] = [1, 2, 3, 4]; // rest: [2, 3, 4]

const { name: username } = user; // username: "Alex" ->  Renaming variables

const obj = { items: [1, 2, 3] };
const {
  items: [x, y],
} = obj; // x: 2, y: 3 -> Nested Destructuring

const arr = [{ id: 1, value: 42 }];
const [{ value }] = arr; // { id: 1, value: 42 }

const nestedObj = { user: { value: 42 } };
const {
  user: { value },
} = nestedObj; // 42

// Additional use-cases

const { length, [length - 1]: last } = [1, 2, 3, 4, 5, 6]; // get last element
```

# React

## What is virtual DOM and how it works:

**It's a JavaScript object that mirrors the structure of the actual DOM tree.**
**How it works:**

- React creates a `Virtual DOM tree`, when `state` or `props` change - it creates `new Virtual DOM tree`.
- React compares (`diffs`) and `updates` only specific parts in the `real DOM`.
  It boosts perfomance - update Real DOM is `slow` and `expensive`.

## Controlled component vs Uncontrolled:

- `Controlled` - `react` controls the component state, `react` is the single source of truth
- `Uncontrolled` - DOM itself controls the component state, accessing value directly from the `DOM` using a `ref` when needed

## Component lifecycle:

### Mounting:

1. `constructor()`
2. `getDerivedStateFromProps()`
3. `render()`
4. `componentDidMount()`

### Updating:

1. `getDerivedStateFromProps()`
2. `shouldComponentUpdate()`
3. `render()`
4. `getSnapshotBeforeUpdate()`
5. `componentDidUpdate()`

### Unmounting:

`componentWillUnmount()`

```js
class App extends Component<PropsType, AppType> {
  // mounting
  constructor(props: object) { -> 1
    super(props); // initiate the parent's constructor method
    this.state = {
      // inheriting methods from its parent (React.Component).
      count: 0,
      users: [],
    };
  }
  static getDerivedStateFromProps(props, state) { -> 2
    // called right before rendering the element(s) in the DOM + also at updates
    // returns an object with changes to the state
    return { favoritecolor: props.favcol };
  }

  componentDidMount() { -> 4
    setTimeout(() => {
      // called after the component is rendered.
      this.setState({ favoritecolor: 'yellow' });
    }, 1000);
  }

  // updating

  shouldComponentUpdate() {
    // Stops the component from rendering at any update
    return false; // true by default
  }

  getSnapshotBeforeUpdate(prevProps, prevState) {
    //  find out what the state object looked like before the
    document.getElementById('div1').innerHTML = prevState.favoritecolor; // update, kinda prev state
  }

  componentDidUpdate() {
    // Perform actions after the component has been updated
    document.getElementById('div2').innerHTML =
      'The updated favorite is ' + this.state.favoritecolor;
  }

  // unmounting
  componentWillUnmount() {
    // this will be the last lifecycle
    clearTimeout(this.timer); // clear timer
  }

  render() { -> 3
    return (
      // rendering the DOM, calls on mount and on update
      <>
        <div>Hi Im app</div>
        <button onClick={this.sortByAge.bind(this)}>Bind</button> {/* bind() to bind context */}
      </>
    );
  }
}
```

# TS

## Basic Types:

- `any`
- `unknown` - **Save version of `any`, but cant use without a check, used with unverified data.**
- `void`
- `never` - **a type that should never exist. `_exhaustiveCheck`**

```js
type T00 = unknown & null; // null
type T01 = unknown | null; // unknown

function throwError(msg: string): never {
  throw new Error(msg); // The value cannot be returned here.
}

```

## What is `tuple`:

```js
// tuple with number and string
let person: [number, string];
person = [25, "Max"]; // ✅
person = ["Max", 25]; // ❌ error


let arr: number[] = [1, 2, 3]; // any length
let tuple: [number, string] = [1, "Max"]; // strictly 2 elems: number + string

```

## Type vs Interface:

### Type:

- `extends` - **type cannot be extended but we can use intersection: `&`**
- combines any types: `objects`, `primitives`, `union`, `tuple`

### Interface:

- ✅ You can declare an `interface` with the same name and TS will merge the properties
- Only `objects` and `classes` can be merged
- `extends` inherits the `properties` of the interface

## Modifiers:

- `readonly` - **cant change**
- `public` - **all public by default**
- `private` - **just for itself (no access from extended class)**
- `protected` - **for itself + subclas**
- `abstract` - **cant create an instance, derived class should implement methods**
- `static` - **Removes prop from `this`, visible on the class itself but not in instances**

## Utility keywords:

- `keyof`
- `typeof`
- `instanceof` - **checks `x instanceof Date`**
- `in` - **checks `prop in obj`**
- `extends`
- `as` - **convert a type, `as unknown as User`**
- `is` - **type predicate, `param is Type` returns boolean**
- `satisfies` - **checks if obj satisfies the type**

```ts
// is keyword
type Fish = {
  swim: () => void;
};

type Bird = {
  fly: () => void;
};

function isFish(pet: Fish | Bird): pet is Fish {
  return 'swim' in pet && typeof 'swim' === 'function';
}

if (isFish(pet)) {
  pet.swim();
} else {
  pet.fly();
}
// If true → consider pet as a Fish If false → consider pet as a Bird

// satisfies

type User = {
  name: string;
  age: number;
};

const user = {
  name: 'Max',
  age: 30,
  role: 'admin',
} satisfies User;

// ✔ Checks that name and age are present
// ✔ Doesn't "narrow" the type to User
// ✔ Leaves the role available

// infer
```

## Function words for types:

- `implements` - **implements `type/interface` structure when we create a `class`**
- `declare` - **to declare that something exists, to let TS know the type.**
- `namespace` - **It's a way to logically group code (types, functions, constants) under a single name**
- `module` - `declare module` in TS does not create a real JS module, it is for `types`

### `declare` and `declare module`:

- The main goal is to give TypeScript type information for something that actually exists at runtime, but TS does not generate code.
- Usually they are written in files with the extension `.d.ts` — “`type declaration files`”.

```js
// globals.d.ts
declare const API_KEY: string;

declare module "fastify" {
  interface FastifyInstance {
    myCustomPlugin(): void;
  }
}

// namespace

namespace MyNamespace {
  export const PI = 3.14;

  export function greet(name: string) {
    console.log(`Hello, ${name}`);
  }

  export interface Person {
    name: string;
    age: number;
  }
}

// usage
console.log(MyNamespace.PI); // 3.14
MyNamespace.greet("Max"); // Hello, Max

const p: MyNamespace.Person = { name: "Max", age: 25 };

```

## Special operator types:

```ts
Partial<T>;
Required<T>;
ReturnType<T>;
Readonly<T>;
Record<K, T>;
Pick<T, K>;
Omit<T, K>;
Exclude<T, U>;
Extract<T, U>;
```

## `as const` - kind of `enum`, converts values ​​to literal types.

- with `as const` TS fixes the specific value ("max", 123, true) and makes all properties readonly.

```js

const colors = ['red', 'green', 'blue'];

type Color = typeof colors[number];

// Color = string[]

const colors = ['red', 'green', 'blue'] as const;

type Color = typeof colors[number];
// Color = "red" | "green" | "blue"

------------------------------------------

const Direction = {
  Up: "UP",
  Down: "DOWN",
  Left: "LEFT",
  Right: "RIGHT",
} as const;

type DirectionType = typeof Direction[keyof typeof Direction];

// DirectionType = "UP" | "DOWN" | "LEFT" | "RIGHT"

```

## Generics

- `extends` - limiting what types can be added

```js

// arrow syntax
const firstElement = <T>(arr: T[]): T => {
  return arr[0];
};

// types with generics
type Box<T> = { value: T };
const numberBox: Box<number> = { value: 123 };

// generics in classes
class DataStore<T> {
	private data: T[] = [];
}

const store = new DataStore<number>();

// extends inside generics is a constraint

function getLength<T extends { length: number }>(arg: T): number {
  return arg.length;
}

getLength([1, 2, 3]); // ✅ 3
getLength("hello");   // ✅ 5
getLength(123);       // ❌ error, number does not have length prop

-----------------------------------------------------------------

function processValue<T extends string | number>(value: T) {
	console.log(value);
}

processValue("text"); // ✅
processValue(123);    // ✅
processValue(true);   // ❌ err, boolean is not part of union

-----------------------------------------------------------------

interface Person {
  name: string;
  age: number;
}

function greetPerson<T extends Person>(person: T) {
  console.log(`Hello, ${person.name}`);
}

greetPerson({ name: "Max", age: 25 }); // ✅
greetPerson({ name: "Max" });          // ❌ no age


```

## Infer
