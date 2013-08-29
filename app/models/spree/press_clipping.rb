module Spree
  class PressClipping < ActiveRecord::Base
    attr_accessible :content, :cover_content_type, :cover_file_name, :cover_file_size, :cover_updated_at, :pdf_content_type, :pdf_file_name, :pdf_file_size, :pdf_updated_at, :teaser, :title, :url, :cover, :pdf, :publish_date

    has_attached_file :pdf,   :url => "/assets/press/:id/:basename.:extension",
                              :path => ":rails_root/public/assets/press/:id/:basename.:extension"

    has_attached_file :cover, :styles => { :medium => "180x230>", :thumb => "150x150>" },
                              :url => "/assets/press/:id/:style/:basename.:extension",
                              :path => ":rails_root/public/assets/press/:id/:style/:basename.:extension"


    # Load user defined paperclip settings
    if Spree::Config[:use_s3]
      s3_creds = { :access_key_id => Spree::Config[:s3_access_key], :secret_access_key => Spree::Config[:s3_secret], :bucket => Spree::Config[:s3_bucket] }
      Spree::PressClipping.attachment_definitions[:pdf][:storage] = :s3
      Spree::PressClipping.attachment_definitions[:pdf][:s3_credentials] = s3_creds
      Spree::PressClipping.attachment_definitions[:pdf][:s3_headers] = ActiveSupport::JSON.decode(Spree::Config[:s3_headers])
      Spree::PressClipping.attachment_definitions[:pdf][:bucket] = Spree::Config[:s3_bucket]
      Spree::PressClipping.attachment_definitions[:pdf][:path] = "app/public/spree/press/:id/:basename.:extension"
      Spree::PressClipping.attachment_definitions[:cover][:storage] = :s3
      Spree::PressClipping.attachment_definitions[:cover][:s3_credentials] = s3_creds
      Spree::PressClipping.attachment_definitions[:cover][:s3_headers] = ActiveSupport::JSON.decode(Spree::Config[:s3_headers])
      Spree::PressClipping.attachment_definitions[:cover][:bucket] = Spree::Config[:s3_bucket]
      Spree::PressClipping.attachment_definitions[:cover][:path] = "app/public/spree/press/:id/:style/:basename.:extension"
    end

    scope :last_five, :order => 'id desc', :limit => 5

    def to_param
      "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
    end
  end
end
