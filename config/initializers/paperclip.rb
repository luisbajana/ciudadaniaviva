# config/initializers/paperclip.rb 
Paperclip::Attachment.default_options[:url] = 's3_host_name'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'