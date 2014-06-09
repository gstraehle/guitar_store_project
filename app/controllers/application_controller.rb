class ApplicationController < ActionController::Base

  def default_serializer_options
    {root: false}
  end

  protect_from_forgery with: :exception
end
