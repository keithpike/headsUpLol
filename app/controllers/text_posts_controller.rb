class TextPostsController < ApplicationController
	layout 'blank'

	def new
		# @blog = current_user.primary_blog
		@blogId = current_user.selected_blog.id
		render 'text_post/new'
	end

end
