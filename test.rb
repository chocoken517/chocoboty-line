require 'sinatra'
require 'line/bot'
require './docomo'
require './sticker'

puts Talk.new('test').reply
