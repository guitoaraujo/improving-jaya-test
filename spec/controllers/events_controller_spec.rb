# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #index' do
    subject { get :index, params: { event_type: :issue, event_number: 1000 } }

    context 'when it is a valid user' do
      before do
        request.headers['login'] = ENV['LOGIN']
        request.headers['password'] = ENV['PASSWORD']
      end

      it 'is successful' do
        expect(subject).to be_successful
      end
    end

    context 'when it is not a valid user' do
      before do
        request.headers['login'] = 'xxxxxx'
        request.headers['password'] = 'xxxxxx'
      end

      it 'is fail' do
        expect(subject).not_to be_successful
      end

      it 'responds with 401' do
        expect(subject.response_code).to eq(401)
      end
    end
  end

  describe 'POST #create' do
    subject { post :create, body: webhook_request, format: :json, params: params }

    let(:webhook_request) { build(:webhook_request).to_json }
    let(:params) { { parsed_request: webhook_request, event_type: 'issue' } }

    before do
      request.headers['X-Hub-Signature'] = key
      request.accept = 'application/json'
    end

    context 'when it is a valid webhook' do
      let(:key) { "sha1=#{OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), ENV['GIT_SECRET'], webhook_request)}" }

      it 'is successful' do
        expect(subject).to be_successful
      end

      it 'does create a new event' do
        subject
        expect(Event.count).to eq(1)
      end
    end

    context 'when it is not a valid webhook' do
      let(:key) { 'xxxxxxxxxxxxxx' }

      it 'is not successful' do
        expect(subject).not_to be_successful
      end

      it 'responds with 401' do
        expect(subject.response_code).to eq(401)
      end

      it 'does not create a new event' do
        subject
        expect(Event.count).to eq(0)
      end
    end
  end
end
