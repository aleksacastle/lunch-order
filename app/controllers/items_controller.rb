class ItemsController < ApplicationController

  def new
    run Item::Create::Present
    render cell(Item::Cell::CreateForm, @form)
  end

  def create
    run Item::Create do |op|
      flash[:notice] = "Add: [#{op.model.name}] to \"#{op.model.category}\""
      return redirect_to menu_path(op.model)
    end

    render cell(Item::Cell::CreateForm, @form)
  end

  def index
    run Item::Index
    render cell(Item::Cell::Index, result["model"])
  end
end
