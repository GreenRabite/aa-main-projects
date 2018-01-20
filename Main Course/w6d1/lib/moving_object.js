// Base class for anything that moves.
// Most important methods are MovingObject.prototype.move,
// MovingObject.prototype.draw(ctx),
// MovingObject.prototype.isCollidedWith(otherMovingObject).
function MovingObject(options) {
  this.game = options['game'];
  //array of x, y
  this.pos = options['pos'];
  //array of x vel, y vel
  this.velocity = options['velocity'];
  this.radius = options['radius'];
  this.color = options['color'];
}

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );

  ctx.fill();
};

MovingObject.prototype.move = function() {
  // Math.sqrt((velocity[0]**2) + (velocity[1]**2));
  this.pos[0] += this.velocity[0];
  this.pos[1] += this.velocity[1];

  this.pos = this.game.wrap(this.pos);
  // console.log(this.pos);
};

module.exports = MovingObject;
