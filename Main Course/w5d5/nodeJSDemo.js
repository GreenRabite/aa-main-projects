// Example 1
// const readline = require('readline');
//
// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });
//
// function addTwoNumbers(callback) {
//   // Notice how nowhere do I return anything here! You never return in
//   // async code. Since the caller will not wait for the result, you
//   // can't return anything to them.
//
//   reader.question("Enter #1: ", function (numString1) {
//     reader.question("Enter #2: ", function (numString2) {
//       const num1 = parseInt(numString1);
//       const num2 = parseInt(numString2);
//
//       callback(num1 + num2);
//     });
//   });
// }
//
// addTwoNumbers(function (result) {
//   console.log(`The result is: ${result}`);
// });
//   reader.close();

// Example 2
// function absurdTimes(numTimes, fn) {
//   let i = 0;
//
//   function loopStep() {
//     if (i == numTimes) {
//       // we're done, stop looping
//       return;
//     }
//
//     fn();
//
//     i++;
//     // recursively call loopStep
//     loopStep();
//   }
//
//   loopStep();
// }
// function fn = (el) =>{
//   return el*2;
// }
// absurdTimes( 200, fn());

class Bicycle {
  constructor(model, color) {
    this.model = model;
    this.color = color;
  }

  action() {
    return "rolls along";
  }

  ride() {
    console.log(
      `The ${this.color} ${this.model}
      goes "whoosh" and ${this.action()}!`
      );
  }

  static parade() {
    Bicycle.funBicycles.forEach(bike => bike.ride());
  }
}

const cruiser = new Bicycle("Schwinn", "turquoise");
const salsaFargo = new Bicycle("Salsa Fargo", "burnt orange");
const flyingMerkel = new Bicycle("Flying Merkel", "green");
const bianchiVolpe = new Bicycle("Bianchi Volpe", "slate blue");

Bicycle.funBicycles = [cruiser, salsaFargo, flyingMerkel, bianchiVolpe];

Bicycle.parade();
