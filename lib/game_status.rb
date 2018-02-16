# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  a = board
  count = 0
  c1 = 0
  board.each do |ca|
    if ca != "X" && ca != "O"
      count += 1
    end
  end

alpha = nil
  if count < 9
    WIN_COMBINATIONS.each do |combination|
      win_op_1 = combination[0]
      win_op_2 = combination[1]
      win_op_3 = combination[2]
      position_1 = board[win_op_1]
      position_2 = board[win_op_2]
      position_3 = board[win_op_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        alpha = combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        alpha = combination
      end
    end
if alpha == nil
  return false
else
  return alpha
end
elsif count == 9
  return false
end
end

def full?(board)
  val = board
  asdf = val.all? do |asd|
    asd == "X" || asd == "O"
  end
 # val.reject do |as|
  #  as == "X" || as == "O"
 # end
  if asdf == true
  return true
elsif asdf == false
puts " #{val}"
    return false
end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

puts full?(["O", "O", "X", " ", "X", "O", "O", "X", "O"])
