module Renderer
    extend ActiveSupport::Concern
  
    # to render success message
    def render_success message: nil, data: nil, status: 200
      render json: { success: true, message: message, data: data }, status: status
    end
  
    # to render error message
    def render_error message: I18n.t('errors.e_400'),  data: nil, status: 400
      render json: { success: false, message: message, data:data}, status: status
    end
  
  
end