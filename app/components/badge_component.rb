class BadgeComponent < ApplicationComponent
  def initialize(colour:, subtle: false, text: nil, classes: nil)
    @text = text
    @classes = class_names(
      badge_classes(colour, subtle),
      classes
    )
  end

  private

  def badge_classes(colour, subtle)
    return "fw-normal bg-#{colour}-subtle text-#{colour}" if subtle

    "text-bg-#{colour}"
  end
end
