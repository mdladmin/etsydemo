
class Listing < ActiveRecord::Base
	has_attached_file :image, 
	:styles => { :medium => "100x", :thumb => "36x36>" },
	:default_url  =>  "default.jpg",
	:storage => :s3,
	:s3_credentials => {
	:bucket		=>   ENV["AWS_BUCKET"],
    :access_key_id     => ENV["AWS_ACCESS_KEY_ID"    ],
    :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"]
    
	  }
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end



