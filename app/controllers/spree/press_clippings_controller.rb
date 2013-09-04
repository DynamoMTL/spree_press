module Spree
  class PressClippingsController < StoreController

    respond_to :html

    def index
      @press_clippings = Spree::PressClipping.order('publish_date desc, id desc')
    end

    def show
      @press_clipping = Spree::PressClipping.find params[:id]
    end
  end
end
