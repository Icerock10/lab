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
aria-label /*  —> text description of the element */
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

[Open PDF](./css-selector.pdf)

# JS-Core

# DOM

# React

# TS
