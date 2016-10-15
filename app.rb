require 'sinatra'
require 'sinatra/cookies'
#require 'active/support/all'
require_relative "lib/picas_fijas_oop"

get '/' do
  fp = PicasFijas.new
  fp.generate_number
  response.set_cookie(:number, value: fp.guessed_number)
#  fp.format_user_number(1234.to_s)
  fp.fijas_picas
  @fijas= fp.fijas
  @picas= fp.picas

  erb :index
end

get '/winner' do
  erb :winner
end

post '/' do
  fp2 = PicasFijas.new
  fp2.format_cookie_number(cookies[:number])####TODO
  fp2.format_user_number(params[:user_number])
  fp2.fijas_picas
  @fijas = fp2.fijas
  @picas = fp2.picas
  if fp2.fijas == 4
    erb :winner
  else
    erb :index
  end
end
