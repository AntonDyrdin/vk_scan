class DownloadController < ApplicationController
    def index
        @file_names = Dir.new("#{Rails.root}/storage/").entries
    end
end