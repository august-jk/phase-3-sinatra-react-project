class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/games" do
    games = Game.all
    games.to_json(:methods => :average_score, :include => :reviews)
  end

  get "/games/:id/reviews" do
    game = Game.find(params[:id])
    reviews = game.reviews
    reviews.to_json
  end

  get "/reviews" do
    reviews = Review.all
    reviews.to_json
  end

  post "/games" do
    game = Game.create(
      title: params[:title],
      genre: params[:genre],
      platform: params[:platform],
      price: params[:price]
    )
    game.to_json
  end

  post "/reviews" do
    review = Review.create(
      name: params[:name],
      score: params[:score],
      comment: params[:comment],
      game_id: params[:game_id]
    )
    review.to_json
  end

  patch "/reviews/:id" do
    review = Review.find(params[:id])
    review.update(
      score: params[:score],
      comment: params[:comment]
    )
    review.to_json
  end

  delete "/reviews/:id" do
    review = Review.find(params[:id])
    review.destroy
    review.to_json
  end

end
