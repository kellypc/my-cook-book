class CuisinesController < ApplicationController
  def show
    @cuisine = Cuisine.find(params[:id])
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(params.require(:cuisine).permit(:name))

    if @cuisine.save
      redirect_to @cuisine
    else
      flash[:alert] = 'Você deve informar o nome da cozinha'
      render :new
    end
  end

  def edit
    @cuisine = Cuisine.find(params[:id])
  end

  def update
    @cuisine = Cuisine.find(params[:id])

    if @cuisine.update(cuisine_params)
      redirect_to @cuisine
    else
      flash[:alert] = 'Você deve editar a receita' 
      render :new
    end
  end

  private

  def cuisine_params
    params.require(:cuisine).permit(:name )
  end

end
