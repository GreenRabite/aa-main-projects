// Holds collections of the asteroids, bullets, and your ship.
// Game.prototype.step method calls Game.prototype.move on all
// the objects, and Game.prototype.checkCollisions checks for colliding objects.
// Game.prototype.draw(ctx) draws the game.
// Keeps track of dimensions of the space; wraps objects around when they drift off the screen.
const Asteroid = require('./asteroid')


function Game(x, y, numAsteroids) {
  // console.log('game being created');
  this.DIM_X = x;
  this.DIM_Y = y;
  console.log(numAsteroids);
  this.NUM_ASTEROIDS = numAsteroids;
  this.asteroids = [];
  this.addAsteroids();

}

Game.prototype.addAsteroids = function () {
  // console.log("adding asteroids");
  // console.log(this.NUM_ASTEROIDS);
  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
    this.asteroids.push(new Asteroid(this.randomPosition(), this));
    // console.log('asteroid added');
  }

};

Game.prototype.randomPosition = function () {
  //return a random x between 0 and DIM_X
  //return a random y between 0 and DIM_Y
  let x = (Math.random() * this.DIM_X);
  let y = (Math.random() * this.DIM_Y);
  return [x, y];
};

Game.prototype.draw = function (ctx) {
  // console.log('trying to draw!');
  ctx.clearRect(0,0, this.DIM_X, this.DIM_Y);
  this.asteroids.forEach(el => {
    // console.log('drawing!');
    el.draw(ctx);
  });
};

Game.prototype.moveObjects = function () {
  // console.log('I am starting to move!');
  // console.log(this);
  // console.log(this.asteroids);
  this.asteroids.forEach(el => {
    // console.log('moved an asteroid');
    el.move();
  });
};

Game.prototype.wrap = function (pos) {
  // console.log(pos);
  if (pos[0] < 0) {
    // console.log('I wrapped');
    pos[0] = this.DIM_X;
  } else if (pos[0] > this.DIM_X) {
    // console.log('I wrapped');
    pos[0] = 0;
  } else if (pos[1] < 0) {
    // console.log('I wrapped');
    pos[1] = this.DIM_Y;
  } else if (pos[1] > this.DIM_Y) {
    // console.log('I wrapped');
    pos[1] = 0;
  }
  return pos;
};

module.exports = Game;
