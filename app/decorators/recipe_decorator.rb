class RecipeDecorator < ApplicationDecorator
  delegate_all

  def title
    h.content_tag(:div, object.title, class: 'recipe-title')
  end

  def chef
    return '' unless object.chef

    h.content_tag(:div, "Chef: #{object.chef}", class: 'recipe-chef')
  end

  def description
    h.content_tag(:div, object.description, class: 'recipe-description')
  end

  def tags
    return '' unless object.tags

    h.content_tag(:div, "Tags: #{object.tags}", class: 'recipe-tags')
  end

  def calories
    return '' unless object.calories

    h.content_tag(:div, "#{object.calories} kalories", class: 'recipe-calories')
  end

  def photo_url
    "https://#{object.photo_url}"
  end


end
