class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  
  get "/" do
    { message: "Hello from your Sinatra API!" }.to_json
  end
  
  # Fetch all posts
  get '/posts' do
    Post.all.to_json
  end

  get '/posts' do
    user = current_user  # Replace this with your logic to get the logged-in user
    user_posts = user.posts
    user_posts.to_json
  end
  
  # Fetch a specific post
  get '/posts/:id' do
    post = Post.find(params[:id])
    post.to_json
  end

  # Create a new post
  post '/posts' do
    post = Post.create(JSON.parse(request.body.read))
    post.to_json
  end
  post '/api/v1/users' do
    user_params = JSON.parse(request.body.read)
    user = User.new(user_params['user'])
    
    if user.save
      { message: 'User created successfully', user: user }.to_json
    else
      { message: 'Failed to create user', errors: user.errors.full_messages }.to_json
    end
  end

  post '/signUp' do
    user_params = JSON.parse(request.body.read)
    user = User.new(user_params['user'])
    
    if user.save
      { message: 'User created successfully', user: user }.to_json
    else
      { message: 'Failed to create user', errors: user.errors.full_messages }.to_json
    end
  end
  
  post '/logIn' do
    user_params = JSON.parse(request.body.read)['user']
  
    user = User.find_by(email: user_params['email'])
  
    if user && user.authenticate(user_params['password'])
      { logged_in: true, user: user }.to_json
    else
      status 401
      { logged_in: false, message: 'Invalid email or password' }.to_json
    end
  end


post '/posts' do
  post_params = JSON.parse(request.body.read)
  post = Post.new(post_params)

  if post.save
    { message: 'Post created successfully', post: post }.to_json
  else
    { message: 'Failed to create post', errors: post.errors.full_messages }.to_json
  end
end

  
  

  # Update a post
  put '/posts/:id' do
    post = Post.find(params[:id])
    post.update(JSON.parse(request.body.read))
    post.to_json
  end

  # Delete a post
  delete '/posts/:id' do
    post = Post.find(params[:id])
    post.destroy
    post.to_json
  end
end
