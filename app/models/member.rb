class Member
  attr_reader :name,
              :role,
              :house,
              :patrounus

  def initialize(data = {})
    @name = data[:name]
    @role = data[:role]
    @house = data[:house]
    @patrounus = data[:patrounus]
  end
end
