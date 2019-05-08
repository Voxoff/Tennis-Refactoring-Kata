
class TennisGame1
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @p1_points = 0
    @p2_points = 0
  end

  def won_point(player_name)
    if player_name == "player1"
      @p1_points += 1
    else
      @p2_points += 1
    end
  end

  def even_points
    deuce? ? 'Deuce' : "#{scores[@p1_points]}-All"
  end

  def deuce?
    @p1_points >= 3 && @p1_points >= 3
  end

  def win_or_advantage(res)
    res.abs >= 2 ? winner(res) : advantage(res)
  end

  def winner(res)
    res >= 2 ? 'Win for player1' : 'Win for player2'
  end

  def advantage(res)
    res == 1 ? 'Advantage player1' : 'Advantage player2'
  end

  def scores
    {
      0 => 'Love',
      1 => 'Fifteen',
      2 => 'Thirty',
      3 => 'Forty'
    }
  end

  def score
    if @p1_points == @p2_points
      even_points
    elsif @p1_points >= 4 || @p2_points >= 4
      win_or_advantage(@p1_points - @p2_points)
    else
      "#{scores[@p1_points]}-#{scores[@p2_points]}"
    end
  end
end

class TennisGame2
  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @p1_points = 0
    @p2_points = 0
  end

  def won_point(playerName)
    if playerName == @player1Name
      p1Score()
    else
      p2Score()
    end
  end

  def score
    result = ""
    if @p1_points == @p2_points and @p1_points < 3
      if @p1_points == 0
        result = "Love"
      end
      if (@p1_points==1)
        result = "Fifteen"
      end
      if (@p1_points==2)
        result = "Thirty"
      end
      result += "-All"
    end
    if (@p1_points==@p2_points and @p1_points>2)
        result = "Deuce"
    end

    p1res = ""
    p2res = ""
    if (@p1_points > 0 and @p2_points==0)
      if (@p1_points==1)
        p1res = "Fifteen"
      end
      if (@p1_points==2)
        p1res = "Thirty"
      end
      if (@p1_points==3)
        p1res = "Forty"
      end
      p2res = "Love"
      result = p1res + "-" + p2res
    end
    if (@p2_points > 0 and @p1_points==0)
      if (@p2_points==1)
        p2res = "Fifteen"
      end
      if (@p2_points==2)
        p2res = "Thirty"
      end
      if (@p2_points==3)
        p2res = "Forty"
      end

      p1res = "Love"
      result = p1res + "-" + p2res
    end

    if (@p1_points>@p2_points and @p1_points < 4)
      if (@p1_points==2)
        p1res="Thirty"
      end
      if (@p1_points==3)
        p1res="Forty"
      end
      if (@p2_points==1)
        p2res="Fifteen"
      end
      if (@p2_points==2)
        p2res="Thirty"
      end
      result = p1res + "-" + p2res
    end
    if (@p2_points>@p1_points and @p2_points < 4)
      if (@p2_points==2)
        p2res="Thirty"
      end
      if (@p2_points==3)
        p2res="Forty"
      end
      if (@p1_points==1)
        p1res="Fifteen"
      end
      if (@p1_points==2)
        p1res="Thirty"
      end
      result = p1res + "-" + p2res
    end
    if (@p1_points > @p2_points and @p2_points >= 3)
      result = "Advantage " + @player1Name
    end
    if (@p2_points > @p1_points and @p1_points >= 3)
      result = "Advantage " + @player2Name
    end
    if (@p1_points>=4 and @p2_points>=0 and (@p1_points-@p2_points)>=2)
      result = "Win for " + @player1Name
    end
    if (@p2_points>=4 and @p1_points>=0 and (@p2_points-@p1_points)>=2)
      result = "Win for " + @player2Name
    end
    result
  end

  def setp1Score(number)
    (0..number).each do |i|
        p1Score()
    end
  end

  def setp2Score(number)
    (0..number).each do |i|
      p2Score()
    end
  end

  def p1Score
    @p1_points +=1
  end

  def p2Score
    @p2_points +=1
  end
end

class TennisGame3
  def initialize(player1Name, player2Name)
    @p1N = player1Name
    @p2N = player2Name
    @p1 = 0
    @p2 = 0
  end

  def won_point(n)
    if n == @p1N
        @p1 += 1
    else
        @p2 += 1
    end
  end

  def score
    if (@p1 < 4 and @p2 < 4) and (@p1 + @p2 < 6)
      p = ["Love", "Fifteen", "Thirty", "Forty"]
      s = p[@p1]
      @p1 == @p2 ? s + "-All" : s + "-" + p[@p2]
    else
      if (@p1 == @p2)
        "Deuce"
      else
        s = @p1 > @p2 ? @p1N : @p2N
        (@p1-@p2)*(@p1-@p2) == 1 ? "Advantage " + s : "Win for " + s
      end
    end
  end
end
