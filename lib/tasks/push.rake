namespace :push do
    
    task :push => :environment do
        puts "---------------------------"
        puts "Début de la gestion du push"
        puts "---------------------------"
        require "rss"
    
        Feed.find_each do |feed|
            begin
                push = false
                items = RSS::Parser.parse(open(feed.url).read, false).items[0..2]
                items.each do |item|
                    if item.pubDate.to_datetime > feed.push_date.to_datetime
                       push = true
                       puts "# Push #{feed.name} -- #{item.title}"
                       APNS.host = "gateway.push.apple.com"
                       APNS.port = 2195
                       APNS.pass = ""
                       APNS.pem = feed.app.certificat_ios_url
                       feed.app.devices.find_each do |device|
                           APNS.send_notification(device.token, alert: item.title, badge: 1, sound: true)
                       end
                    end  
                end
                feed.update!(push_date: DateTime.now) if push == true

            rescue => e
                puts "ERROR : #{e.message}"
                puts "ERROR : Flux #{feed.name} #{feed.url} est injoignable"
            end
        
        end
    
    end
    
    
end
