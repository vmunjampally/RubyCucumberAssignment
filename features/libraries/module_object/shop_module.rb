module ShopModule
  def optus_logo
    @browser.div('aria-label': 'Optus Logo')
  end

  def shop_button(button_name)
    @browser.button('aria-label': button_name).wait_until(&:present?)
  end

  def mobile_button(text_name)
    @browser.a(text: text_name).wait_until(&:present?)
    end

  def mobile_phones_text(text_present)
    @browser.span(text: text_present).wait_until(&:present?)
  end

  def mobile_filter(text_present)
    @browser.label(for: text_present).wait_until(&:present?)
  end

  def new_customer(text_present)
    @browser.div('aria-label': text_present).wait_until(&:present?)
  end

  def proceed_newcustomer(text_present)
    @browser.span(text: text_present).wait_until(&:present?)
  end

  def cofirm_your_order
    @browser.h4(text: 'Confirm your order').wait_until(&:present?)
  end

  def data_sim_filter(arialabel,text_present)
    @browser.button('aria-label': arialabel,text:text_present).wait_until(&:present?)
  end

  def button_name(text_button)
    @browser.span(text:'Physical SIM').wait_until(&:present?)
    @browser.button(text:text_button).wait_until(&:present?).click
  end

  def checkout(text_button)
    @browser.button(text:text_button).wait_until(&:present?).click
  end

  def select_tablet_plan
    @browser.div(class:'sc-eWVKcp eqClLV cta').wait_until(&:present?)
  end

  def select_tablet(text_button)
    @browser.button('aria-label':text_button).wait_until(&:present?)
  end

  def input_for_checkout(id,input_text)
    @browser.input(id: id).send_keys(input_text)
  end

  def autocomplete_selection
    @browser.div(class:'all-results  ').ul.li(index:1).click
  end

  def check_box_check
    @browser.input(name:'areDetailsConfirmed').parent.click
  end

  def button_select
    @browser.a('aria-label':'Next',text:'Next').click
  end

  def button_next
    @browser.button(text:'Next').click
  end

  def button_select_occupation
    @browser.a('aria-label':'Next',text:'Next').click
  end

  def header_occupation(text_header)
    @browser.h2(text:text_header).wait_until(&:present?)
  end

  def input_from_dropdown(id,input_text)
    driver = @browser.driver
    drop = driver.find_element(:id, id)
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, input_text)
  end

end