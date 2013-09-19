get '/' do
  # Look in app/views/index.erb
  @posts = Post.all
  erb :index
end

get '/tag/:tag' do
	@tag 		= Tag.find_by_name(params[:tag])
	@posts 	= @tag.posts
	erb :tags
end