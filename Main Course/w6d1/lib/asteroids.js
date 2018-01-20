const Util = require("./utils");
const MovingObject = require("./moving_object");
const Asteroid = require("./asteroid");
const Bullet = require("./bullet");
const Ship = require("./ships");
const Game = require("./game");
const Gameview = require("./gameview");
const Asteroids = require('./asteroids')


document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("game-canvas");
  canvasEl.width = 1920;
  canvasEl.height = 1080;

  const ctx = canvasEl.getContext("2d");
  const game = new Game(1920, 1080, 5000);
  // console.log(game);
  const gv = new Gameview(ctx, game);
  gv.start();
  console.log("I am after I supposedly started");
});
