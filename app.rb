require 'sinatra'
require 'line/bot'

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
    case message.content
    # Line::Bot::Receive::Message
    when Line::Bot::Message::Text
      client.send_text(to_mid: message.from_mid, text: message.content[:text])
    # Line::Bot::Receive::Operation
    when Line::Bot::Operation::AddedAsFriend
      client.send_sticker(to_mid: message.from_mid, stkpkgid: 2, stkid: 144, stkver: 100)
    when Line::Bot::Message::Image
      client.send_text(to_mid: message.from_mid, text: '画像送られても、、、')
      client.send_image(to_mid: message.from_mid, image_url: message.content[:originalContentUrl], preview_url: message.content[:previewImageUrl])
    when Line::Bot::Message::Video
      client.send_text(to_mid: message.from_mid, text: '動画送られても、、、')
    end
  }

  "OK"
end
