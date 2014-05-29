class Post < ActiveRecord::Base
  validates :post_type, presence: true
  belongs_to :blog


end
