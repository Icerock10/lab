// flatten an array [1, [2, [3, [4]]]]

// const stackFnSkeleton = <T>(array: T[]): unknown[] => {
//   const stack = [...array];
//   let result: unknown[] = [];

//   while (stack.length) {
//     const item = stack.pop();
//   }

//   return result;
// };

const flattenWithStack = <T>(array: T[]): unknown[] => {
  const stack = [...array];
  let result = [];

  while (stack.length) {
    const item = stack.shift();

    if (Array.isArray(item)) {
      stack.push(...item);
    } else {
      result.push(item);
    }
  }

  return result;
};
