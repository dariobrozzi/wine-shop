class Province < ApplicationRecord
  belongs_to :country
  has_many :departments, dependent: :destroy
  has_many :wineries, through: :departments
end
