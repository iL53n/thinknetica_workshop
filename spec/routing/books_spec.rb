require 'rails_helper'

API_V1 = 'api/v1'.freeze

describe 'routing to books' do
  context API_V1 do
    it 'routes /books to books#index' do
      expect(get: "#{API_V1}/books").to route_to(
        controller: "#{API_V1}/books",
        action: 'index'
      )
    end

    it 'routes /books/:id to books#show' do
      expect(get: "#{API_V1}/books/5").to route_to(
        controller: "#{API_V1}/books",
        action: 'show',
        id: '5'
      )
    end
  end
end
