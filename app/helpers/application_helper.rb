module ApplicationHelper
  def title(title)
    content_for :title do
      title + " - "
    end
  end

  def js(*js)
    content_for :head do
      javascript_include_tag *js
    end
  end

  def css(*css)
    content_for :head do
      stylesheet_link_tag *css
    end
  end

  def current_link(name, url, options={})
    options[:href] = url
    current_class = options[:current_class] || "menu_active"
    if current_page?(url)
      options[:class] = [options[:class], current_class].compact.join(" ")
    end
    content_tag(:a, name, options)

  end
end
