module ApplicationHelper
  # ページごとに完全なタイトルを表示する。
  def full_title(page_title)
    base_title = 'BIGBAG Store'
    if page_title.blank?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
