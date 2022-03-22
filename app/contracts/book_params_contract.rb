class BookParamsContract < Dry::Validation::Contract
  params do
    required(:book).hash do
      required(:title).value(:string)
      required(:body).value(:string)
      required(:author).value(:string)
    end
  end
end
