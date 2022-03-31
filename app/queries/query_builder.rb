class QueryBuilder
  attr_reader :performed_scope

  def initialize(params, initial_scope)
    @params = params
    @initial_scope = initial_scope
    @performed_scope = @initial_scope
  end

  def call
    perform_scope
    # perform_filter
    # perform_sort
    # perform_pagination
  end

  private

  def perform_scope
    @performed_scope
  end

  # def perform_filter
  #   @performed_scope = @initial_scope
  # end

  # def perform_sort
  #   @performed_scope = @initial_scope
  # end

  # def perform_pagination
  #   @performed_scope = @initial_scope
  # end
end
