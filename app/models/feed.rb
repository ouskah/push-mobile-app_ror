class Feed < ActiveRecord::Base
    
    
    belongs_to :app
    
    
    
    
    before_create do # generation token de securite
        self.push_date = DateTime.now
    
    end
    
end
