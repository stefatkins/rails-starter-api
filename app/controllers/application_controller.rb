class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include Sortable

  respond_to :json

  protected

  def serialization_options
    params.slice(:include, :fields).to_unsafe_h
  end
end
