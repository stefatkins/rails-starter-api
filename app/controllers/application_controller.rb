class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  respond_to :json

  protected

  def serialization_options
    options = params.slice(:include, :fields).to_unsafe_h
    options[:include] = options[:include].split(', ') if options[:include].present?
    options
  end
end
