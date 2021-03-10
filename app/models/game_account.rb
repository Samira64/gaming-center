class GameAccount < ApplicationRecord
	has_and_belongs_to_many :orders, class_name: "Spree::Order"

	validates :email_id, presence: true

	def self.capacities
		['available', 'sold', 'not available']
	end
end
