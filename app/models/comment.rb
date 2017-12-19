class Comment < ActiveRecord::Base
  belongs_to :post

 

 # def anti_spam
 #    doc = Nokogiri::HTML::DocumentFragment.parse(body)

 #    doc.css('a').each do |a|
 #      a[:rel] = 'nofollow'
 #      a[:target] = '_blank'
 #    end

 #    self.body = doc.to_s
 #  end



end
