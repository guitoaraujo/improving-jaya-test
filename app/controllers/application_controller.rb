class ApplicationController < ActionController::API

  private

  def authenticate_webhook!
    x_hub_signature = request.headers['X-Hub-Signature']
    body = request.body.read
    key = "sha1=#{OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), ENV['GIT_SECRET'], body)}"
    
    return head :unauthorized unless Rack::Utils.secure_compare(key, x_hub_signature)
  end

  def authenticate_user!
    @login = request.headers[:login]
    @password = request.headers[:password]
    
    return head :unauthorized unless valid_user?
  end

  def valid_user?
    if @login.present? and @password.present?
      valid_credentials?
    end
  end

  def valid_credentials?
    @login == ENV['LOGIN'] and @password == ENV['PASSWORD']
  end
end