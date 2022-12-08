require './input/day5.rb'


def move_crates(crates, instructions)
  instructions = instructions.split(/\n/)
  for i in 0..instructions.count-1
    instructions[i] = instructions[i].gsub(/\s+/, "").gsub("move", "").gsub("from", " ").gsub("to", " ").split(" ")
    # p instructions[i]
    move = instructions[i][0].to_i
    from = instructions[i][1].to_i - 1
    to = instructions[i][2].to_i - 1
    delete = move - 1
    moved = crates[from].slice(0, move)
    crates[from].slice!(0, move)
    for x in 0..move-1
      crates[to] = crates[to].unshift(moved[x])
    end
  end

  print "Top of each crate: "
  for x in 0..crates.count-1
    print crates[x][0]
  end
  puts ""
end

def move_crates_9001(crates, instructions)
  instructions = instructions.split(/\n/)
  for i in 0..instructions.count-1
    instructions[i] = instructions[i].gsub(/\s+/, "").gsub("move", "").gsub("from", " ").gsub("to", " ").split(" ")
    # p instructions[i]
    move = instructions[i][0].to_i
    from = instructions[i][1].to_i - 1
    to = instructions[i][2].to_i - 1
    delete = move - 1
    moved = crates[from].slice(0, move).reverse
    crates[from].slice!(0, move)
    for x in 0..move-1
      crates[to] = crates[to].unshift(moved[x])
    end
  end

  print "Top of each crate with CrateMover 9001: "
  for x in 0..crates.count-1
    print crates[x][0]
  end
  puts ""
end

move_crates(crates, instructions)
move_crates_9001(crates, instructions)