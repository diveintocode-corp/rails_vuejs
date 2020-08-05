require 'application_system_test_case'
class HomeTest < ApplicationSystemTestCase
  test 'visiting the index' do
    # トップページを開く
    visit root_path

    # 4人とも表示される
    assert_text 'Chuck Norris'
    assert_text 'Bruce Lee'
    assert_text 'Jackie Chan'
    assert_text 'Jet Li'

    # "J"でフィルタリングする（2人表示）
    fill_in 'query', with: 'J'
    assert_no_text 'Chuck Norris'
    assert_no_text 'Bruce Lee'
    assert_text 'Jackie Chan'
    assert_text 'Jet Li'

    # "Jet"でフィルタリングする（1人だけ表示）
    fill_in 'query', with: 'Jet'
    assert_no_text 'Chuck Norris'
    assert_no_text 'Bruce Lee'
    assert_no_text 'Jackie Chan'
    assert_text 'Jet Li'
  end
end