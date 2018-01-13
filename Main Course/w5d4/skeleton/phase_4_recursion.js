let range = (start, end) => {
  if (start === end) {
    return [end];
  }
  return [start].concat(range(start+1,end));
};

// console.log(range(3,9));

let sumRec = (arr) => {
  if (arr.length === 1) {
    return arr[0];
  }
  return arr[0] + sumRec(arr.slice(1,arr.length+1));
};

// console.log(sumRec([1,2,3,4,5]));

let exponent = (base, exp) => {
  if (exp < 0){
    return 1/exponent(base,exp*-1);
  }
  if (exp === 1){
    return base;
  }
  return base * exponent(base, exp - 1);
};

// console.log(exponent(2,-4));

let fib = (n) => {
  if (n === 1){
    return [0];
  }else if (n === 2) {
    return [0,1];
  }
  let result = fib(n-1);
  let num = result.length;
  let lastNum = result[num - 1];
  let penNum = result[num - 2];
  return result.concat([penNum + lastNum]);
};

// console.log(fib(10));

let deepDup = (arr) => {
  let result = [];
  arr.forEach(function(el) {
    if ((typeof el) === 'number'){
      result.push(el);
    }else{
      result.push(deepDup(el));
    }
  });
  return result;
};


// console.log(deepDup([[1],[2,3],[4,[5,[6,[7]]]]]));

let bsearch = (arr,target) => {
  if (arr.length < 1){
    return -1;
  }
  let midIdx = Math.floor(arr.length / 2);
  if (arr[midIdx] === target){
    return midIdx;
  }else if (arr[midIdx] > target) {
    return bsearch(arr.slice(0,midIdx),target);
  }else {
    let x = bsearch(arr.slice(midIdx+1,arr.length),target);
    if ( x === -1){
      return -1;
    }else{
      return midIdx+1+x;
    }
  }
};

console.log(bsearch([1,3,5,7,19],20));
