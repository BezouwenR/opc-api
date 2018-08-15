# Serializers define the rendered JSON for a model instance.
# We use jsonapi-rb, which is similar to active_model_serializers.
class SerializableModification < JSONAPI::Serializable::Resource
  type :modifications

  # Add attributes here to ensure they get rendered, .e.g.
  #
  # attribute :name
  #
  # To customize, pass a block and reference the underlying @object
  # being serialized:
  #
  # attribute :name do
  #   @object.name.upcase
  # end
  attribute :name
  attribute :summary
  attribute :description
  attribute :instructions
  attribute :slug
  attribute :created_at
  attribute :updated_at
end
