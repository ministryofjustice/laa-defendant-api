# frozen_string_literal: true

# spec/requests/defendants_spec.rb
require 'rails_helper'

RSpec.describe 'Defendants API', type: :request do
  # initialize test data
  let!(:defendants) { create_list(:defendant, 10) }
  let(:defendant_id) { defendants.first.id }
  let(:defendant) { defendants.first }
  let(:user) { create(:user) }
  let(:token) { token_generator(user) }
  let(:expired_token) { expired_token_generator(user) }

  # Test suite for GET /defendants
  describe 'GET /defendants' do
    # make HTTP get request before each example
    before { get '/defendants/', headers: { Authorization: token } }
    it 'returns defendants' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /defendants/:id
  describe 'GET /defendants/:id' do
    before { get "/defendants/#{defendant_id}", headers: { Authorization: token } }
    context 'when the record exists' do
      it 'returns the defendant' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(defendant.id)
        expect(json['first_name']).to eq(defendant.first_name)
        expect(json['last_name']).to eq(defendant.last_name)
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

  # With no authorization token
  describe 'GET /defendants' do
    before { get '/defendants/' }

    it 'returns a message saying the request is not authorized' do
      expect(response.body).to match(/Not Authorized/)
    end
  end

  # With expired authorization token
  describe 'GET /defendants' do
    before { get '/defendants/', headers: { Authorization: expired_token } }

    it 'returns a message saying the request is not authorized' do
      expect(response.body).to match(/Not Authorized/)
    end
  end

  # With invalid authorization token
  describe 'GET /defendants' do
    before { get '/defendants/', headers: { Authorization: 'foobar' } }

    it 'returns a message saying the request is not authorized' do
      expect(response.body).to match(/Not Authorized/)
    end
  end
end
