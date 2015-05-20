require 'rails_helper'

RSpec.describe LegendopediaController, type: :controller do

  describe "GET #schools" do
    it "returns http success" do
      get :schools
      expect(response).to have_http_status(:success)
    end
  end

end
