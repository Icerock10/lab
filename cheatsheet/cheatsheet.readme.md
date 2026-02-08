# HTML

## Semantic tags:

```html
<header> | <footer> | <nav> | <aside> (sidebar) | <main> | <section> | <article>

<details> <summary> </details> | <figure> <figcaption> </figure> | <dialog> (modal)

<address> (contact details) | <blockquote> (citation) | <time datetime="2025-02-05">05 February</time>
```

## HTML Attributes:

- `[disabled]` vs `[readonly]`:

```CSS
readonly - only for text fields => can't be edited => the value will be sent in the form

disabled - completely disabled from the interface => value WON"T be sent in the form => no focus

```

- `[data-*]`

```html
<div data-user-id="123"></div>
element.dataset.userId;
```

- `[aria-*]`:

```CSS
aria-label="name" /*  —> text description of the element */
aria-hidden="true" /* —> hide from screen reader */
aria-expanded="true/false" /* —> isOpened dropdown*/
aria-checked="true/false" /* —> custom checkbox state*/
aria-disabled="true" /* —> "logically" locked*/
aria-controls="menu" /* —> controls another element*/

```

- `[role="button | checkbox | progressbar"]`:

```CSS
<div role="button" tabindex="0" aria-pressed="false">
/* If there is native HTML (<button>, <input type="checkbox">) → role is not needed */
```

- `[tabIndex]`

```html
<div tabindex="0 | 1+ | -1"></div>
<!-- 
 0 → receives focus in the normal order
-1 → can only be focused via JS
1+ → manual order
 -->
```

- `<input>`

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

- `<button>`

```CSS
<button
type="button | submit | reset" /* type="submit" by default */
disabled
name=""
value=""
>
```

- `<img>`

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

- `<a>`

```CSS
<a
href=""
target="_blank" /* open in a new tab */
rel="noopener"
download
```

- `<form>`

```CSS
<form
action="url"
method="GET | POST"
enctype="multipart/form-data" /* for files upload */
/>
```

- `<script>`

```CSS
<script
src="url"
defer /* after the DOM is loaded */
async /* parallel loading */
type="module"/>
```

- `<select>`

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

## Grid - **two dimensional axis**

- `Parent props`

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

- `Child props`

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

- `Examples Grid`

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

[Open PDF](./css-selector.pdf)

## Flex - **one dimensional axis**

- `Parent props`

```CSS
flex-flow <flex-direction> | <flex-wrap>: row wrap;
justify-content: flex-start | center | space-around; /* Align items horizontal */
align-items: baseline | center | flex-start | stretch; /* Align items vertically */
align-content: flex-start | center | space-between; /* Align multiple lines (only works with flex-wrap) */
column-gap: 30px;
```

- `Child props`

```CSS
flex <flex-grow> | <flex-shrink> | <flex-basis> : 0 1 auto;
align-self: flex-start | center | baseline | stretch; /* Override parent's align-items for single item */
margin-left: auto /* push item to the right */
margin: auto; /* center item in all directions */
order: -1; /* move earlier */
```

- `Flex Examples`:

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

# JS-Core

# DOM

# React

# TS
