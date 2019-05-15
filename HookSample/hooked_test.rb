require './hook/hooker'

# Hooked class
class HookedTest
  include Hook::Hooker
  def test
    p 'this is test.'
  end
end

HookedTest.new.test


# result:
# $ ruby hooked_test.rb
# "hook method start: 2019-05-15 11:12:09 +0900"
#"this is test."
# "hook method end: 2019-05-15 11:12:09 +0900"
