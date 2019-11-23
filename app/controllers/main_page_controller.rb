require './app/jobs/online_monitoring_job'
class MainPageController < ApplicationController
    include OnlineMonitoringJob
    
    def index
    #10da22f17a662bcaec368d4ae364090b763e166a1cec349ef243481bb2fd1a0d0021c7d1121113ad44f8e
        @vk = VkontakteApi::Client.new(@session[:token])
        
        @user = @vk.users.get(uid: @session[:vk_id], fields: [:screen_name, :photo, :online], v: '5.103').first


    end

    def start_scan_by_fork
        @online_scan_pid = fork do 
            p "FORK"
            scan()
        end
    end

    def start_scan_by_new_thread
        
        Thread.new(scan())
    end
end