# -*- encoding: utf-8 -*-
module ApplicationHelper
  def title
    if @page_title.nil?
      t('home.base_title')
    else
      "#{h(@page_title)} | #{t('home.base_title')}"
    end
  end

  def menu_link_to(item)
    if current_page?(item[:link])
      content_tag :li, :class => item[:name] + %q( selected) do
        content_tag :p, item[:name]
      end
    elsif item[:disabled]
      content_tag :li, :class => 'disabled' do
        content_tag :p, item[:name] + '（準備中）'
      end
    else
      content_tag :li, :class => item[:name] do
        link_to(item[:name], item[:link])
      end
    end
  end

  def slice_by_length(str, str_length)
    str[0..str_length-1]
  end
end
