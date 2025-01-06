require "rails_helper"

RSpec.describe(ApplicationComponent, type: :component) do
  subject(:component) { described_class.new }

  describe "#class_names" do
    it "includes class names passed as strings" do
      expect(component.class_names("foo", "bar")).to eq("foo bar")
    end

    it "allows hashes with symbols" do
      expect(component.class_names({foo: true, bar: false})).to eq("foo")
    end

    it "allows multiple hashes" do
      expect(component.class_names({foo: true}, {bar: false})).to eq("foo")
    end

    it "ignores invalid values" do
      expect(component.class_names(nil, false, 123, "", "foo", {bar: true})).to eq("foo bar")
    end

    it "handles arrays" do
      expect(component.class_names([{foo: true}], [{bar: false}])).to eq("foo")
    end
  end
end
