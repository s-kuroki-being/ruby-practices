#!/usr/bin/env ruby

#日付を扱うためのライブラリを読み込む
require 'date'

#コマンドライン引数を処理するためのライブラリを読み込む
require 'optparse'

#オプションの初期値を設定
options = { m: Date.today.month, y: Date.today.year }

#コマンドラインの引数を読み込み、オプションに格納する
OptionParser.new do |opt|
    opt.on('-m VAL') { |v| options[:m] = v.to_i } #月を指定するオプション
    opt.on('-y VAL') { |v| options[:y] = v.to_i } #年を指定するオプション
    opt.parse!(ARGV)
end

#今日の日付を求める
#today = Date.today
#今月の最初の日と最後の日を求める
#first_day = Date.new(today.year, today.month, 1) #オプションを使用して値を取得するため、削除
#last_day = Date.new(today.year, today.month, -1)
first_day = Date.new(options[:y], options[:m], 1)
last_day = Date.new(options[:y], options[:m], -1)

#カレンダーのヘッダを出力
#puts "      #{today.month}月 #{today.year}"
puts "      #{options[:m]}月 #{options[:y]}"
puts "日 月 火 水 木 金 土"

#最初の日までの曜日のスペースを空ける
##Rubyでは文字列に掛け算をすると、その回数分だけ繰り返してくれる。
##改行はしないため、putsではなくprintを使う。
print "   " * first_day.wday

#最初の日から最後の日までループして表示
## (開始日..終了日) と書くと、その間のすべての日付の集まりになる。
(first_day..last_day).each do |date|
    print date.day.to_s.rjust(2) + " " #2文字分の幅で日付を右寄せ＋空白を足して表示する

    #土曜日だったら改行する
    if date.saturday? && date != last_day #最後の日が土曜日だった場合は改行しない
        print "\n" #「puts ""」でもOK
    end
end

#最後に改行する
print "\n\n"
