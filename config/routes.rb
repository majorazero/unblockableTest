Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get  '/new_game',                  :to => 'game#new_game'
  post '/game/:id/select_move',     :to => 'game#select_move'
  get  '/game/:id/available_moves', :to => 'game#available_moves'
end
