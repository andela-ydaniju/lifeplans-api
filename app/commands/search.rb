# frozen_string_literal: true

class Search
  attr_reader :bucketlists, :params

  def initialize(bucketlists, params)
    @bucketlists = bucketlists
    @params = params
  end

  def choose
    if params[:q]
      bucketlists.where("lower(name) LIKE ?", "%#{params[:q].downcase}%")
    else
      bucketlists
    end
  end
end
