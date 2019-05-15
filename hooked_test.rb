require './hook/hooker'

# Hooked class
class HookedTest
  include Hook::Hooker
  def test
    p 'this is test.'
  end
end

HookedTest.new.test
