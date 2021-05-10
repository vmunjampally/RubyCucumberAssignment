Given('I load {string} in the browser') do |url|
  if $browser.nil?
    abort 'Couldnt open browser instance due to grid/node issue'
  end
  retries = 3
  begin
    loaded_url = url.to_s
    @browser.goto(loaded_url)
    @browser.driver.manage.window.maximize
  rescue =>e
    p "Error in loading the base URL :#{loaded_url} with error : #{e}"
    if retries > 0
      puts "\tTrying #{retries} more times\n"
      retries -= 1
      sleep(20)
      retry
    end

    @browser.goto(loaded_url)
    @browser.driver.manage.window.maximize
    screenshot
  end
  puts "Navigationg to #{loaded_url}"
  cookiearray= @browser.cookies.to_a
  cookiearray.each do |cookie|
    if cookie[:name] == 'OPSESSIONID'
      p 'The Value of OPSESSIONID is : ' + cookie[:value]
    end
  end
end

Then('Optus home page is loaded in the browser') do
  tries=0
  begin
    $page=ShopPage.new(@browser)
  rescue
    if tries < 2
      tries+=1
      @browser.refresh
      retry
    end
  end
  expect($page.optus_logo.present?).to be true
  puts 'Optus Home Page successfully loaded'
end

And('I click on {string} button') do |button_name|
  $page.shop_button(button_name).click
end

And('I click on {string} from dropdown') do |text_name|
  $page.mobile_button(text_name).click
  end

And('I clicked on the {string} dropdown') do |text_name|
  $page.mobile_phones_text(text_name).click
  puts "Selected filter #{text_name}"
end

And('I select brand name for filter') do
  $page.mobile_filter('brand-Apple').click
  puts 'Apple brand mobile selected'
end

And('I select memory for filter') do
  $page.mobile_filter('internalMemory-256GB - 512GB').click
  puts 'Internal memory 256GB - 512GB selected'
  end

And('I select internet speed for filter') do
  $page.mobile_filter('networkSpeed-5G').click
  puts '5G network speed selected'
end

And('I select payment terms for filter') do
  $page.mobile_filter('contractLengthFilterName-24 months').click
  puts '24 months contract selected'
end

And('I sort by {string}') do |sort_by|
  case sort_by
  when 'Name'
    $page.mobile_filter('sortValue-Name').click
    puts 'Sorted by Name'
  when 'On Sale'
    $page.mobile_filter('sortValue-On Sale').click
    puts 'Sorted by On Sale'
  when 'High'
    $page.mobile_filter('sortValue-Price Highest to Lowest').click
    puts 'Sorted by Highest to lowest'
  when 'Low'
    $page.mobile_filter('sortValue-Price Lowest to Highest').click
    puts 'Sorted by Lowest to Highest'
  else
    puts 'Invalid Element Name'
  end
end

When('I landed on Shop page') do
  tries=0
  begin
    $page=ShopPage.new(@browser)
  rescue
    if tries < 2
      tries+=1
      @browser.refresh
      retry
    end
  end
  expect($page.mobile_phones_text('Mobile Phones').present?).to be true
  puts 'Optus Phone Page successfully loaded'
end

When('I landed on purchase page') do
  tries=0
  begin
    $page=ShopPage.new(@browser)
  rescue
    if tries < 2
      tries+=1
      @browser.refresh
      retry
    end
  end
  puts 'Optus Phone Page successfully loaded'
end

When('I landed on Data Sim page') do
  tries=0
  begin
    $page=ShopPage.new(@browser)
  rescue
    if tries < 2
      tries+=1
      @browser.refresh
      retry
    end
  end
  expect($page.mobile_phones_text('Choose your plan').present?).to be true
  puts 'Optus Phone Page successfully loaded'
end

And('I am in the confirm order page') do
  expect($page.cofirm_your_order).to be true
end

And('I click on {string} button in Datasim page') do |buy_now|
  $page.data_sim_filter("BUY NOW Small Data SIM Plan",buy_now).click
end

And('I am selecting {string} from radio button') do |arg0|
  $page.new_customer(arg0).click
end

And('I am selecting {string} from selection') do |arg0|
  $page.proceed_newcustomer(arg0).click
end

And('I am selecting {string} tablet from selection') do |arg0|
  $page.select_tablet(arg0).click
end

And('I select plan from Device') do |arg0|
  $page.select_tablet_plan.click
end

And('User click on {string} button') do |arg0|
  $page.button_name(arg0)
  end

And('I click on {string} in checkout page') do |arg0|
  $page.checkout(arg0)
end

And('I pass the value for {string} as {string}') do |id, input_text|
  $page.input_for_checkout(id, input_text)
end

And('I select the value for {string} as {string}') do |id, input_text|
  $page.input_from_dropdown(id, input_text)
end

And('I wait for {string} from header to appear') do | input_text|
  $page.header_occupation(input_text)
end

And('I select value from dropdown') do
  $page.autocomplete_selection
end

And('I select next button') do
  $page.button_select
end

And('I check the identification document checkbox') do
  $page.check_box_check
end

And('I select next button in {string} page') do |arg0|
  $page.button_next
end

And('I select next button in the page') do
  $page.checkout('Next')
end
