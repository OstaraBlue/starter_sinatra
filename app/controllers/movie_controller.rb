class MovieController < Sinatra::Base
    configure do
     set :public_folder, 'public'
     set :views, 'app/views/movies'
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

    


end