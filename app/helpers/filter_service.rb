class FilterService

  def intersection(first_list,second_list)
    if first_list.empty?
      second_list
    elsif second_list.empty?
      first_list
    else
      common = []
      first_list.each do |word|
        if second_list.include?(word)
          common << word
        end
      end
      common
    end
  end

end
