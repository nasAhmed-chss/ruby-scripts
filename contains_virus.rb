def contain_virus(grid)
    expanded_grid = expand_grid_with_zeros(grid)
    rows = expanded_grid.size
    columns = expanded_grid[0].size
    walls = 0

    (1...rows-1).each do |r|
        (1...columns-1).each do |c|
            if expanded_grid[r][c] == 1
                # Count walls without marking the cell as visited yet
                wall_count = 0
                wall_count += 1 if expanded_grid[r - 1][c] == 0
                wall_count += 1 if expanded_grid[r + 1][c] == 0
                wall_count += 1 if expanded_grid[r][c - 1] == 0
                wall_count += 1 if expanded_grid[r][c + 1] == 0
                
                # Add the counted walls to the total wall count
                walls += wall_count
            end
        end
    end

    return walls
end


def expand_grid_with_zeros(grid)
    rows = grid.size
    columns = grid[0].size

    # Create a new grid  with zeros
    expanded_grid = Array.new(rows + 2) { Array.new(columns + 2, 0) }

    # Copy the original grid into expanded grid
    (0...rows).each do |r|
        (0...columns).each do |c|
            expanded_grid[r + 1][c + 1] = grid[r][c]
        end
    end

    # Return the expanded grid
    return expanded_grid
end


# Test the function with the given sample input
isInfected = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]



result = contain_virus(isInfected)
puts "Number of walls needed: #{result}"
