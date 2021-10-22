# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Events::IndexService do
  describe '.call' do
    subject { described_class.call({ event_type: :issue, event_number: event_number }) }

    let!(:event1) { create(:event, event_number: 1000) }
    let!(:event2) { create(:event, event_number: 1111) }
    let!(:event3) { create(:event, event_number: 1000) }

    context 'success' do
      context 'when it does find events' do
        let(:response) { [event1, event3] }
        let(:event_number) { 1000 }

        it 'responds with an array of events' do
          expect(subject).to eq(response)
        end
      end

      context 'when it does not find events' do
        let(:response) { [] }
        let(:event_number) { 2222 }

        it 'responds with an empty array' do
          expect(subject).to eq(response)
        end
      end
    end
  end
end
