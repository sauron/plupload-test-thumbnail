# Plupload thumbnail generation.
## Rails Test App to generate a thumbnail before uploading an image.

This is a simple test app used to verify the ability of Pluload to generate a
thumbnail without uploading the image.

In that way, we use the regular form to upload the image with the rest of the
data.

In this case, I have a Press model with an image.

```ruby
class Press < ActiveRecord::Base
  attr_accessible :description, :title
  attr_accessible :image

  has_attached_file :image
end
```

To handle the attachment I'm using Paperclip.

I've downloaded and installed Plupload from http://www.plupload.com/download/

On the app/views/presses/_form.html.erb I've hooked up some javascript to
generate the thumbnail and fill a hidden text field. Something similar to
streaming the image.

When the form is submitted, the image is streamed and assigned to the
attachment in the PressesController with

```ruby
  @press.image = params[:file_image]
```

## Notes
 - **This is not a perfect solution**
 - This can totally be improved.
 - This is a sample app.

## Technologies:
 - Rails v3.2
 - Ruby v2.1.5
 - jQuery
 - Plupload v2.1.4
