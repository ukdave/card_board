ActionView::Base.field_error_proc = proc do |html_tag, instance|
  input_tag = Nokogiri::HTML5::DocumentFragment.parse(html_tag).at_css(".form-control")
  if input_tag
    feedback_tag = content_tag(:div, instance.error_message.join(", "), class: "invalid-feedback")
    input_tag.add_class("is-invalid").to_s.html_safe + feedback_tag
  else
    html_tag
  end
end
