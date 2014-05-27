class QuotePostsController < ApplicationController
  layout 'blank'
	def new
		@post = Post.new
		render :new
	end
end
