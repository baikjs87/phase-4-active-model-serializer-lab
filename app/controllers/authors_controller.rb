class AuthorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    authors = Author.all 
    render json: authors
  end

  def show
    author = find_author
    render json: author
  end

  private

  def render_not_found_response
    render json: { error: "Author not found" }, status: :not_found
  end

  def find_author
    Author.find(params[:id])
  end

end
