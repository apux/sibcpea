module ApplicationHelper
  def link_to_remove name, f
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_create name, objeto, f
    class_name = objeto.class.to_s.underscore.downcase
    association = class_name.pluralize
    fields = f.fields_for(association, objeto, :child_index => "new_#{class_name}") do |builder| 
      render "#{class_name}_fields", :f => builder 
    end
    link_to_function(name, "add_fields(this, '#{class_name}', '#{escape_javascript(fields)}')")
  end
end
