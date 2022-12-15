class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/games" do
    games = Game.all
    games.to_json(only: [:title, :genre, :platform, :price], include: :reviews)
  end

  get "/games/:id" do
    game = Game.find(params[:id])
    game.to_json(only: [:title, :genre, :platform, :price], include: :reviews)
  end

  get "/games/:id/reviews" do
    game = Game.find(params[:id])
    reviews = game.reviews.all
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
