module VkApiHelper
  def get_users(users)
    ids = ""

    users.each do |user|
      ids += user.vk_id + ','
    end

    uri = URI.parse("https://api.vk.com/method/users.get" + '?user_ids=' + ids + "&fields=online&access_token=" + $auth_token + "&v=5.74")
    
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)
    return JSON.parse(response.body)
  end
end