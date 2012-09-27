# -*- encoding: utf-8 -*-
module ApplicationHelper
  def menu_link_to(item)
    if current_page?(item[:link])
      raw('<li class="' + item[:name] + ' selected"><p>') + item[:name] + raw('</p></li>')
    elsif item[:disabled]
      raw('<li class="disabled"><p>') + item[:name] + raw('<span>(準備中)</span></p></li>')
    else
      raw('<li class=' + item[:name] + '>') + link_to(item[:name], item[:link]) + raw('</li>')
    end
  end

  # 指定した文字数だけを取り出す
  def slice_by_length(str, str_length)
    c = 0
    str.split(//).inject(""){ |result, char|
      result += char if c < str_length
      c += 1
      result
    }
  end
end
