namespace :db do
  desc "Add admin user and default getting"
  task default_data: :environment do
    default_setting
    add_admin
  end
end


def add_admin
  if User.where(nik: 'admin').empty?
    User.create([:nik => 'admin', :pip => 'Admin Admin Adminovich', 
      :password => 'admin', :password_confirmation => 'admin', :admin => true])    
  end
end

def default_setting
  if Setting.where(system_name: 'SuperHimiK').empty?
    Setting.create([:system_name => 'SuperHimiK', :nav_year => Time.now.year.to_s + ' - ' + (Time.now.year + 1).to_s + ' н.р.', 
      :footer => "by AlexSemch", :about_as => "Про нас", :contact_as => "Звяжіться з нами"])    
  end
end