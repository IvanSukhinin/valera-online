class Valera < ApplicationRecord
  belongs_to :user, optional: true

  has_one :action_history, :dependent => :destroy

  has_one :min_characteristic, :dependent => :destroy
  has_one :max_characteristic, :dependent => :destroy
  
  has_one :metro_characteristic, :dependent => :destroy
  has_one :sleep_characteristic, :dependent => :destroy
  has_one :work_characteristic, :dependent => :destroy

end
