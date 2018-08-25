class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  respond_to :json
  api_version "v1"
end
