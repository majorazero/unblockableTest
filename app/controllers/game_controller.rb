class GameController < ApplicationController
  protect_from_forgery with: :null_session

  def new_game
    game = Game.create
    game.initialize_game

    render json: { game_id: game.id }
  end

  def select_move
    game = Game.find params[:id]
    return 'Game Over' if game.is_game_over?

    coordinate = {
      :x => params['x'],
      :y => params['y']
    }

    moves = game.select_move coordinate
    render json: { available_moves: moves }
  end

  def available_moves
    game = Game.find params[:id]
    return 'Game Over' if game.is_game_over?

    moves = game.boards[0].coordinates.where.not(
       :status => 'hit'
    )

    render json: { available_moves: moves }
  end
end
