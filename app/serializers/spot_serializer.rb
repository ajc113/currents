class SpotSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :slug
end
