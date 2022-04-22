class ApplicationController < ActionController::Base
  #skip_before_action :verify_authenticity_token
  include Pagy::Backend

  before_action :ensure_uuid_in_cookie

  after_action { pagy_headers_merge(@pagy) if @pagy }

  def website
    render template: 'layouts/website'
  end

  def panel
    render template: 'layouts/panel'
  end

  protected

  def ensure_uuid_in_cookie
    #cookies[:user_id] ||= SecureRandom.uuid
    #cookies.signed[:user_id] ||= SecureRandom.uuid
    cookies.encrypted[:user_id] ||= SecureRandom.uuid
  end
end
