class ApplicationController < ActionController::API
  after_filter :set_access_control_headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = 'http://localhost:3333'
  end
end
