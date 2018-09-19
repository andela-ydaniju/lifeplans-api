# frozen_string_literal: true

class Pagination
  attr_reader :bucketlists, :params
  DEFAULT_LIMIT = 20
  DEFAULT_PAGE = 1

  def initialize(bucketlists, params)
    @bucketlists = bucketlists
    @params = params
  end

  def start
    limit = params[:limit].to_i
    page = params[:page].to_i

    limit = limit < 1 ? DEFAULT_LIMIT : limit
    limit = limit > 100 ? 100 : limit
    page = page < 1 ? DEFAULT_PAGE : page

    paginate bucketlists, limit, page
  end

  def paginate(bucketlists, limit, page)
    begin_index = (page - 1) * limit
    end_index = begin_index + limit

    bucketlists[begin_index...end_index]
  end
end
