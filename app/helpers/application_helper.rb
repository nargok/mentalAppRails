module ApplicationHelper

  # ページごとのタイトルを返す
  def full_title(page_title = '')
    base_title = "Mental Training App"
    if page_title.empty?
      base_title
    else
      page_title + "|" + base_title
    end
  end

  def full_logo(page_title = '')
    base_title = "Mental Training App"
    if page_title.empty?
      base_title
    else
      base_title + ' ' + page_title
    end
  end

end
