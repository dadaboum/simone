require 'test_helper'

class SurgeonMailerTest < ActionMailer::TestCase
  test "notice" do
    mail = SurgeonMailer.notice
    assert_equal "Notice", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
