class PageHeaderComponent < ApplicationComponent
  attr_reader :title, :pretitle

  def initialize(title:, pretitle: nil)
    @title = title
    @pretitle = pretitle
  end
end
