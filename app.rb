require 'sinatra'
require 'sinatra/flash'

class MyApp < Sinatra::Base
    
    enable :sessions
    register Sinatra::Flash
    
    get "/hello" do
        erb :hello_form
    end
    
    post "/hello" do
        @name = params["name"]
        
        if @name == nil || @name == ""
            flash["message"] = "I cannot greet you if I don't know your name"
            redirect "/hello"
        else
            session["name"] = @name
        end
        
        erb :hello
    end
end





