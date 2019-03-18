require "./helper"

describe RubberSoul::Table do
  it "creates a mapping of table attributes to es types" do
    table = RubberSoul::Table.new(Programmer)
    mappings = table.properties
    mappings.should eq [{:name, {type: "text"}}]
  end

  describe "indexes with associations" do
    it "finds the child tables" do
      table = RubberSoul::Table.new(Programmer)
      table.children.should eq ["Coffee", "Migraine"]
    end

    it "finds the parent tables" do
      table = RubberSoul::Table.new(Coffee)
      table.parents.should eq [{index: "programmer", routing_attr: "programmer_id"}]
    end
  end
end