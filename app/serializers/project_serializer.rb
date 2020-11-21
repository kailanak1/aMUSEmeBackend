class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title
end
