class BookRecommendationsController < ApplicationController

  def generate
    user = user_params
    books = books_params

    recommendations = BookRecommender.call(user: user, books: books)

    render json: recommendations
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, preferences: [])
  end

  def books_params
    params.require(:books).map do |book|
      {
        id: book[:id],
        title: book[:title],
        authors: book[:authors],
        genres: book[:genres],
        description: book[:description]
      }
    end
  end
end
