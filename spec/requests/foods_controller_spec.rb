require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  
  describe 'GET /Food' do
    before(:each) do
      get foods_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(200)
    end
  end
end