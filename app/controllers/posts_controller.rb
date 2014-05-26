class PostsController < ApplicationController

	def index
		@posts = current_user.posts
		render :index
	end

	def show
		@post = Post.find(params[:id])
		if @post
			render :show
		else
			flash[:error] = 'Post could not be found'
			redirect_to 'users/dashboard'
		end
	end

	def new
		@post = Post.new
		render :new
	end

	def create
		@post = Post.new(post_params)
    if @post.media_url
  		@post.media_url = get_embed_link(@post.media_url)['html']
    end
		if @post.save
      render :show, layout: 'layouts/blank'
		else
			flash.now[:error] = @post.errors.full_messages
			render 'users/dashboard'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.owner == current_user
			@post.destroy
			redirect_to posts_url
		else
			flash[:error] = 'Only the owner may delete this blog'
			redirect_to posts_url
		end

	end

	def edit
		@post = Post.find(params[:id])
		render :edit
	end

	def update
		@post = Post.find(params[:id])
		@post.update_attributes(post_params)

		if @blog.save
			redirect_to post_url(@post)
		else
			flash.now[:error] = @post.errors.full_messages
			render :edit
		end

	end

	private

	def post_params
		params.require(:post).permit(:title, :media_url, :description, :post_type, :blog_id)
	end

end
