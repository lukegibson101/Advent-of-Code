require './input/day7.rb'


def run_update(input)
  current_directory = []
  dir_to_delete = []
  directory_sizes = Hash.new { |k, v| k[v] = 0}
  results = input
    .split("\n").map(&:chomp).map{_1.split(' ')}
    .each do |line|
      case line
      in ['$', 'cd', '..']
        current_directory.pop
      in ['$', 'cd', dir]
        current_directory << dir
      in ['$', 'ls']
      in ['dir', name]
      in [size, filename]
        current_directory.length.times do |i|
          directory_sizes[current_directory[0..i]] += size.to_i
        end
      end
    end
  total_size = directory_sizes.inject(0) {|sum, (dir, size)| size <= 100000 ? sum + size : sum}

  #part 2
  filesystem = 70000000 
  freespace = filesystem - directory_sizes.first[1]
  update_space = 30000000
  needed_space = update_space - freespace
  directory_sizes.each do |dir, size|
    dir_to_delete << size if size >= needed_space
  end
  dir_to_delete = dir_to_delete.sort.first

  puts "Part 1: Sum of total sizes of directories with a total size of at most 100,000 is #{total_size}"
  puts "Part 2: Total size of directory to be deleted is #{dir_to_delete}"
end


run_update(input)

