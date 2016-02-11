class Search
  attr_reader :objects, :params

  def initialize(objects, params)
    @objects = objects
    @params = params
  end

  def choose
    if params[:q]
      objects.where("lower(name) LIKE ?", "%#{params[:q].downcase}%")
    else
      objects
    end
  end
end
