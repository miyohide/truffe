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
      # #raw は脆弱性（XSSとか）を生みやすいので気をつけたほうがよいです。
      #
      # あと, #content_tag, %記法を駆使すればもうちょっときれいになりそう
      # see: http://doc.ruby-lang.org/ja/1.9.3/doc/spec=2fliteral.html#percent
      raw('<li class="' + item[:name] + ' selected"><p>') + item[:name] + raw('</p></li>')
    elsif item[:disabled]
      raw('<li class="disabled"><p>') + item[:name] + raw('<span>(準備中)</span></p></li>')
    else
      raw('<li class=' + item[:name] + '>') + link_to(item[:name], item[:link]) + raw('</li>')
    end
  end

  # 指定した文字数だけを取り出す
  def slice_by_length(str, str_length)
    # str[0..str_length-1] でどうか
    c = 0
    str.split(//).inject(""){ |result, char|
      result += char if c < str_length
      c += 1
      result
    }
  end
end
