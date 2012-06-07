module ApplicationHelper

  def wordcounts(aphkey=nil)
    unless aphkey.nil?
      m = Member.find_by_aphkey(aphkey)
      kill = Set.new
      ["Australia", "Australian","member","Minister","motion","members","ministers","motions"].each{|w| kill << w.downcase}
      kill << m.first_name
      kill << m.last_name
      kill << m.constituency

      key = m.aphkey
      words = Hash.new(0)
      Speech.where(:member_id => m.aphkey).each do |speech|
        speech.content.split(/[\W]+/).delete_if{|w| ((w.length <= 4) || (kill.include?(w.downcase))) }.each{|w| words[w.downcase]+=1 }
      end
      return words.sort_by{|x,y| y}.last(50).reverse
    end
  end

end
