class ImageOptions
  attr_reader :deep_id, :pixabay_id, :deep_url, :pixabay_url, :deep_source, :pixabay_source

  def initialize(info)
    @deep_id = info[:data][0][:id]
    @deep_url = info[:data][0][:attributes][:url]
    @deep_source = info[:data][0][:attributes][:source]
    @pixabay_id = info[:data][1][:id]
    @pixabay_url = info[:data][1][:attributes][:url]
    @pixabay_source = info[:data][1][:attributes][:source]
  end
end
