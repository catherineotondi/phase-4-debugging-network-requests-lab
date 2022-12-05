class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end
# Debugging tip
# Change Toys.all to Toy.all in line 10
  def create
    toy = Toy.create(toy_params)
    render json: toy, status: :created
  end

  # DEBUGGING TIP
  # Solved Unhandled Rejection (SyntaxError): Unexpected end of JSON input by rendering toy in JSON format
  def update
    toy = Toy.find_by(id: params[:id])
    toy.update(toy_params)

    render json: toy
  end

  # DEBUGGING TIP
  # Solved ActionController::RoutingError (No route matches [DELETE] "/toys/2") by adding :destroy in the routes
  def destroy
    toy = Toy.find_by(id: params[:id])
    toy.destroy
    head :no_content
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

end
