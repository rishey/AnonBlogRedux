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

get '/single_post/:post_id' do
	@post = Post.find(params[:post_id])
	erb :single_post
end

get '/edit_add/:post_id' do
	@post = Post.find(params[:post_id])
	erb :edit_add
end


############### POSTS ###########

post '/edit' do
	p " XXXXXXXXXXXXXXXXXXXXXXXXXX PARAMS FOLLOW NEXT XXXXXXXXXXXXXXXXXXXXXXXXXX"
	p params[:post]
	p params[:post][:title]
		p "XXXXXXXXXXXXXXXXXXXXXXXXXX"

 # Post.where(params[:post]).exists?
	p Post.find_or_create_by(params[:post])

	redirect '/'
end
