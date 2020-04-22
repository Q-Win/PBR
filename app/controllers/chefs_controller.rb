class ChefsController < ApplicationController

  def new
    @chef=Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save

    else
      render 'new'
    end
  end

  private

  def chef_params
    params.require(:chef).permit(:name,:email,:passowrd,:password_confirmation)
  end

end
