Array.prototype.bubbleSort = function(){
  let unsorted = true;
  while(unsorted){
    unsorted = false;
    for(let j = 0; j < this.length - 1; j++){
      let a = this[j];
      let b = this[j+1];
      if (a > b) {
        this[j] = b;
        this[j+1] = a;
        unsorted = true;
      }
    }
  }
  return this;
};

// console.log([8,7,6,5,4,3,2,1].bubbleSort());

String.prototype.substrings = function(){
  let substring = [];
  let wordArr = this.split("");
  for (var i = 0; i < wordArr.length; i++) {
    for (var j = i; j < wordArr.length; j++) {
      substring.push(wordArr.slice(i,j+1));
    }
  }
  console.log(substring);
  return substring;
};

// "cat".substrings();
