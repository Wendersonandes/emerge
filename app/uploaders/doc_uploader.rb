class DocUploader < Shrine
  
  plugin :activerecord
  plugin :direct_upload, presign: true, max_size: 2000
  plugin :remote_url, max_size: 20*1024*1024
  plugin :determine_mime_type
  plugin :remove_attachment
  plugin :validation_helpers

  Attacher.validate do
    validate_max_size 10.megabytes, message: 'is too large (max is 10 MB)'
    validate_mime_type_inclusion [ 'application/x-pdf', 'application/acrobat', 'applications/vnd.pdf', 'text/pdf', 'text/x-pdf','application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']
  end

end