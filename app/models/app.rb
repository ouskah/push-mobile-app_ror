class App < ActiveRecord::Base
    
    validates :name, presence: true, length: {minimum: 2}
    
    mount_uploader :certificat_ios, CertificatUploader # pour gem carrierwave 
    
    
    
end
