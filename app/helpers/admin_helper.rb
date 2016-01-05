module AdminHelper
  def table_text(text)
    truncate(strip_tags(text.html_safe), length: 75, omission: '...') unless text.nil?
  end

  def date_selector(f, symbol)
    bootstrap_date_selector(f, symbol, 'date-picker', '%F')
  end

  def date_time_selector(f, symbol)
    bootstrap_date_selector(f, symbol, 'date-time-picker', '%F %I:%M %p')
  end


  def bootstrap_date_selector(f, symbol, css_class, format)
    time = f.object.send(symbol)
    time = Time.now unless time  
    f.input symbol,
      as: :string,
      wrapper_html: {
        class: css_class
      },
      input_html: {
        class: 'form-control',
        value: time.strftime(format)
      }
  end
end
