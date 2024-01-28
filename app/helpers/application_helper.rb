module ApplicationHelper
  def timeago(date, format: :long, refresh_interval_millis: 5000, add_suffix: true)
    return if date.blank?

    content = I18n.l(date, format: format)

    tag.time(content,
      title: content,
      data: {
        controller: "timeago",
        timeago_datetime_value: date.iso8601,
        timeago_refresh_interval_value: refresh_interval_millis,
        timeago_add_suffix_value: add_suffix ? "" : nil
      }.compact)
  end
end
