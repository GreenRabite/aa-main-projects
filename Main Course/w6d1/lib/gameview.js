// Stores a Game instance.
// Stores a canvas context to draw the game into.
// Installs key listeners to move the ship and fire bullets.
// Installs a timer to call Game.prototype.step.

function Gameview(ctx, game){
  this.game = game;
  this.ctx = ctx;
  console.log("game view created!");
}

Gameview.prototype.start = function(){
  console.log("start has been called!");
  // console.log(this.game);
  //ends up calling moveObjects without any receiver
  setInterval(this.game.moveObjects.bind(this.game), 20);
  // console.log(this.game.draw);
  setInterval(this.game.draw.bind(this.game, this.ctx), 20);
};

module.exports = Gameview;
