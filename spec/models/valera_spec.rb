require 'rails_helper'

RSpec.describe Valera, type: :model do
  let(:valera) { described_class.where(user_id: 2).first }
  let(:actions) { @actions = ValeraAction.all }

  describe '#dead?' do
    subject { valera.dead? }

    it { is_expected.to be false }
  end

  describe '#action' do
    context 'when the action is sleep' do
      let(:action) { ValeraAction.where(id: 7).first }

      it { expect(valera.action(action).money).to eq 100 }
      it { expect(valera.action(action).health).to eq 100 }
      it { expect(valera.action(action).fatigue).to eq 30 }
      it { expect(valera.action(action).cheerfulness).to eq 7 }
    end

    context 'when the action is subway' do
      let(:action) { ValeraAction.where(id: 6).first }

      it { expect(valera.action(action).money).to eq 120 }
      it { expect(valera.action(action).health).to eq 100 }
      it { expect(valera.action(action).fatigue).to eq 100 }
      it { expect(valera.action(action).cheerfulness).to eq 10 }
    end

    context 'when the action is marginal' do
      let(:action) { ValeraAction.where(id: 5).first }

      it { expect(valera.action(action).money).to eq(-50) }
      it { expect(valera.action(action).health).to eq 20 }
      it { expect(valera.action(action).fatigue).to eq 100 }
      it { expect(valera.action(action).cheerfulness).to eq 10 }
    end

    context 'when the action is bar' do
      let(:action) { ValeraAction.where(id: 4).first }

      it { expect(valera.action(action).money).to eq 0 }
      it { expect(valera.action(action).health).to eq 90 }
      it { expect(valera.action(action).fatigue).to eq 100 }
      it { expect(valera.action(action).cheerfulness).to eq 10 }
    end

    context 'when the action is series' do
      let(:action) { ValeraAction.where(id: 3).first }

      it { expect(valera.action(action).money).to eq 80 }
      it { expect(valera.action(action).health).to eq 95 }
      it { expect(valera.action(action).fatigue).to eq 100 }
      it { expect(valera.action(action).cheerfulness).to eq 9 }
    end

    context 'when the action is nature' do
      let(:action) { ValeraAction.where(id: 2).first }

      it { expect(valera.action(action).money).to eq 100 }
      it { expect(valera.action(action).health).to eq 100 }
      it { expect(valera.action(action).fatigue).to eq 100 }
      it { expect(valera.action(action).cheerfulness).to eq 10 }
    end
  end
end
