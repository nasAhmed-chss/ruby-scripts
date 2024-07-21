#Handles Array changes
module ArrayChanges
  refine Array do
    def [](index)
      if index.is_a?(Integer)
        # Handle negative indices
        index += size if index < 0
        
        if index >= 0 && index < size
          return self.fetch(index)
        else
          return '\0'
        end
      elsif index.is_a?(Range)
        index.map { |i| self.fetch(i < 0 ? i + size : i, '\0') }
      else
        super(index)
      end
    end
#Handles Map changes
    def map(sequence = nil, &block)
      if sequence.nil?
        return super(&block)
      elsif sequence.is_a?(Range)
        # Check if the sequence is valid
        result = sequence.map do |i|
          positive_index = i >= 0 ? i : size + i
          positive_index.between?(0, size - 1) ? block.call(self[positive_index]) : nil
        end
        return result.compact.to_s
      else
        return []
      end
    end
  end
end



# using ArrayChanges  # Enable the ArrayRefinements module for testing

# b = ["cat", "bat", "mat", "sat"]
# result = b.map { |x| x[0].upcase + x[1,x.length] }

# puts result




