class Device < ActiveRecord::Base

    
    validates :uuid, presence: true, uniqueness:{scope: :app_id} # uuid unique par application
    validates :tokken, presence: true, uniqueness:{scope: :app_id}
    
    belongs_to :app, counter_cache: true
    
    
end
