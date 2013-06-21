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
      #
      # -> ありがとうございます！わかりやすくなりました！
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

  # 指定した文字数だけを取り出す
  def slice_by_length(str, str_length)
    # str[0..str_length-1] でどうか
    #
    # -> これで済みました！
    str[0..str_length-1]
  end
end
