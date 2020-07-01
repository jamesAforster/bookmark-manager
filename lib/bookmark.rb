require 'pg'

class Bookmark
def self.all
  begin
    con = PG.connect :dbname => 'bookmark_manager', :user => 'makersadmin'
    rs = con.exec "SELECT * FROM bookmarks"
    array = []
    rs.each do |row|
      array << row["url"]
    end
    array
    rescue PG::Error => e
  puts e.message 
  ensure
    rs.clear if rs
    con.close if con
  end
  end
end
