module Spree
  class PressClippingsController < BaseController
    caches_page :show, :index, :if => Proc.new { Spree::Config[:cache_static_content] }

    respond_to :html

    def index
      @press_clippings = Spree::PressClipping.order('id desc')
    end

    def show
      @press_clipping = Spree::PressClipping.find params[:id]
    end
  end
end
