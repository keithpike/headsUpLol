class QuotePostsController < ApplicationController
  before_action :check_log_in
  layout 'blank'
	def new
		@post = Post.new
		render :new
	end
end
