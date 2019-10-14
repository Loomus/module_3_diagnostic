require "rails_helper"

describe Member do
  it "exists" do
    attrs = {
      name: "Albus Dumbledore",
      role: "Headmaster, Hogwarts",
      house: "Gryffindor",
      patrounus: "phoenix"
    }

    member = Member.new(attrs)

    expect(member).to be_a Member
    expect(member.name).to eq("Albus Dumbledore")
    expect(member.role).to eq("Headmaster, Hogwarts")
    expect(member.house).to eq("Gryffindor")
    expect(member.patrounus).to eq("phoenix")
  end
end
