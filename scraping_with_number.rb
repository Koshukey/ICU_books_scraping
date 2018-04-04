require 'selenium-webdriver'
require 'pry'
require 'mechanize'

  puts "-------検索でヒットした本一覧-------"

  driver = Selenium::WebDriver.for :chrome #ドライバ選択
  driver.navigate.to "https://opac.icu.ac.jp/" #移動サイト指定
  search_form = driver.find_element(:name,"kywd1_exp")
  search_form.send_keys("タンパク質")
  #検索フォームに入力
  driver.find_element(:xpath, '//*[@id="file_exp2"]').click
  #日本語の本にチェックボックス
  driver.find_element(:xpath, '//*[@id="panel_0"]/div/div[3]/table/tbody/tr/td[1]/a').click
  #検索ボタンをクリック

  driver.find_element(:xpath, '//*[@id="chg_all_check0"]').click
  #チェックボックスにチェックを入れて全てを選択
  driver.find_element(:xpath, '//*[@id="local_list_aera"]/div[5]/div[4]/table/tbody/tr/td[3]/span/a').click
  #選択したものの情報を表示ボタンを押す

  sleep(5)

puts driver.find_element(:xpath,'//*[@id="enclose_bhold"]/div/table/tbody/tr[2]/td[3]').text
puts driver.find_element(:xpath,'(//*[@id="enclose_bhold"]/div/table/tbody/tr[2]/td[3])[1]').text
puts driver.find_element(:xpath,'(//*[@id="enclose_bhold"]/div/table/tbody/tr[2]/td[3])[2]').text
puts driver.find_element(:xpath,'(//*[@id="enclose_bhold"]/div/table/tbody/tr[2]/td[3])[3]').text
puts driver.find_element(:xpath,'(//*[@id="enclose_bhold"]/div/table/tbody/tr[2]/td[3])[4]').text
puts driver.find_element(:xpath,'(//*[@id="enclose_bhold"]/div/table/tbody/tr[2]/td[3])[5]').text



# agent = Mechanize.new
# agent.user_agent_alias = 'Windows IE 9'
# scraping_page = 'https://opac.icu.ac.jp/opac/opac_list.cgi'


# # binding.pry
# current_page = agent.get(scraping_page)
# binding.pry
# book_number_boxes = current_page.search('//*[@id="enclose_bhold"]/div/table/tbody/tr[2]/td[3]')

# book_number_boxes.each do |book_number|

  sleep(3)
  puts "---------------------------------"


