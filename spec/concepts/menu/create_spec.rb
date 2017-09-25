require "rails_helper"

RSpec.describe Menu::Create do
  it "prohibits empty params" do
    result = Menu::Create.({})

    expect(result).to be_failure
  end

  it "runs successfully" do
    params = { weekday: "monday" }

    result = Menu::Create.( menu: params )

    expect(result).to be_success
    expect(result["model"]).to be_persisted
    expect(result["model"].weekday).to eq "monday"
  end
end
