# Load config/paperclip.yml settings

if paperclip_cfg = YAML.load_file("#{Rails.root}/config/paperclip.yml")[Rails.env]
  paperclip_cfg.symbolize_keys!
  command_path = paperclip_cfg.delete(:command_path)

  Paperclip::Attachment.default_options[:command_path] = "/usr/local/bin"
  # Replace Attachment defaults with configuration ones
  Paperclip::Attachment.default_options.merge!(paperclip_cfg)

  # Adjust ImageMagick path to work with Passenger
  Paperclip.options[:command_path] = command_path

  Paperclip.interpolates(:normalized_basename) do |attachment, style|
    Rails.logger.debug "*** original_filename: #{attachment.original_filename.inspect}"

    new_filename  = attachment.original_filename
    new_extension = File.extname(new_filename)
    new_filename  = new_filename.gsub(new_extension, "")

    if attachment.dirty? && attachment.instance.respond_to?("#{attachment.name}_seo_path")
      Rails.logger.debug "*** Using NormalizeSlug"
      new_filename = NormalizeSlug.new(new_filename).call
    end

    Rails.logger.debug "*** new_filename: #{new_filename.inspect}"

    new_filename
  end

  Paperclip.interpolates :dynamic do |attachment, style|
    filename_method = :"#{attachment.name}_seo_path"
    inter_string = if attachment.instance.respond_to?(filename_method) && (fname = attachment.instance.send(filename_method))
      ":attachment/:id/:style/#{fname}.:extension"
    else
      ":attachment/:id/:style/:normalized_basename.:extension"
    end
    Paperclip::Interpolations.interpolate inter_string, attachment, style
  end
end
