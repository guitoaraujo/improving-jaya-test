class ApplicationController < ActionController::API

  private

  def authenticate!
    x_hub_signature = request.headers['X-Hub-Signature']
    body = request.body.read
    key = "sha1=#{OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), ENV['GIT_SECRET'], body)}"
    return head :unauthorized unless Rack::Utils.secure_compare(key, x_hub_signature)

    'Authenticated!'
  end
end