class ActionHistory < ApplicationRecord
  belongs_to :valera, optional: true
  belongs_to :valera_action, optional: true
end
