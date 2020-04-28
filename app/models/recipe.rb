class Recipe < ApplicationRecord

  def initialize(contentify_entry)
    @entry = contentify_entry
  end

  def chef
    return nil unless @entry.fields.key? :chef

    @entry.chef.name
  end

  def title
    @entry.title
  end

  def description
    @entry.description
  end

  def tags
    return nil unless @entry.fields[:tags].is_a? Array

    @entry.tags.map(&:name).join(', ')
  end

  def calories
    return nil unless @entry.fields.key? :calories

    @entry.calories
  end

  def photo_url
    @entry.photo.url
  end

end
