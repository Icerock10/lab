# JavaScript String Methods (Algorithm Essentials)

A quick reference of the most useful string operations for solving algorithmic problems in JavaScript.

## Access & Basics

```js
string.length; // get string length
string[i]; // access character by index
string.charCodeAt(i); // get ASCII/Unicode code
```

## Searching

```js
string.indexOf(substr); // find substring index or -1
string.includes(substr); // check if substring exists
string.startsWith(prefix); // prefix check
string.endsWith(suffix); // suffix check
```

## Slicing & Substrings

```js
string.slice(start, end); // extract substring before end

slice(1, 4)
       ↓ stop before 4
h  e  l  l  o
0  1  2  3  4
   ↑--------↑
   take this range

string.substring(start, end); // do not process negative indexes, swaps args if start > end
```

## Transformations

```js
string.toLowerCase(); // convert to lowercase
string.toUpperCase(); // convert to uppercase
string.trim(); // remove surrounding whitespace
string.repeat(n); // repeat string n times
```

## Splitting & Joining

```js
string.split(delimiter); // convert string to array
array.join(delimiter); // convert array to string
string.concat(otherString)        // concatenate two strings
string.concat(a, b, c)            // concatenate multiple strings
[...string]; // spread syntax: convert string into array of chars
```

## Replacement

```js
string.replace(a, b); // replace first match
string.replaceAll(a, b); // replace all matches
```

## Loops (Iterating Over a String)

```js
for (let i = 0; i < string.length; i++)
{ string[i] // classic index-based loop }
---------------------------------------------------
for (const char of string)
{ char // modern, clean iteration over characters }
```
