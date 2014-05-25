class VideoPostsController < ApplicationController
	def new
		@post = Post.new
		render: new
	end
end
