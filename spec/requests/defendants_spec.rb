# frozen_string_literal: true

# spec/requests/defendants_spec.rb
require 'rails_helper'

RSpec.describe 'Defendants API', type: :request do
  # initialize test data
  let!(:defendants) { create_list(:defendant, 10) }
  let(:defendant_id) { defendants.first.id }

  # Test suite for GET /defendants
  describe 'GET /defendants' do
    # make HTTP get request before each example
    before { get '/defendants' }

    it 'returns defendants' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /todos/:id
  describe 'GET /defendants/:id' do
    before { get "/defendants/#{defendant_id}" }

    context 'when the record exists' do
      it 'returns the defendant' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(defendant_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:defendant_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Defendant/)
      end
    end
  end
end
