module TestsHelper
  def test_assocaties
    Test.nested_attributes_options.keys.map(&:to_s)
  end
end
