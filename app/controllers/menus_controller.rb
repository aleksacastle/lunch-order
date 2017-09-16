class MenusController < ApplicationController

  def show
    render cell(Menu::Cell::Show, @form)
  end

  def new
    run Menu::Create
  end

  def create
    run Menu::Create do |result|
      flash[:notice] = "Created menu for today"
      return redirect_to menu_path(result["model"].id)
    end

    render :new
  end
end
