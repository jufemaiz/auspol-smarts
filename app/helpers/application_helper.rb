module ApplicationHelper

  def wordcounts(aphkey=nil)
    unless aphkey.nil?
      m = Member.find_by_aphkey(aphkey)
      kill = Set.new
      ["Australia", "Australian","member","Minister","motion"].each{|w| kill << w}
      kill << m.first_name
      kill << m.last_name
      kill << m.constituency

      key = m.aphkey
      words = Hash.new(0)
      Speech.where(:member_id => aphkey).each do |speech|
        speech.content.split(" ").each do |word|
          if !kill.include? word and word.length > 4
            words[word] += 1 
          end
        end
      end
      return words.sort_by{|x,y| y}.last(50).reverse
    end
  end

end
