require 'sinatra'
require 'line/bot'
require 'docomo'
require 'sticker'

def client
  @client ||= Line::Bot::Client.new { |config|
    config.channel_id = ENV["LINE_CHANNEL_ID"]
    config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
    config.channel_mid = ENV["LINE_CHANNEL_MID"]
  }
end

get '/' do
  'chocoboty'
end

post '/callback' do
  signature = request.env['HTTP_X_LINE_CHANNELSIGNATURE']
  unless client.validate_signature(request.body.read, signature)
    error 400 do 'Bad Request' end
  end

  receive_request = Line::Bot::Receive::Request.new(request.env)

  receive_request.data.each { |message|
    sticker = Sticker.new.pickup
    case message.content
    # Line::Bot::Receive::Message
    when Line::Bot::Message::Text
      client.send_text(to_mid: message.from_mid, text: Docomo.new(message.content[:text]).reply)
    # Line::Bot::Receive::Operation
    when Line::Bot::Operation::AddedAsFriend
      client.send_sticker(to_mid: message.from_mid, stkpkgid: 2, stkid: 144, stkver: 100)
      client.send_text(to_mid: message.from_mid, text: 'よろしくー')
    when Line::Bot::Message::Image
      client.send_sticker(to_mid: message.from_mid, stkpkgid: sticker[:stkpkgid], stkid: sticker[:stkid], stkver: sticker[:stkver])
      client.send_text(to_mid: message.from_mid, text: '画像送られても...わかないよー')
    when Line::Bot::Message::Video
      client.send_sticker(to_mid: message.from_mid, stkpkgid: sticker[:stkpkgid], stkid: sticker[:stkid], stkver: sticker[:stkver])
      client.send_text(to_mid: message.from_mid, text: '動画送られても...わかないよー')
    when Line::Bot::Message::Sticker
      client.send_sticker(to_mid: message.from_mid, stkpkgid: sticker[:stkpkgid], stkid: sticker[:stkid], stkver: sticker[:stkver])
      client.send_text(to_mid: message.from_mid, text: 'スタンプ返し！')
    else
      client.send_sticker(to_mid: message.from_mid, stkpkgid: sticker[:stkpkgid], stkid: sticker[:stkid], stkver: sticker[:stkver])
    end
  }

  "OK"
end
