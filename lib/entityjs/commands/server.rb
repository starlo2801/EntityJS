module Entityjs
  
  class Server < Sinatra::Base
    
    def self.run(args)
      
      if !Dirc.game?
        return 2
      end
      
      set :public_folder, Dirc.game_root
      
      puts "Your game is here:"
      puts "  http://localhost:2345/"
      puts ""
      puts "Your tests are here:"
      puts "  http://localhost:2345/tests"
      puts ""
      
      Entityjs::Server.run! :port=>2345
    end
    
    get '/' do
      
      Page.render_play()
      
    end
    
    get '/tests' do
      
      Page.render_test()
      
    end
    
    #entity source code
    get '/entityjs/*' do
      content_type 'text/javascript'
     
      Page.render_entityjs_src(params[:splat].first)
    end
    
    #qunit testing stuff
    get '/qunit/*' do
      file = params[:splat].first
      if file.match /\.js$/
        content_type 'text/javascript'
      else
        content_type 'text/css'
      end
      
      Page.render_eunit(file)
    end
    
    
  end
  
end