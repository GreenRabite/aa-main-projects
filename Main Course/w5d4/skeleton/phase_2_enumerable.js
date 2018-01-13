Array.prototype.myEach = function(callback){
  for (let i = 0; i < this.length; i++){
    callback(this[i]);
  }
};


// [1,2,3,].myEach(
//   (el) => {
//     console.log(el);
//   }
// );


Array.prototype.myMap = function(callback){
  let result = [];
  this.myEach((el) =>{
    result.push(callback(el));
  });
  return result;
};

// console.log([1,2,3].myMap((el)=>{
//   return el*2;
// })
// );


Array.prototype.myReduce = function(callback, accumulator){
    this.myEach((el) =>{
      if (accumulator === undefined){
        accumulator = this[0];
      }else{
        accumulator = callback(accumulator, el);
      }
    });
    return accumulator;
};



// console.log( [2,2,3].myReduce((acc, el)=>{
//   return acc * el;
// })
// );
