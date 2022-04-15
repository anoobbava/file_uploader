# frozen_string_literal: true

#
# this class is helper class for better evaluation of spec methods to be human readable and accessible within all the specs
#
module CommonHelper
  def response_body
    JSON.parse(response.body)
  end

  def expect_to_be_success
    expect(response).to have_http_status(:success)
  end

  def expect_to_be_unauthorized
    expect(response).to have_http_status(:unauthorized)
  end

  def expect_to_be_forbidden
    expect(response).to have_http_status(:forbidden)
  end

  def expect_to_be_not_found
    expect(response).to have_http_status(:not_found)
  end

  def expect_to_be_bad_request
    expect(response).to have_http_status(:bad_request)
  end

  def expect_to_be_a_redirect
    expect(response).to have_http_status(:redirect)
  end

  def expect_to_be_internal_server_error
    expect(response).to have_http_status(:internal_server_error)
  end

  def expect_to_be_no_content
    expect(response).to have_http_status(:no_content)
  end
end
