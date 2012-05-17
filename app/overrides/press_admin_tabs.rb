Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "press_clippings_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => "<%= tab(:press_clippings) %>")
