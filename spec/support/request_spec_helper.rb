# frozen_string_literal: true

# spec/support/request_spec_helper

module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end

  def token_generator(user)
    JsonWebToken.encode(user_id: user.id)
  end

  def expired_token_generator(user_id)
    JsonWebToken.encode({ user_id: user_id }, (Time.now.to_i - 10))
  end
end
