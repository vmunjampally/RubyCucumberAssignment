require 'rubygems'
require 'selenium/webdriver'
require 'rspec/expectations'
require 'watir-webdriver'
require 'yaml'
require 'uri'
require 'csv'
require 'pathname'
require 'jsonpath'
require 'rake'
require 'pry'
require_relative './list_tags'
require_relative '../support/env_select.rb'

#-----------------------------------------------------------------#


# Set the report path for screenshots
if ENV['rerun']
  @@report_path = 'html_rerun_reports'
else
  @@report_path = 'html_reports'
end

Before do |scenario|
  #get all the tags associated with the scenario
  @scenario_tags = scenario.source_tag_names
  p " Current Browser value is :::::: #{$browser} :::Opening Browser now"
  $scenario = scenario
  tries=0
  begin
    p " Current Browser value is :::::: #{$browser} :::Opening Browser now"
    envSelect
    @browser = $browser
    @browser.cookies.clear
    @browser.window.resize_to(1366,768)
  rescue => e
    puts "The Error: #{e.to_s}"
    if tries<2
      tries+=1
      puts 'failed to open the browser trying to relaunch'
      retry
    else
      abort 'failed to open the browser'
    end
  end
  @timeout=200

  #get all the tags associated with the scenario
  @scenario_tags = scenario.source_tag_names
end

After do |scenario|
  #this will create the array of data required to create csv file to upload into ALM
  #handling time out errors on grid by using this rescue
  begin
    #taking screenshots on failures or when run in PROD
    if @scenarioStatus.to_s.include?('fail') or @envtype.to_s.include?('PROD')
    end
    @browser.close
    unless defined?($addons).nil?
      $addons.clear
    end
  rescue => e
    screenshot2
    @browser.close
    p "Error occurred due to : #{e}"
  end
  p 'Closed Browser'
end

at_exit do
  $browser.close
end
