module Spree
  module Admin
    class PressClippingsController < ResourceController
      protected

      def permitted_resource_params
        params.require(:press_clipping).permit(:content, :cover_content_type, :cover_file_name, :cover_file_size, :cover_updated_at, :pdf_content_type, :pdf_file_name, :pdf_file_size, :pdf_updated_at, :teaser, :title, :url, :cover, :pdf)
      end
    end
  end
end
