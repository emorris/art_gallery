module AdminHelper
  def table_text(text)
    truncate(strip_tags(text.html_safe), length: 75, omission: '...')
  end
end
