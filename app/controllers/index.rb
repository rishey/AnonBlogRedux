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

get '/edit_delete/:post_id' do
	@post = Post.find(params[:post_id])
	erb :edit_delete
end

get '/add_post' do
	erb :add_post
end


############### POSTS ###########

post '/add' do
	p = Post.create(params[:post])
	tags = params[:tag][:name]
	tag_array = tags.split(" ")
	tag_array.each do |tag|
		 p.tags.create(name: tag)
	end
	redirect '/'
end

post '/edit/:id' do
	u = Post.find(params[:id])
	u.update_attributes(params[:post])
	redirect '/'
end

post '/delete/:id' do
	Post.find(params[:id]).destroy
	redirect '/'
end
