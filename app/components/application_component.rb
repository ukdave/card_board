class ApplicationComponent < ViewComponent::Base
  # Stolen from https://github.com/primer/view_components/blob/main/lib/primer/class_name_helper.rb
  #
  # Helps build a list of conditional class names
  def class_names(*args)
    args.each_with_object([]) do |class_name, classes|
      case class_name
      when String
        classes << class_name if class_name.present?
      when Hash
        class_name.each { |key, val| classes << key if val }
      when Array
        classes << class_names(*class_name).presence
      end
    end.compact.uniq.join(" ")
  end
end
