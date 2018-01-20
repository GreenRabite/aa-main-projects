const Util = require("./utils");
const MovingObject = require("./moving_object");


function Asteroid(pos, game) {
  const options = {};
  options.game = game;
  options.pos = pos;
  options.color = '#000000';
  options.radius = '10';
  options.velocity = Util.randomVec(1);
  MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
