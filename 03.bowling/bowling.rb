#!/usr/bin/env ruby
# frozen_string_literal: true

input_data = ARGV[0]

# 配列の中身を変換
scores = input_data.split(',').map do |score|
  if score == 'X' # strikeの場合
    10 # 数値10を配列に格納
  else
    score.to_i # 数値に変換して配列に格納
  end
end

# 合計点数用の変数作成
total_score = 0

# 配列の中身につけるindex
shot_index = 0

10.times do
  if scores[shot_index] == 10
    # ストライクの場合、スコア（10点）＋次（shot_index + 1）と次の次（shot_index + 2）のスコアを加算する
    total_score += 10 + scores[shot_index + 1] + scores[shot_index + 2]
    # 次の投球に移る
    shot_index += 1
  elsif scores[shot_index] + scores[shot_index + 1] == 10
    # スペアの場合、スコア（10点）＋次の投球（shot_index + 2）のスコアを加算する
    total_score += 10 + scores[shot_index + 2]
    # 次の投球に移る
    shot_index += 2
  else
    # ストライクでもスペアでもない場合、スコアを加算する
    total_score += scores[shot_index] + scores[shot_index + 1]
    # 次の投球に移る
    shot_index += 2
  end
end

# 合計点数を出力
puts total_score
