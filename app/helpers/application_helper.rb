module ApplicationHelper
    def devise_error_messages()
    return "" if resource.errors.empty?
    html = ""
    # エラーメッセージ用のHTMLを生成
    messages = resource.errors.full_messages.each do |msg|
      html += <<-EOF
        <div class="error_field alert alert-danger" role="alert">
          <p class="error_msg">#{msg}</p>
        </div>
      EOF
    end
    html.html_safe
  end

  def full_error_message_on(object, field_name, css_class = 'formError')
    errors = object.errors[field_name]
    return "" if errors.blank?

    prepend_text = object.class.human_attribute_name(field_name)
    if errors.is_a?(Array) && errors.size > 0
      html = <<-EOF
        <div class="error_field alert alert-danger" role="alert">
          <p class="error_msg">#{prepend_text} #{errors.first}</p>
        </div>
      EOF
      html.html_safe
    end
  end
end
