class Country < ApplicationRecord
  has_many :provinces, dependent: :destroy
  has_many :wineries, through: :provinces
end
