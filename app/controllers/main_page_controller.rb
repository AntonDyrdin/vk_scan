require './app/jobs/online_monitoring_job'
class MainPageController < ApplicationController
    include OnlineMonitoringJob
    
    def index

    end

    def start_scan_by_fork
        if $auth_token
            $online_scan_pid = fork do 
                p "FORK"
                scan($auth_token)
            end
        end
    end
end