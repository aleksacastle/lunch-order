require "rails_helper"
require_relative "../../../app/concepts/menu/operation/create"

RSpec.describe Menu::Create do
it "runs successfully" do
  params = { weekday: "monday" }

  result = Menu::Create.( params )

  # expect(result).to be_success
  # expect(result["model"]).to be_persisted
  expect(result["model"].weekday).to eq "monday"
end
end
