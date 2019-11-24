class Api::FilesController < ApiController

  def get_file
    send_file(
      "#{Rails.root}/storage/" +  params['file_name'],
      filename: params['file_name'],
      type: "application/txt"
    )
  end 
end