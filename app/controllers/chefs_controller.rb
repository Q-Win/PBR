class ChefsController < ApplicationController

  def index
    @chefs = Chef.paginate(page: params[:page], per_page: 5)
  end

  def show
    @chef = Chef.find(params[:id])
    @recipes = @chef.recipes
  end

  def new
    @chef=Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = "Welcome #{@chef.name}"
      redirect_to chef_path(@chef)
    else
      render 'new'
    end
  end

  def edit
    @chef= Chef.find(params[:id])
  end

  def update
    @chef= Chef.find(params[:id])
    if @chef.update(chef_params)
        flash[:success] = "Your account was successfully updated"
        redirect_to @chef
    else
      render 'edit'
    end
  end

  private

  def chef_params
    params.require(:chef).permit(:name, :email, :password, :password_confirmation)
  end

end
