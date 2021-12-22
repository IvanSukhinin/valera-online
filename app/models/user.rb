class User < ApplicationRecord
  include Clearance::User
  has_one :valera
end
