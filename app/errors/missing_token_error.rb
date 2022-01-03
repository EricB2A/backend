
class MissingTokenError < StandardError

  attr_accessor :messages

  def http_status
    403
  end

  def code
    "missing_token"
  end

  def initialize(*msg)
    super
    if msg.length == 0
      self.messages = ["invalid token"]
    else
      self.messages = msg
    end
  end

  def to_hash
    {
      messages: messages,
      code: code
    }
  end
end