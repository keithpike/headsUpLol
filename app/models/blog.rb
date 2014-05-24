class Blog < ActiveRecord::Base
	validates :title, presence: true
	validates :owner_id, presence: true, on: :create
	has_many(
		:posts,
		dependent: :destroy
	)
	belongs_to(
		:owner,
		class_name: 'User'
		foreign_key: :owner_id
	)
	
end
