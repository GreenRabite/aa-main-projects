/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const Util = __webpack_require__(1);
const MovingObject = __webpack_require__(2);
const Asteroid = __webpack_require__(3);
const Bullet = __webpack_require__(4);
const Ship = __webpack_require__(5);
const Game = __webpack_require__(6);
const Gameview = __webpack_require__(7);
const Asteroids = __webpack_require__(0)


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


/***/ }),
/* 1 */
/***/ (function(module, exports) {

// Utility code, especially vector math stuff.

const Util = {

  inherits: function(childClass, parentClass) {
    function Surrogate(){}
    Surrogate.prototype = parentClass.prototype;
    childClass.prototype = new Surrogate();
    childClass.prototype.constructor = childClass;
  },

  randomVec: function(length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },
  // Scale the length of a vector by the given amount.
  scale: function(vec, m) {
    return [vec[0] * m, vec[1] * m];
  }

};




module.exports = Util;


/***/ }),
/* 2 */
/***/ (function(module, exports) {

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


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const Util = __webpack_require__(1);
const MovingObject = __webpack_require__(2);


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


/***/ }),
/* 4 */
/***/ (function(module, exports) {



/***/ }),
/* 5 */
/***/ (function(module, exports) {



/***/ }),
/* 6 */
/***/ (function(module, exports, __webpack_require__) {

// Holds collections of the asteroids, bullets, and your ship.
// Game.prototype.step method calls Game.prototype.move on all
// the objects, and Game.prototype.checkCollisions checks for colliding objects.
// Game.prototype.draw(ctx) draws the game.
// Keeps track of dimensions of the space; wraps objects around when they drift off the screen.
const Asteroid = __webpack_require__(3)


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


/***/ }),
/* 7 */
/***/ (function(module, exports) {

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


/***/ })
/******/ ]);