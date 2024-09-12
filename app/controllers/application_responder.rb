class ApplicationResponder < ActionController::Responder
  include ActionController::MimeResponds
  include Responders::FlashResponder
end
