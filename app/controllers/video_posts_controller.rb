class VideoPostsController < ApplicationController
	layout 'blank'
	def new
		@blogId = current_user.selected_blog.id
		render :new
	end
end
