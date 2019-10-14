class HarryPotterCharacters
  def initialize(house)
    @house = house
  end

  def members
    conn = Faraday.new(url: "https://www.potterapi.com/v1/") do |f|
      f.params['key'] = ENV['hp_key']
      f.adapter Faraday.default_adapter
    end

    response = conn.get("/characters/#{house}")

    hp_member_data = JSON.parse(response.body, symbolize_names: true)

    hp_member_data.map do |hp_member|
      Member.new(hp_member)
    end 
  end

  private

  attr_reader :house
end
