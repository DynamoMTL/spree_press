module Spree
  class PressClippingsController < BaseController

    respond_to :html, :json

    def index
      @press_clippings = Spree::PressClipping.order('id desc')
      respond_with(@press_clippings)
    end

    def show
      @press_clipping = Spree::PressClipping.find params[:id]
      respond_with(@press_clipping)
    end
  end
end
