class HarryPotterCharacters
  def initialize(house)
    @house = house
  end

  def member_count
    gryffindor_members.count
  end

  def gryffindor_members
    conn = Faraday.new(url: "https://www.potterapi.com") do |f|
      f.params['key'] = ENV['hp_key']
      f.params['house'] = 'Gryffindor'
      f.params['orderOfThePhoenix'] = true
      f.adapter Faraday.default_adapter
    end

    response = conn.get("/v1/characters")

    hp_member_data = JSON.parse(response.body, symbolize_names: true)

    members = hp_member_data.map do |hp_member|
      Member.new(hp_member)
    end
  end

  private

  attr_reader :house
end
