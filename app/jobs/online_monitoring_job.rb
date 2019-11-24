require './app/helpers/vk_api_helper'

module OnlineMonitoringJob

  include VkApiHelper

  #OnlineMonitoring.perform_now
  def scan(auth_token)
    while true
      begin
        users = User.all
        users_data = get_users(users, auth_token)['response']

        users_data.each do |user|

          user_record = users.where(:vk_id => user['id'].to_s).first

          if ((user_record.state == "offline" && user['online'] == 0) || (user_record.state == "online" && user['online'] == 1 && user['online_mobile'] == nil) || (user_record.state == "mobile" && user['online'] == 1 && user['online_mobile'] == 1))

          else
            now = DateTime.now + 3.hours
            now_strftime = now.strftime("%d.%m.%Y %H:%M:%S")

            if (user['online'] == 1 && user['online_mobile'] == nil)
              #  06.01.2019 16:07:50
                Rails.logger.info(user['id'].to_s + " " + now_strftime + " " + "Online");

                File.open("storage/WhenOnline" + user['id'].to_s + ".txt", 'a') { |f| f.puts(now_strftime + " " + "Online") }

                user_record.state = 'online'
                user_record.save
            end

            if (user['online'] == 1 && user['online_mobile'] == 1)
                Rails.logger.info(user['id'].to_s + " " + now_strftime + " " + "Mobile");

                File.open("storage/WhenOnline" + user['id'].to_s + ".txt", 'a') { |f| f.puts(noww.strftime("%d.%m.%Y %H:%M:%S") + " " + "Mobile") }

                user_record.state = 'mobile'
                user_record.save
            end

            if (user['online'] == 0)
              Rails.logger.info(user['id'].to_s + " " + now_strftime + " " + "Offline");

              File.open("storage/WhenOnline" + user['id'].to_s + ".txt", 'a') { |f| f.puts( now_strftime + " " + "Offline") }

              user_record.state = 'offline'
              user_record.save
            end
          end
        end
      rescue => exception
        Rails.logger.error("ERROR: " + exception.message)
        Rails.logger.error("BACKTRACE: " + exception.backtrace[0].to_s)
        sleep 0.34
      end
      sleep 5
    end
  end
end