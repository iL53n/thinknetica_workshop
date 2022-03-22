class BookSerializer
  include JSONAPI::Serializer
  attributes :title, :body, :author
end
