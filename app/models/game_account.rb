class GameAccount < ApplicationRecord
	has_and_belongs_to_many :orders

	validates :email_id, presence: true
end
