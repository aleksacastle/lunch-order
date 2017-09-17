class MenusController < ApplicationController

  def show
    run Menu::Show
    render cell(Menu::Cell::Show, result["model"])
  end

  def new
    run Menu::Create::Present
    render cell(Menu::Cell::CreateForm, @form)
  end

  def create
    run Menu::Create do |result|
      flash[:notice] = "Created menu for today"
      return redirect_to menus_path
    end

    render cell(Menu::Cell::CreateForm, @form)
  end

  def index
    run Menu::Index
    render cell(Menu::Cell::Index, result["model"])
  end
end
