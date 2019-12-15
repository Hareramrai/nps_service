module Response
  def json_pagination_response(collection, klass, options = {}, status: :ok)
    paginated_data = collection.pagination(params)

    render json: klass.new(paginated_data, options).serialized_json, status: status
  end

  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
