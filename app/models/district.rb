class District < ApplicationRecord
  belongs_to :department
  has_many :wineries
end
