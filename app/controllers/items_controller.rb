class ItemsController < ApplicationController

  def new
    run Item::Create::Present
    render cell(Item::Cell::CreateForm, @form)

  end

  def create
    run Item::Create do |result|
      flash[:notice] = "Added"
      return redirect_to menu_item_path(result['model'].id)
    end
    render cell( Item::Cell::CreateForm, @form )

  end

  def show
    run Item::Show
    render cell(Item::Cell::Show, result["model"])
  end

  def index
    run Item::Index
    render cell(Item::Cell::Index, result["model"])
  end
end
