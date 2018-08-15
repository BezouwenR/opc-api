require 'rails_helper'

RSpec.describe "vehicle_config_hardware_items#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/vehicle_config_hardware_items/#{vehicle_config_hardware_item.id}"
  end

  describe 'basic destroy' do
    let!(:vehicle_config_hardware_item) { create(:vehicle_config_hardware_item) }

    it 'updates the resource' do
      expect {
        make_request
      }.to change { VehicleConfigHardwareItem.count }.by(-1)

      expect(response.status).to eq(200)
      expect(json).to eq('meta' => {})
    end
  end
end
