class RecipeTypesController < ApplicationController
  def show
    @recipe_type = RecipeType.find(params[:id])
  end

  def new
    @recipe_type = RecipeType.new
  end

  def create
    @recipe_type = RecipeType.new(params.require(:recipe_type).permit(:name))

    if @recipe_type.save
      redirect_to @recipe_type
    else
      flash[:alert] = 'Você deve informar o nome do tipo de receita'
      render :new
    end    
  end

  def edit
    @recipe_type = RecipeType.find(params[:id])
  end

  def update
    @recipe_type = RecipeType.find(params[:id])

    if @recipe_type.update(recipe_type_params)
      redirect_to @recipe_type
    else
      flash[:alert] = 'Você deve editar o tipo da receita' 
      render :new
    end
  end

  private

  def recipe_type_params
    params.require(:recipe_type).permit(:name )
  end
end
