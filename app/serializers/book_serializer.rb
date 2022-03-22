class BookSerializer
  include JSONAPI::Serializer

  attributes :id, :title, :body, :author
end
