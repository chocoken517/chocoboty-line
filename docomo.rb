require 'docomoru'
class Docomo
  def initialize(message)
    @type = 'dialogue'
    @type = 'knowledge' if message.match(/？$|\?$/)
    @message = message
    @client = Docomoru::Client.new(api_key: ENV['DOCOMO_API_KEY'])
    @response = api
  end

  def api
    return @client.create_dialogue(@message) if @type == 'dialogue'
    @client.create_knowledge(@message)
  end

  def reply
    return dialogue if @type == 'dialogue'
    knowledge
  end

  def dialogue
    @response.body['utt']
  end

  def knowledge
    if @response.body['answers'].empty?
      @type = 'dialogue'
      @response = api
      dialogue
    else
      answers
    end
  end

  def answers
    text = @response.body['message']['textForDisplay'] + "\n"
    @response.body['answers'].each do |value|
      text << value['rank'] + "位\n"
      text << value['answerText'] + "\n"
      text << value['linkText'] + "\n"
      text << value['linkUrl'] + "\n"
    end
    text
  end
end
