class Games
  
  def janken
    hands = ["グー", "チョキ", "パー"]
    player_1 = 0
    rival_1 = 0
    @judgement = 0
    while player_1 == rival_1 do
      puts "じゃんけん..."
      puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"
      player_1 = gets.to_i
      rival_1 = rand(3)
      return unless player_1.between?(0, 2) #入力値が0~2以外であればメソッドから抜ける
      puts "ポイ!"
      puts "---------------------------------"
      puts "あなた: #{hands[player_1]}を出しました"
      puts "相手: #{hands[rival_1]}を出しました"
      puts "---------------------------------"
    end
    case (player_1 - rival_1 + 3) % 3
    when 2 #プレイヤーの勝ち
      @judgement = 2
    when 1 #プレイヤーの負け
      @judgement = 1
    end
  end


  def atchimuitehoi
    direction = ["上", "下", "左", "右"]
    @total_judgement = 0
    return if @judgement == 0 #じゃんけんの勝敗がついていない場合はメソッドを抜ける
    puts "あっち向いて〜"
    puts "0(上) 1(下) 2(左) 3(右)"
    player_2 = gets.to_i
    rival_2 = rand(4)
    puts "ホイ!"
    puts "---------------------------------"
    puts "あなた: #{direction[player_2]}"
    puts "相手: #{direction[rival_2]}"
    puts "---------------------------------"
    if @judgement == 2 && player_2 == rival_2
      @total_judgement = 2
      puts "=> あなたの勝ち!"
    elsif @judgement == 1 && player_2 == rival_2
      @total_judgement = 1
      puts "=> あなたの負け"
    else
      puts "=> 引き分け"
    end
  end


  def repeat(n) #n回戦する
    result = [0, 0]
    while result.sum < n do
      puts "<< #{result.sum + 1}回戦目 >>"
      janken
      atchimuitehoi
      break if @judgement == 0 #じゃんけんで勝敗がついていない場合はループを抜ける
      if @total_judgement == 2
        result[0] += 1
      elsif @total_judgement == 1
        result[1] += 1
      end
    end
    puts ""
    puts "================================="
    puts "最終結果: #{result[0]}勝#{result[1]}敗"
    puts "================================="
  end

end




puts "何回戦いますか？　数字を入力してください"
n = gets.to_i
game = Games.new
game.repeat(n)