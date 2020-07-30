class Video < ApplicationRecord

    validates :nome, presence: true   
    validates :url,  presence: true  
    
  
    has_one :view, :class_name => 'View', :foreign_key => 'video_id'
    #belongs_to :user
    belongs_to :user, :class_name => "User"

    def self.search(search)
        if search
            #   find(:all, :conditions => ['nome LIKE ?', "%#{search}%"])
            self.where("nome like ?", "%#{search}%")
            # events = self.where('name LIKE ? OR place LIKE ? OR description LIKE ?', "%#{query}%", "%#{query}%", "%#{query}%")

        else
            self.find(:all)
        end
    end

    def self.search_by(search)
        if search
          self.find_by(nome: search)
        else
          find(:all)
        end
    end
end
