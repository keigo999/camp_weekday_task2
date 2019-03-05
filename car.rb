class Car
  # 定数を追加
  UP_SPEED = 10
  DOWN_SPEED = 20
  MAX_PASSENGERS = 4

  @@count = 0
  attr_accessor :number, :color, :passengers
  # speedは外部から設定しないのでreaderで定義
  # @speedが使えるようになる
  attr_reader :speed

  def initialize(number, color)
    @number = number
    @color = color
    # @speedを初期化
    @speed = 0
    @@count += 1
    # 運転手を追加
    @passengers = 1
  end

  # 加速用のメソッド追加
  def speed_up
    @speed += UP_SPEED
    if @speed >= 50
      puts "[ALERT]スピードが#{@speed}になりました。減速します。"
      speed_down
    elsif @speed >= 30
      puts "[ALERT]スピードが#{@speed}になりました。"
    end
  end

  # 減速用のメソッド追加
  def speed_down
    # ifの結果を変数に代入する場合は以下の記述でOK
    @speed = if @speed - DOWN_SPEED < 0
      0
    else
      @speed - DOWN_SPEED
    end
  end

  # 乗車メソッドを追加
  def get_on
    if @passengers < MAX_PASSENGERS
      @passengers += 1
      puts "乗車しました"
    elsif @passengers >= MAX_PASSENGERS
      puts "乗車できません。この車の最大乗車人数は4人です。"
    end
  end 

  def self.count
    @@count  # return @@countの略
  end

  # クラス変数表示メソッドを追加
  def self.count_info
    "Carクラスのクラス変数@@countは#{@@count}です。"
  end
end
# TrackCarクラスの追加(Carクラス継承)
class TrackCar < Car
  attr_reader :load_weight

  def initialize(name, color, load_weight = 500 )
    super(name,color)
    @load_weight = load_weight
  end
end
