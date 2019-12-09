describe 'Login' do
  it '/login' do
    get '/login'
    expect(last_response.status).to eq(200)
  end
end