require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


# создаем сущность
set :database, "sqlite3:weblog.db"


class Post < ActiveRecord::Base
end


get '/' do
	# выбираем список постов из БД

	@results = Post.all

	erb :index			
end

get '/new' do
	# создаем пустой объект чтоб переменная @p определилась при get запросе
	@p = Post.new

	erb :new
end

post '/new' do
	# Принимаем хеш с данными из вида new
	@p = Post.new params[:post]
	@p.save


#	@content = params[:content]
#	@username = params[:username]

	#if content.length < 1
	#	@error = 'Type post text'
	#	return erb :new
	#elsif username.length < 1
	#	@error = 'Type your name'
	#	return erb :new
	#end

	# сохранение ввода при не полном заполнении данных
#	hh = {
#		:content => 'Type post text',
#		:username => 'Type your name'
#		}


#	@error = hh.select {|key,_| params[key] == ""}.values.join(", ")

#	if @error != ""
#		return erb :new
#	end

  
  	# сохранение данных в БД

#	@db.execute 'insert into Posts (content, created_date, username) values (?, datetime(), ?)', [@content, @username]
	
	# перенаправление на главную страницу

#	redirect to '/'
end

#get '/details/:post_id' do
  	# получаем переменную из url'a
#	post_id = params[:post_id]

	# получаем список постов
	# (у нас будет только один пост)
#	results = @db.execute 'select * from Posts where id = ?', [post_id]
	
	# выбираем этот один пост в переменную @row
#	@post_detail = results[0]

#	erb :details
#end