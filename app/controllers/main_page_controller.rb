require './app/jobs/online_monitoring_job'
class MainPageController < ApplicationController
    include OnlineMonitoringJob
    
    def index

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