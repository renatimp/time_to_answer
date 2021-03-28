prawn_document do |pdf|
  pdf.text 'Listando usuários cadastrados', :align => :center
  pdf.move_down 20
  header = ["<b>#</b>", "<b>Nome completo</b>", "<b>E-mail</b>", "<b>Sexo</b>", "<b>Data de nascimento</b>"]

  pdf.table([header], :cell_style =>{:inline_format => true }, :position => :center)
  pdf.table @users.collect{|u| u.user_profile.blank? ?
                           [u.id, u.full_name , u.email, '', ''] :
                           [u.id, u.full_name, u.email, u.user_profile.gender,
                            l(u.user_profile.birthdate)]},
                            :position => :center,
                            :width => 550,
                            :row_colors =>["d3d3d3","ffffff"],
                            :cell_style =>{:align => :center}

end

#prawn_document do |pdf|
#  pdf.text 'Listando questões cadastrados', :align => :center
#  pdf.move_down 20
#  pdf.table @questions.collect{|q| [q.id,q.description ]} , :position => :center
#end
