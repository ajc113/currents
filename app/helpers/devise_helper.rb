module DeviseHelper
  def devise_error_messages!
    puts "the errors are #{resource.errors.inspect}".red
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-danger"> <button type="button"
    class="close" data-dismiss="alert">×</button>
      #{messages}
    </div>
    HTML

    html.html_safe
  end
end