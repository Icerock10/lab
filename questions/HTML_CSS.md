# HTML & CSS – Interview Questions & Answers

## HTML

<details>
<summary> 1. What is semantic HTML and why is it important? </summary>

**Semantic HTML** uses meaningful tags that describe their purpose and content.

Examples:

- `<header>` – page or section header
- `<nav>` – navigation links
- `<main>` – main content
- `<section>` – logical section
- `<article>` – independent content
- `<footer>` – footer content

**Why it matters:**

- Better accessibility (screen readers)
- Better SEO
- Cleaner, more readable code
- Easier maintenance
</details>

---

<details>
<summary> 2. What is the difference between <b>article</b> and <b>section</b>? </summary>

- `<article>` – standalone, reusable content (blog post, card, comment)
- `<section>` – part of a page grouped by topic

Rule of thumb: if it can be moved or reused independently → `<article>`.

## </details>

<details>
<summary> 3. What is the difference between inline and block elements? </summary>

- **Block**: takes full width (`div`, `p`, `section`)
- **Inline**: takes content width (`span`, `a`, `strong`)

Inline elements cannot have width/height (by default).

## </details>

<details>
<summary> 4. What is accessibility (a11y)? </summary>
Accessibility means making websites usable for people with disabilities.

Examples:

- Semantic HTML
- `alt` attributes for images
- Proper labels for inputs
- Keyboard navigation
</details>

---

## CSS

<details>
<summary> 5. What is the CSS box model? </summary>
The box model consists of:

- content
- padding
- border
- margin

`box-sizing: border-box;` includes padding and border in width/height.

</details>

<details>
<summary> 6.  Difference between `display: none` and `visibility: hidden`? </summary>

- `display: none` – element is removed from layout
- `visibility: hidden` – element is invisible but keeps space

</details>

<details>
<summary> 7. How does CSS specificity work? </summary>

Priority order:

0. !important -> **10,000**
1. Inline styles -> weight **1000**
2. ID selectors -> weight **100**
3. Class / attribute / pseudo-class -> weight **0010**
4. Element selectors / Pseudo-elements -> weight **0001**

More specific selector wins.

</details>

---

<details>
<summary> 8. Difference between `position: relative` and `absolute`? </summary>
- `relative` – positioned relative to itself
- `absolute` – positioned relative to nearest positioned element
</details>

---

<details>
<summary> 9. Why does `z-index` sometimes not work? </summary>

Because it only works on **positioned elements** (`relative`, `absolute`, etc.)

Also affected by **stacking context**.

</details>

<details>
<summary> 10. Difference between Flexbox and Grid? </summary>

- **Flexbox** – one-dimensional
- **Grid** – two-dimensional (rows + columns)

Use Grid for page layouts, Flexbox for components.

</details>

---

<details>
<summary> 11. What is responsive design? </summary>
Responsive design adapts layout to different screen sizes.

Techniques:

- percentages
- `max-width`
- flexbox / grid
- media queries

</details>

<details>
<summary> 12. What is `overflow`? </summary>
Controls what happens when content overflows its container.

Values:

- `hidden`
- `scroll`
- `auto`

</details>

<details>
<summary> 13. What are pseudo-classes and pseudo-elements? </summary>

- Pseudo-classes: `:hover`, `:focus`, `:active`
- Pseudo-elements: `::before`, `::after`
</details>

<details>
<summary> 14. How to make responsive pictures? </summary>

`srcset` - multiple images for different display conditions
`sizes` - can set breakpoints

---

```css
.responsive {
  width: 100%;
  height: auto;
}
```

</details>

<details>
  <summary> 14. Meta tags in HTML file </summary>
  ![alt text](image.png)
</details>

<details>
  <summary> 15. Reflow vs Repaint vs Composite (Summary) </summary>
  
- Reflow → layout changes (slow) - `width`, `height`, `margin`, `padding`, resizing the window
- Repaint → visual changes (medium) - `color`, `visibility`, `box-shadow`
- Composite → layer changes on GPU (fast) - handled by the GPU:
   - `opacity`, `transform`

</details>

## Interesting links:

- caniuse.com - resource to check compatibility with different browsers
- w3.org:validator - validates HTML
- pixir.com - editor of images (resize, rescale)
