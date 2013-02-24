# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Sibcpea::Application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  msg = instance.error_message
  error_class = 'field_with_errors'
  if html_tag =~ /<(input|textarea|label)[^>]+class=/
    class_attribute = html_tag =~ /class=['"]/
    html_tag.insert(class_attribute + 7, "#{error_class} ")
  elsif html_tag =~ /<(input|textarea|label)/
    first_whitespace = html_tag =~ /\s/
    html_tag[first_whitespace] = " class='#{error_class}' "
  elsif html_tag =~ /<select/
    html_tag = "<span class='field_with_errors'>#{html_tag}</span>".html_safe
  end
  html_tag
end
