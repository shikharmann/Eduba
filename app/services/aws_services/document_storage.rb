class AwsServices::DocumentStorage

  BUCKET_NAME = 'eduba'

  def initialize(doc)
    @doc = doc
    @s3 = Aws::S3::Resource.new
    @obj = @s3.bucket(BUCKET_NAME).object(storage_key)
  end

  def write(file)
    @obj.upload_file(file.tempfile)
  end

  def remove
    @obj.delete
  end

  def public_url
    @obj.public_url
  end

  private

  def storage_key
    "materials/#{Rails.env}/#{@doc.id}/#{@doc.get_file_name}"
  end

end