class QuotePostsController < ApplicationController
	def new
		@post = Post.new
		render: new
	end
end
