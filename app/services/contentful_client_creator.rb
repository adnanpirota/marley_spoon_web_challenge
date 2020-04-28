class ContentfulClientCreator
  require 'contentful'
  TOKEN = '7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c'

  def initialize(args = {})
    @space = args[:space]
    @entry_id = args[:entry_id]
    @content_type = args[:content_type]
    @result = OpenStruct.new(data: nil, error: '')
  end

  def call
    return OpenStruct.new(data: nil, error: 'No valid args provided') unless @entry_id || @content_type

    if @content_type
      all_content_type_entries
    else
      single_entry
    end
    @result
  end

  def all_content_type_entries
    @result.data = client.entries(content_type: @content_type, include: 1)
    rescue Contentful::Unauthorized => e
      @result.error = 'Check your authorization!'
    rescue StandardError => e
      @result.error = 'Error in pulling the data!'
  end

  def single_entry
    @result.data = client.entry(@entry_id)
  rescue Contentful::Unauthorized => e
    @result.error = 'Check your authorization!'
  rescue StandardError => e
    @result.error = 'Error in pulling the data!'
  end

  private

  def client
    Contentful::Client.new(
      space: @space,
      access_token: TOKEN
    )
  end
end