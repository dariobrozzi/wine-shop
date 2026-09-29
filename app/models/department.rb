class Department < ApplicationRecord
  belongs_to :province
  has_many :districts, dependent: :destroy
  has_many :wineries, through: :districts
end
