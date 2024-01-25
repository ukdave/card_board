class FlashMessageComponent < ApplicationComponent
  attr_reader :type, :message

  def initialize(type:, message:)
    @type = type
    @message = message
  end

  private

  def colour_class
    case type
    when "alert"
      "text-bg-danger"
    when "notice"
      "text-bg-success"
    else
      "text-bg-primary"
    end
  end
end
