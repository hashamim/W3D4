# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ username: "TylertheCreator"}, {username: "KimK"}, {username: "POG"}, {username: "pogchamp"}])
polls = users.map do |user|
    user.authored_polls.new(title: (user.username[0..3] + "'s Poll"))
end
polls.each(&:save!)
questions = polls.map do |poll|
    poll.questions.new(body: "Who here likes #{poll.author.username}")
end

questions.each(&:save!)

polls = users.map do |user|
    user.authored_polls.new(title: (user.username[0..5] + "'s second Poll"))
end

polls.each(&:save!)

questions.each do |q|
    ["Nobody","ew","Yasss"].each do |ans|
        p q.answer_choices.new(body: ans).save
    end
end

ans = AnswerChoice.all
