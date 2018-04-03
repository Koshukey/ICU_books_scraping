require 'selenium-webdriver'
require 'pry'

def search_books(search_word)

  driver = Selenium::WebDriver.for :chrome #ドライバ選択
  driver.navigate.to "https://opac.icu.ac.jp/" #移動サイト指定
  search_form = driver.find_element(:name,"kywd1_exp")
  search_form.send_keys(search_word)
  driver.find_element(:xpath, '//*[@id="panel_0"]/div/div[3]/table/tbody/tr/td[1]/a').click
  book_xpath_head = '//*[@id="main_list"]/table['
  book_xpath_last = ']/tbody/tr/td[4]/span/a/strong'
  book_number = 1
  #式展開はダブルquotationでしかできないのにxpathをそのままダブルquotationでくくると正規表現と勘違いされてエラーになるので
  #細かく分けた
  while book_number < 21
    book_xpath = "#{book_xpath_head}"+"#{book_number}"+"#{book_xpath_last}"
    puts  driver.find_element(:xpath, "#{book_xpath}").text
    book_number += 1
  end

  sleep(19)

end



puts "調べたい本を入力してください"
search_word = gets.chomp


search_books(search_word)
