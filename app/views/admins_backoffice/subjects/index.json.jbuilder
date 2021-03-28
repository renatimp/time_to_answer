json.array! @subjects do |subject|
  json.id subject.id
  json.description subject.description
  json.questions_count subject.questions_count
  json.author "Renato Marques"
end
