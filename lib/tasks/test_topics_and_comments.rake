desc "create test topics and comments"
task :test_topics_and_comments => :environment do
	5.times do
		u = User.create(email: Faker::Internet.email)
	end
	20.times do
		t = Topic.create(value: Faker::Company.catch_phrase)

		if rand(2) == 1
			rand(30).times do
				t.comments.create(user_id: User.order("RANDOM()").first.id, value: Faker::Lorem.paragraph)
			end
		end
	end
end

