class ShopPage
  include ShopModule

  def initialize(browser)
    @browser = browser
  end

  def load_wait
    @browser.div(class: 'ux-page-loader').wait_until(&:present?)
  end
end
