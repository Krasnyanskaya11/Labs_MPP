class SpecialitiesQuery
  attr_reader :relation

  def initialize(relation = Speciality.all)
    @relation = relation
  end

  def search(name)
    return self unless name.present?

    name = name.downcase
    @relation = relation.where('lower(name) LIKE ?', "%#{name}%")
    self
  end

  def sort(field, direction)
    case field
    when 'name'
      @relation = relation.order("name #{direction}")
    when 'created_at'
      @relation = relation.order("created_at #{direction}")
    else
      @relation = relation.order(:id)
    end
    self
  end

  def result
    @relation
  end
end