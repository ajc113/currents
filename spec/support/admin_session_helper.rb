module AdminSessionHelper
  def admin_login(admin_user)
    visit '/admin/login'
    expect(page).to have_content('Currents Login')
    fill_in 'admin_user_email', with: admin_user.email
    fill_in 'admin_user_password', with: admin_user.password
    click_button 'Login'
  end

  def admin_logout(admin_user)
    visit 'admin/logout'
  end
end
