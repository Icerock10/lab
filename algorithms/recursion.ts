// flatten an array [1, [2, [3, [4]]]]
// function calls itself

const flattenWithRecursion = <T>(array: T[]): unknown[] => {
  const flattened = array.flat();
  const hasArray = flattened.some((el) => Array.isArray(el));
  return hasArray ? flattenWithRecursion(flattened) : flattened;
};
