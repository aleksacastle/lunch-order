class ItemsController < ApplicationController

  def new
    form Item::Create
  end

  def create
    run Item::Create do |op|
      flash[:notice] = "Add: [#{op.model.name}] to \"#{op.model.category}\""

      return redirect_to lunch_path(op.model)
    end

    render action: :new
  end
end
