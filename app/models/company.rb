class Company < ApplicationRecord
  validates :name, presence: true, length: { maximum: 250 }
  validates :cnpj, presence: true, length: { is: 14 }, uniqueness: true
end
