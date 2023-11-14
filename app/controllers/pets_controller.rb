class PetsController < ApplicationController
  def index
    @pets = Pet.all
    # render "index.html.erb"
  end

  def show
    @pet = Pet.find(params[:id])
    # render "show.html.erb"
  end

  def new
    @pet = Pet.new
    # render "new.html.erb"
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to root_path # on repasse par la methode de controller index
    else
      render :new, status: :unprocessable_entity # on va directement à ma page new.html.erb
    end
  end

  def edit
    @pet = Pet.find(params[:id])
    # render :edit
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      redirect_to pet_path(@pet.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to root_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :address, :specie, :found_on)
  end

  # def render(view_name)
    
  # end
end
