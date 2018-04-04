require 'selenium-webdriver'
require 'pry'
require 'mechanize'

def search_books(search_word)

  puts "-------検索でヒットした本一覧-------"
  driver = Selenium::WebDriver.for :chrome #ドライバ選択
  driver.navigate.to "https://opac.icu.ac.jp/" #移動サイト指定
  search_form = driver.find_element(:name,"kywd1_exp")
  search_form.send_keys(search_word)
  #検索フォームに入力
  driver.find_element(:xpath, '//*[@id="file_exp2"]').click
  #日本語の本にチェックボックス
  driver.find_element(:xpath, '//*[@id="panel_0"]/div/div[3]/table/tbody/tr/td[1]/a').click
  #検索ボタンをクリック
  driver.find_element(:xpath, '//*[@id="chg_all_check0"]').click
  #チェックボックスにチェックを入れて全てを選択
  driver.find_element(:xpath, '//*[@id="local_list_aera"]/div[5]/div[4]/table/tbody/tr/td[3]/span/a').click
  #選択したものの情報を表示ボタンを押す

  sleep(7)

  book_title_head_xpath = '(//*[@id="bb_ttl"]/a)['
  book_title_last_xpath = ']'
  book_number_head_xpath = '(//*[@id="enclose_bhold"]/div/table/tbody/tr[2]/td[3])['
  book_number_last_xpath = ']'
  line = "---------------------------------------------"

  i = 1
  while i <21 do
    book_title_xpath = "#{book_title_head_xpath}" +  "#{i}"  +"#{book_title_last_xpath}"
    book_number_xpath = "#{book_number_head_xpath}" + "#{i}" + "#{book_number_last_xpath}"
    puts line
    puts driver.find_element(:xpath, "#{book_title_xpath}").text
    puts driver.find_element(:xpath, "#{book_number_xpath}").text
    puts line
    i += 1
  end
  #ヒットした本を出力させる

  j = 1
  while j <21 do
    book_title_xpath = "#{book_title_head_xpath}" +  "#{j}"  +"#{book_title_last_xpath}"
    book_number_xpath = "#{book_number_head_xpath}" + "#{j}" + "#{book_number_last_xpath}"
    book_title = driver.find_element(:xpath, "#{book_title_xpath}").text
    book_number = driver.find_element(:xpath, "#{book_number_xpath}").text
    File.open("books_list.txt","a"){|f|
      f.write("#{line}\n")
      f.write( "タイトル : #{book_title}\n")
      f.write("書籍番号 : #{book_number}\n")
    }
    j += 1
  end
#book_list.txtというファイルにも一応記述させる
end


  while true do
    puts "調べたい本を入力してください"
      search_word = gets.chomp
    search_books(search_word)
  end
