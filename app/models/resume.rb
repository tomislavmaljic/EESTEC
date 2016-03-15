class Resume < ActiveRecord::Base
   mount_uploader :attachment, AttachmentUploader
   def self.search(search)
     where("keywords LIKE ?", "%#{search}%")
   end
end
