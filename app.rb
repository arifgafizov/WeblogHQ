require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


# создаем сущность
set :database, "sqlite3:weblog.db"


class Post < ActiveRecord::Base
	# Параметры валидации: валидация на пустое значение  и на минимум 3 знака имени
	validates :content, presence: true
	validates :username, presence: true, length: { minimum: 3}

end

class Comment < ActiveRecord::Base
end

#before do
	# создаем пустой объект чтоб переменная @p определилась при get запросе
#	@p = Post.new
#end


get '/' do
	# выбираем список постов из БД

	@results = Post.order('created_at DESC')

	erb :index
end

get '/new' do
	@p = Post.new
	erb :new
end

post '/new' do
	# Принимаем хеш с данными из вида new
	@p = Post.new params[:post]

	# Валидация
	if @p.save
		redirect to '/'
	else
		@error = @p.errors.full_messages.first
		erb :new
	end
end

get '/details/:id' do
	@the_post = Post.find(params[:id])
  	# получаем переменную из url'a
#	post_id = params[:post_id]

	# получаем список постов
	# (у нас будет только один пост)
#	results = @db.execute 'select * from Posts where id = ?', [post_id]

	# выбираем этот один пост в переменную @row
#	@post_detail = results[0]

	erb :details
end
