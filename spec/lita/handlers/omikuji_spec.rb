require 'spec_helper'

describe Lita::Handlers::Omikuji, lita_handler: true do
  it { is_expected.to route('omikuji') }
  it { is_expected.to route('omikuji').to(:omikuji) }
  it 'retrieve message "omikuji"' do
    omikuji_list = %w(大吉 吉 中吉 小吉 半吉 末吉 末小吉 平凶 小凶 半凶 末凶 凶 大凶)
    send_message('omikuji')
    expect(omikuji_list).to include(replies.last)
  end

  it { is_expected.to route_http(:get, '/hello') }
  it { is_expected.to route_http(:get, '/hello').to(:hello) }
  it 'access /hello' do
    response = http.get('/hello')
    expect(response.body).to eq('Hello!')
  end
end
