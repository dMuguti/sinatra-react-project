class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Add your routes here
  get "/" do
    { message: "Hello from your Sinatra API!" }.to_json
  end
  
  # Fetch all posts
  get '/posts' do
    Post.all.to_json
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
