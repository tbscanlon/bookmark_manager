describe User do
  let!(:user) do
    User.create(email: 'tom@test.com', password: 'password1', password_confirmation: 'password1')
  end

  it 'authenticates when given valid credentials' do
    auth_user = User.authenticate(user.email, user.password)
    expect(auth_user).to eq user
  end

  it 'does not authenticate when given invalid credentials' do
    expect(User.authenticate(user.email, user.password.succ)).to be_nil
  end
end
