const View = require("./ttt-view");
const Game = require("./../node_list_solution/game");

$( () => {
  let game = new Game();
  let view = new View(game, $('.ttt'));

});
