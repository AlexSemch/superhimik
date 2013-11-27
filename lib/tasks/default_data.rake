namespace :db do
  desc "Add admin user and default setting"
  task default_data: :environment do
    default_setting
    add_admin
    add_test
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

def add_test
	topic = Topic.create!(content: "Розділ 1. Номенклатура та властивості основних класів неорганічних сполук. Основні закони хімії. Основи хімічної термодинаміки",
	                      grade: 7)
	survey = topic.surveys.create!(name: 'Номенклатура та властивості основних класів неорганічних сполук.',
                                 number_of_quesitons: 10, time_to_complete: 5, test_type: 'закритий' )
  question = survey.questions.create!(content: "0,25 моль хлороводню (н.у.) займає об’єм:")
  question.answers.create!(content: "11,2 дм3")
  question.answers.create!(content: "44,8 дм3")
  question.answers.create!(content: "22,4 дм3")
  question.answers.create!(content: "5,6 дм3")
  question.answers.create!(content: "2,8 дм3")

  question = survey.questions.create!(content: "Амфотерні сполуки – це речовини, які реагують з: ")
  question.answers.create!(content: "Тільки з кислотами.")
  question.answers.create!(content: "Тільки з лугами.")
  question.answers.create!(content: "Тільки з основними оксидами")
  question.answers.create!(content: "Тільки з кислотними оксидами.")
  question.answers.create!(content: "Кислотами та лугами.")

  question = survey.questions.create!(content: "В 1 дм3 (н.у.) якої з наведених речовин міститься найбільша кількість молекул?")
  question.answers.create!(content: "SO<sub>2</sub>")
  question.answers.create!(content: "H<sub>2</sub>")
  question.answers.create!(content: "H<sub>2</sub>S")
  question.answers.create!(content: "H<sub>2</sub>O")
  question.answers.create!(content: "NH<sub>3</sub>")

  question = survey.questions.create!(content: "В якій масі води міститься така ж кількість молекул, що і в 11,2 дм<sup>3</sup> вуглекислого газу?")
  question.answers.create!(content: "9 г")
  question.answers.create!(content: "44 г")
  question.answers.create!(content: "36 г")
  question.answers.create!(content: "18 г")
  question.answers.create!(content: "11 г")

  question = survey.questions.create!(content: "Взаємодія між кислотою і основою, що приводить до утворення солі і води називають 
                                                                    реакцією: ")
  question.answers.create!(content: "нейтралізації. ")
  question.answers.create!(content: "дисоціації. ")
  question.answers.create!(content: "диспропорціонування. ")
  question.answers.create!(content: "розкладу. ")
  question.answers.create!(content: "гідролізу. ")

  question = survey.questions.create!(content: "Для яких речовин стандартна теплота утворення
                                       дорівнює нулю")
  question.answers.create!(content: "О<sub>2</sub>")
  question.answers.create!(content: "СО<sub>2</sub>")
  question.answers.create!(content: "Н<sub>2</sub>О")
  question.answers.create!(content: "С<sub>6</sub>Н<sub>12</sub>О<sub>6</sub>")
  question.answers.create!(content: "O<sub>3</sub>")

  question = survey.questions.create!(content: "Вкажіть речовину яка має однакові значення 
                                     молярної та еквівалентної мас: ")
  question.answers.create!(content: "Mg(OH)<sub>2</sub> ")
  question.answers.create!(content: "Na<sub>2</sub>SO<sub>4</sub> ")
  question.answers.create!(content: "Al<sub>2</sub>(SO<sub>4</sub>)<sub>3</sub> ")
  question.answers.create!(content: "HCl ")
  question.answers.create!(content: "H<sub>3</sub>PO<sub>4</sub>")


end