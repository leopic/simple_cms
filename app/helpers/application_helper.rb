module ApplicationHelper
  
  def status_tag(boolean, options={})
    options[:true]          ||= ""
    options[:true_class]    ||= "status btn primary"
    options[:false]         ||= ""
    options[:false_class]   ||= "status btn error"
    
    if boolean
      content_tag(:span, options[:true], :class => options[:true_class])
    else
      content_tag(:span, options[:false], :class => options[:false_class])
    end        
  end
  
  def error_messages_for(object)
    render(:partial => "common/error_messages", :locals => {:object => object})
  end
  
end
