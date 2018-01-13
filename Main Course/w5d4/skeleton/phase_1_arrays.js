Array.prototype.myUniq = function() {
  let arr = [];
  this.forEach (el => {
    if (arr.includes(el) === false){
      arr.push(el);
    }
  });
  return arr;
};

// console.log([1,1,2,2,3,3].myUniq());

Array.prototype.twoSum = function() {
  let arr = [];
  for ( let i = 0; i < this.length - 1; i++){
    for (let j = i + 1; j < this.length; j++ ){
      if ( (this[i] + this[j]) === 0 ) {
        arr.push([i,j]);
      }
    }
  }
  return arr;
};

// console.log([1, -1, 7, 3, 2, -7].twoSum());

Array.prototype.myTranspose = function(){
  let arr = [];
  for ( let i = 0; i < this.length; i++){
    let temp = [];
    for (let j = 0; j < this.length; j++ ){
      temp.push(this[j][i]);
    }
    arr.push(temp);
  }
  return arr;
};

// console.log([[1,2,3],[4,5,6],[7,8,9]].myTranspose());
