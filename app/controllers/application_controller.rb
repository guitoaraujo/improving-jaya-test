# frozen_string_literal: true

class ApplicationController < ActionController::API
  private

  def authenticate_webhook!
    @x_hub_signature = request.headers['X-Hub-Signature']
    body = request.body.read
    @key = "sha1=#{OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), ENV['GIT_SECRET'], body)}"

    return head :unauthorized unless valid_webhook_credentials?
  end

  def valid_webhook_credentials?
    @key == @x_hub_signature
  end

  def authenticate_user!
    @login = request.headers[:login]
    @password = request.headers[:password]

    return head :unauthorized unless valid_user?
  end

  def valid_user?
    valid_user_credentials? if @login.present? && @password.present?
  end

  def valid_user_credentials?
    @login == ENV['LOGIN'] and @password == ENV['PASSWORD']
  end
end
