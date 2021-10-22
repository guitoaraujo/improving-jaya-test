# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Events::CreateService do
  describe '.call' do
    subject { described_class.call(params) }

    let(:webhook_request) { build(:webhook_request) }
    let(:params) { { parsed_request: webhook_request, event_type: 'issue' } }

    before do
      subject
    end

    context 'success' do
      it 'creates a new event' do
        expect(Event.count).to eq(1)
      end

      it 'creates a new event with right parameters' do
        expect(Event.last.action).to eq('opened')
        expect(Event.last.event_id).to eq(1_032_319_820)
        expect(Event.last.event_user_id).to eq(33_427_463)
      end
    end
  end
end
