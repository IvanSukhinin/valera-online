class ValeraAction < ApplicationRecord
  has_one :action_history, dependent: :destroy
end
