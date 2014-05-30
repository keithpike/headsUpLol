class VideoPostsController < ApplicationController
  before_action :check_log_in
	layout 'blank'
	def new
		@blogId = current_user.selected_blog.id
		render :new
	end
end
