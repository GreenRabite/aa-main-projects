class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on( "click", "li", (el) => {
      console.log(el);
      console.log( "square was clicked" );
      console.log(el.currentTarget);
      let $square = $(el.currentTarget);
      this.makeMove($square);
    });
  }


  makeMove($square) {
    console.log($square);
    let $pos = $square.data("pos");
    this.game.playMove($pos);

    if (this.game.currentPlayer === 'o') {
      $square.addClass("playerX");
      $square.append("<h1>X</h1>");
      // this.playerXMove.push($pos);
    }else {
      $square.addClass("playerO");
      $square.append("<h1>O</h1>");
      // this.playerOMove.push($pos);
    }
    if (this.game.isOver()) {
      if (this.game.winner() === 'x') {
        this.$el.append("<h1>Player X has Won</h1>");
      }else if (this.game.winner() === 'o') {
        this.$el.append("<h1>Player O has Won</h1>");
      }else {
        this.$el.append("<h1>No one wins!</h1>");
      }
      this.$el.off("click");
    }

  }

  setupBoard() {
    let $ul = $("<ul class=board></ul>");
    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        let $li = $("<li class=square></li>").data("pos", [i,j]);
        $ul.append($li);
      }
    }
    console.log($ul);
    this.$el.append($ul);
  }
}

module.exports = View;
