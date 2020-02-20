class MovieController < Sinatra::Base
    configure do
     set :public_folder, 'public'
     set :views, 'app/views/movies'
     set :method_override, true
    end


    get "/movies" do
        @movies = Movie.all
        erb :index
    end

    get '/movies/new' do
        erb :new
    end

    post '/movies' do
        name = params[:name]
        release_date = params[:release_date]
        genre = params[:genre]
        movie = Movie.create(name: name, release_date: release_date, genre: genre)
        redirect "/movies/#{movie.id}"
    end

    put '/movies/:id' do 
        movie = Movie.find(params[:id])
        movie.update(name: params[:name], release_date: params[:release_date], genre: params[:genre])
        redirect "/movies/#{movie.id}"
    end

    get '/movies/:id' do 
        id = params[:id]
        @movie = Movie.find(id)
        erb :show
    end

    delete '/movies/:id' do 
        @movie = Movie.find(params[:id])
        @movie.delete
        redirect '/movies'
    end

    get '/movies/:id/edit' do 
        @movie = Movie.find(params[:id])
        erb :edit
    end


end