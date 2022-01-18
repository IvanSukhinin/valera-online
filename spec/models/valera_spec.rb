require 'rails_helper'

RSpec.describe Valera, type: :model do
  let(:valera) { described_class.where(user_id: 1).first }

  describe '#dead?' do
    subject { valera.dead? }

    it { is_expected.to be false }
  end

  describe '#action' do
    context 'when the action is sleep' do
      let(:action) { build(:valera_action, name: 'sleep', money: 0, mana: -50, health: 90, cheerfulness: -3, fatigue: -70) }

      it { expect(valera.action(action).money).to eq 100 }
      it { expect(valera.action(action).mana).to eq 50 }
      it { expect(valera.action(action).health).to eq 100 }
      it { expect(valera.action(action).fatigue).to eq 30 }
      it { expect(valera.action(action).cheerfulness).to eq 7 }
    end

    context 'when the action is metro' do
      let(:action) { build(:valera_action, name: 'metro', money: 20, mana: 10, health: 0, cheerfulness: 1, fatigue: 20) }

      it { expect(valera.action(action).money).to eq 120 }
      it { expect(valera.action(action).mana).to eq 100 }
      it { expect(valera.action(action).health).to eq 100 }
      it { expect(valera.action(action).fatigue).to eq 100 }
      it { expect(valera.action(action).cheerfulness).to eq 10 }
    end

    context 'when the action is marginal' do
      let(:action) { build(:valera_action, name: 'marginal', money: -150, mana: 90, health: -80, cheerfulness: 5, fatigue: 80) }

      it { expect(valera.action(action).money).to eq(-50) }
      it { expect(valera.action(action).mana).to eq 100 }
      it { expect(valera.action(action).health).to eq 20 }
      it { expect(valera.action(action).fatigue).to eq 100 }
      it { expect(valera.action(action).cheerfulness).to eq 10 }
    end

    context 'when the action is bar' do
      let(:action) { build(:valera_action, name: 'bar', money: -100, mana: 60, health: -10, cheerfulness: 1, fatigue: 40) }

      it { expect(valera.action(action).money).to eq 0 }
      it { expect(valera.action(action).mana).to eq 100 }
      it { expect(valera.action(action).health).to eq 90 }
      it { expect(valera.action(action).fatigue).to eq 100 }
      it { expect(valera.action(action).cheerfulness).to eq 10 }
    end

    context 'when the action is series' do
      let(:action) { build(:valera_action, name: 'series', money: -20, mana: 30, health: -5, cheerfulness: -1, fatigue: 10) }

      it { expect(valera.action(action).money).to eq 80 }
      it { expect(valera.action(action).mana).to eq 100 }
      it { expect(valera.action(action).health).to eq 95 }
      it { expect(valera.action(action).fatigue).to eq 100 }
      it { expect(valera.action(action).cheerfulness).to eq 9 }
    end

    context 'when the action is nature' do
      let(:action) { build(:valera_action, name: 'nature', money: 0, mana: -10, health: 0, cheerfulness: 1, fatigue: 10) }

      it { expect(valera.action(action).money).to eq 100 }
      it { expect(valera.action(action).mana).to eq 90 }
      it { expect(valera.action(action).health).to eq 100 }
      it { expect(valera.action(action).fatigue).to eq 100 }
      it { expect(valera.action(action).cheerfulness).to eq 10 }
    end

    context 'when the action is grandpa' do
      let(:action) { ValeraAction.where(name: 'grandpa').first }

      it { expect(valera.action(action).money).to eq 100 }
      it { expect(valera.action(action).mana).to eq 100 }
      it { expect(valera.action(action).health).to eq 0 }
      it { expect(valera.action(action).fatigue).to eq 0 }
      it { expect(valera.action(action).cheerfulness).to eq 0 }
    end
  end
end
