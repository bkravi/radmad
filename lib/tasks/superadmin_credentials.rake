namespace :superadmin  do
  desc "Create Super Admin"
  task :superadmin_credentials => :environment do
    user = User.new({:username => 'superadmin' , :email => 'bkravi.os@gmail.com',
        :password => 'radmad-123', :password_confirmation => 'radmad-123', :role_id => 2})
    begin
      puts "Superadmin Registration successful." if user.save
    rescue Exception => e
      puts "Error: #{e}"
    end
  end
end