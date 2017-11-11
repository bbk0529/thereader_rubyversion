require 'test_helper'

class ReaderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reader_index_url
    assert_response :success
  end

  test "should get detail" do
    get reader_detail_url
    assert_response :success
  end

  test "should get insert" do
    get reader_insert_url
    assert_response :success
  end

  test "should get searchdata" do
    get reader_searchdata_url
    assert_response :success
  end

  test "should get summary" do
    get reader_summary_url
    assert_response :success
  end

end
