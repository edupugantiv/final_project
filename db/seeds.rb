# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.delete_all
Classification.delete_all
Charity.delete_all
Preference.delete_all
Result.delete_all
Donation.delete_all
User.all.each do |user|
	user.next_donation = nil
	user.save
end

Category.create([{title: 'Animals', avatar: File.open('app/assets/images/animals.jpg', 'rb')}, {title: 'Arts, Culture, Humanities', avatar: File.open('app/assets/images/arts_culture_humanities.jpg', 'rb')}, {title: 'Education', avatar: File.open('app/assets/images/education.jpg', 'rb')}, {title: 'Health', avatar: File.open('app/assets/images/health.jpg', 'rb')}, {title: 'Human Services', avatar: File.open('app/assets/images/human_services.jpg', 'rb')}, {title: 'International', avatar: File.open('app/assets/images/international.jpg', 'rb')}, {title: 'Human and Civil Rights', avatar: File.open('app/assets/images/human_and_civil_rights.jpg', 'rb')}, {title: 'Community Developement', avatar: File.open('app/assets/images/community_development.jpg', 'rb')}, {title: 'Research and Public Policy', avatar: File.open('app/assets/images/research_and_public_policy.jpg', 'rb')}, {title: 'Environment', avatar: File.open('app/assets/images/environment.jpg', 'rb')}])
Charity.create([
 	{name: 'American Bird Conservancy'}, {name: 'Wild Conversation Network'}, {name: 'PAWS Chicago'}, {name: 'Banfield Charitable Trust'}, {name: 'The Wild Foundation'}, #Animals
	{name: 'Fractured Atlas'}, {name: 'Community Partnership for Arts and Culture'}, {name: 'The Seattle Public Library Foundation'}, {name: 'Walking Mountains Science Center'}, {name: 'Manhattan Theatre Club'}, #Arts, Culture, Humanities
	{name: 'Step Up For Students'}, {name: 'The Fund for Public Schools'}, {name: 'The NEA Foundation'}, {name: 'The Parent-Child Home Program'}, {name: 'Street School'}, #Education
	{name: 'Fauna & Flora International'}, {name: 'Southern Environmental Law Center'}, {name: 'Beyond Pesticides'}, {name: 'World Resources Institute'}, {name: 'Conservation Law Foundation'}, #Environment
	{name: 'The Lustgarten Foundation for Pancreatic Cancer Research'}, {name: 'Fisher Center for Alzheimer’s Research Foundation'}, {name: 'Aplastic Anemia & MDS International Foundation'}, {name: 'Camp John Marc'}, {name: 'Living Beyond Breast Cancer'}, #Health
	{name: 'Midwest Food Bank'}, {name: 'Weld Food Bank'}, {name: 'Air Warrior Courage Foundation'}, {name: 'Safe Haven Family Shelter'}, {name: 'Special Operations Warrior Foundation'}, #Human Services
	{name: 'Direct Relief'}, {name: 'MAP International'}, {name: 'Books For Africa'}, {name: 'Soles4Souls'}, {name: 'Meds & Foods for Kids'}, #International
	{name: 'Equal Justice Initiative'}, {name: 'Chicago Foundation for Women'}, {name: 'Compassion & Choices'}, {name: 'The Institute for Justice'}, {name: 'National Immigration Law Center'}, #Human and Civil Rights
	{name: 'Urban Youth Impact'}, {name: 'Fellowship of Christian Athletes'}, {name: 'The Jewish Education Project'}, {name: 'Hebrew Free Burial Association'}, #Religion
	{name: 'California Community Foundation'}, {name: 'Robin Hood Foundation'}, {name: 'Rebuilding Together'}, {name: 'Jewish Federation of Greater Pittsburgh'}, {name: 'The Boston Foundation'}, #Community Developement
	{name: 'RESULTS Educational Fund'}, {name: 'Middle East Forum'}, {name: 'Public Interest Projects'}, {name: 'Center for Food Safety'}, {name: 'Safe Kids Worldwide'}, #Research and Public Policy
])	

Classification.create(category_id: Category.find_by(title: 'Animals').id , charity_id: Charity.find_by(name: 'Conservation Law Foundation').id)
Classification.create(category_id: Category.find_by(title: 'Animals').id , charity_id: Charity.find_by(name: 'Fauna & Flora International').id)
Classification.create(category_id: Category.find_by(title: 'Animals').id , charity_id: Charity.find_by(name: 'American Bird Conservancy').id)
Classification.create(category_id: Category.find_by(title: 'Animals').id , charity_id: Charity.find_by(name: 'Wild Conversation Network').id)
Classification.create(category_id: Category.find_by(title: 'Animals').id , charity_id: Charity.find_by(name: 'PAWS Chicago').id)
Classification.create(category_id: Category.find_by(title: 'Animals').id , charity_id: Charity.find_by(name: 'Banfield Charitable Trust').id)
Classification.create(category_id: Category.find_by(title: 'Animals').id , charity_id: Charity.find_by(name: 'The Wild Foundation').id)
Classification.create(category_id: Category.find_by(title: 'Arts, Culture, Humanities').id , charity_id: Charity.find_by(name: 'Community Partnership for Arts and Culture').id)
Classification.create(category_id: Category.find_by(title: 'Arts, Culture, Humanities').id , charity_id: Charity.find_by(name: 'The Seattle Public Library Foundation').id)
Classification.create(category_id: Category.find_by(title: 'Arts, Culture, Humanities').id , charity_id: Charity.find_by(name: 'Walking Mountains Science Center').id)
Classification.create(category_id: Category.find_by(title: 'Arts, Culture, Humanities').id , charity_id: Charity.find_by(name: 'Fractured Atlas').id)
Classification.create(category_id: Category.find_by(title: 'Arts, Culture, Humanities').id , charity_id: Charity.find_by(name: 'Manhattan Theatre Club').id)
Classification.create(category_id: Category.find_by(title: 'Arts, Culture, Humanities').id , charity_id: Charity.find_by(name: 'Community Partnership for Arts and Culture').id)
Classification.create(category_id: Category.find_by(title: 'Education').id , charity_id: Charity.find_by(name: 'The Seattle Public Library Foundation').id)
Classification.create(category_id: Category.find_by(title: 'Education').id , charity_id: Charity.find_by(name: 'Step Up For Students').id)
Classification.create(category_id: Category.find_by(title: 'Education').id , charity_id: Charity.find_by(name: 'The Fund for Public Schools').id)
Classification.create(category_id: Category.find_by(title: 'Education').id , charity_id: Charity.find_by(name: 'Walking Mountains Science Center').id)
Classification.create(category_id: Category.find_by(title: 'Education').id , charity_id: Charity.find_by(name: 'The NEA Foundation').id)
Classification.create(category_id: Category.find_by(title: 'Education').id , charity_id: Charity.find_by(name: 'Chicago Foundation for Women').id)
Classification.create(category_id: Category.find_by(title: 'Education').id , charity_id: Charity.find_by(name: 'The Parent-Child Home Program').id)
Classification.create(category_id: Category.find_by(title: 'Education').id , charity_id: Charity.find_by(name: 'Books For Africa').id)
Classification.create(category_id: Category.find_by(title: 'Education').id , charity_id: Charity.find_by(name: 'Street School').id)
Classification.create(category_id: Category.find_by(title: 'Environment').id , charity_id: Charity.find_by(name: 'American Bird Conservancy').id)
Classification.create(category_id: Category.find_by(title: 'Environment').id , charity_id: Charity.find_by(name: 'The Wild Foundation').id)
Classification.create(category_id: Category.find_by(title: 'Environment').id , charity_id: Charity.find_by(name: 'Center for Food Safety').id)
Classification.create(category_id: Category.find_by(title: 'Environment').id , charity_id: Charity.find_by(name: 'Wild Conversation Network').id)
Classification.create(category_id: Category.find_by(title: 'Environment').id , charity_id: Charity.find_by(name: 'Fauna & Flora International').id)
Classification.create(category_id: Category.find_by(title: 'Environment').id , charity_id: Charity.find_by(name: 'Southern Environmental Law Center').id)
Classification.create(category_id: Category.find_by(title: 'Environment').id , charity_id: Charity.find_by(name: 'Beyond Pesticides').id)
Classification.create(category_id: Category.find_by(title: 'Environment').id , charity_id: Charity.find_by(name: 'World Resources Institute').id)
Classification.create(category_id: Category.find_by(title: 'Environment').id , charity_id: Charity.find_by(name: 'Conservation Law Foundation').id)
Classification.create(category_id: Category.find_by(title: 'Health').id , charity_id: Charity.find_by(name: 'The Lustgarten Foundation for Pancreatic Cancer Research').id)
Classification.create(category_id: Category.find_by(title: 'Health').id , charity_id: Charity.find_by(name: 'Fisher Center for Alzheimer’s Research Foundation').id)
Classification.create(category_id: Category.find_by(title: 'Health').id , charity_id: Charity.find_by(name: 'Aplastic Anemia & MDS International Foundation').id)
Classification.create(category_id: Category.find_by(title: 'Health').id , charity_id: Charity.find_by(name: 'Direct Relief').id)
Classification.create(category_id: Category.find_by(title: 'Health').id , charity_id: Charity.find_by(name: 'MAP International').id)
Classification.create(category_id: Category.find_by(title: 'Health').id , charity_id: Charity.find_by(name: 'Meds & Foods for Kids').id)
Classification.create(category_id: Category.find_by(title: 'Health').id , charity_id: Charity.find_by(name: 'Midwest Food Bank').id)
Classification.create(category_id: Category.find_by(title: 'Health').id , charity_id: Charity.find_by(name: 'Weld Food Bank').id)
Classification.create(category_id: Category.find_by(title: 'Health').id , charity_id: Charity.find_by(name: 'Camp John Marc').id)
Classification.create(category_id: Category.find_by(title: 'Health').id , charity_id: Charity.find_by(name: 'Living Beyond Breast Cancer').id)
Classification.create(category_id: Category.find_by(title: 'Human Services').id , charity_id: Charity.find_by(name: 'Step Up For Students').id)
Classification.create(category_id: Category.find_by(title: 'Human Services').id , charity_id: Charity.find_by(name: 'Robin Hood Foundation').id)
Classification.create(category_id: Category.find_by(title: 'Human Services').id , charity_id: Charity.find_by(name: 'Compassion & Choices').id)
Classification.create(category_id: Category.find_by(title: 'Human Services').id , charity_id: Charity.find_by(name: 'RESULTS Educational Fund').id)
Classification.create(category_id: Category.find_by(title: 'Human Services').id , charity_id: Charity.find_by(name: 'The Parent-Child Home Program').id)
Classification.create(category_id: Category.find_by(title: 'Human Services').id , charity_id: Charity.find_by(name: 'Camp John Marc').id)
Classification.create(category_id: Category.find_by(title: 'Human Services').id , charity_id: Charity.find_by(name: 'Midwest Food Bank').id)
Classification.create(category_id: Category.find_by(title: 'Human Services').id , charity_id: Charity.find_by(name: 'Direct Relief').id)
Classification.create(category_id: Category.find_by(title: 'Human Services').id , charity_id: Charity.find_by(name: 'Weld Food Bank').id)
Classification.create(category_id: Category.find_by(title: 'Human Services').id , charity_id: Charity.find_by(name: 'Living Beyond Breast Cancer').id)
Classification.create(category_id: Category.find_by(title: 'Human Services').id , charity_id: Charity.find_by(name: 'MAP International').id)
Classification.create(category_id: Category.find_by(title: 'Human Services').id , charity_id: Charity.find_by(name: 'Soles4Souls').id)
Classification.create(category_id: Category.find_by(title: 'Human Services').id , charity_id: Charity.find_by(name: 'Meds & Foods for Kids').id)
Classification.create(category_id: Category.find_by(title: 'Human Services').id , charity_id: Charity.find_by(name: 'Air Warrior Courage Foundation').id)
Classification.create(category_id: Category.find_by(title: 'Human Services').id , charity_id: Charity.find_by(name: 'Safe Haven Family Shelter').id)
Classification.create(category_id: Category.find_by(title: 'Human Services').id , charity_id: Charity.find_by(name: 'Special Operations Warrior Foundation').id)
Classification.create(category_id: Category.find_by(title: 'International').id , charity_id: Charity.find_by(name: 'Direct Relief').id)
Classification.create(category_id: Category.find_by(title: 'International').id , charity_id: Charity.find_by(name: 'MAP International').id)
Classification.create(category_id: Category.find_by(title: 'International').id , charity_id: Charity.find_by(name: 'Middle East Forum').id)
Classification.create(category_id: Category.find_by(title: 'International').id , charity_id: Charity.find_by(name: 'Safe Kids Worldwide').id)
Classification.create(category_id: Category.find_by(title: 'International').id , charity_id: Charity.find_by(name: 'National Immigration Law Center').id)
Classification.create(category_id: Category.find_by(title: 'International').id , charity_id: Charity.find_by(name: 'World Resources Institute').id)
Classification.create(category_id: Category.find_by(title: 'International').id , charity_id: Charity.find_by(name: 'Books For Africa').id)
Classification.create(category_id: Category.find_by(title: 'International').id , charity_id: Charity.find_by(name: 'Soles4Souls').id)
Classification.create(category_id: Category.find_by(title: 'International').id , charity_id: Charity.find_by(name: 'Meds & Foods for Kids').id)
Classification.create(category_id: Category.find_by(title: 'Human and Civil Rights').id , charity_id: Charity.find_by(name: 'Equal Justice Initiative').id)
Classification.create(category_id: Category.find_by(title: 'Human and Civil Rights').id , charity_id: Charity.find_by(name: 'Chicago Foundation for Women').id)
Classification.create(category_id: Category.find_by(title: 'Human and Civil Rights').id , charity_id: Charity.find_by(name: 'Safe Kids Worldwide').id)
Classification.create(category_id: Category.find_by(title: 'Human and Civil Rights').id , charity_id: Charity.find_by(name: 'Middle East Forum').id)
Classification.create(category_id: Category.find_by(title: 'Human and Civil Rights').id , charity_id: Charity.find_by(name: 'Compassion & Choices').id)
Classification.create(category_id: Category.find_by(title: 'Human and Civil Rights').id , charity_id: Charity.find_by(name: 'The Institute for Justice').id)
Classification.create(category_id: Category.find_by(title: 'Human and Civil Rights').id , charity_id: Charity.find_by(name: 'National Immigration Law Center').id)
Classification.create(category_id: Category.find_by(title: 'Community Developement').id , charity_id: Charity.find_by(name: 'California Community Foundation').id)
Classification.create(category_id: Category.find_by(title: 'Community Developement').id , charity_id: Charity.find_by(name: 'The Parent-Child Home Program').id)
Classification.create(category_id: Category.find_by(title: 'Community Developement').id , charity_id: Charity.find_by(name: 'Robin Hood Foundation').id)
Classification.create(category_id: Category.find_by(title: 'Community Developement').id , charity_id: Charity.find_by(name: 'Street School').id)
Classification.create(category_id: Category.find_by(title: 'Community Developement').id , charity_id: Charity.find_by(name: 'Rebuilding Together').id)
Classification.create(category_id: Category.find_by(title: 'Community Developement').id , charity_id: Charity.find_by(name: 'Safe Haven Family Shelter').id)
Classification.create(category_id: Category.find_by(title: 'Community Developement').id , charity_id: Charity.find_by(name: 'Manhattan Theatre Club').id)
Classification.create(category_id: Category.find_by(title: 'Community Developement').id , charity_id: Charity.find_by(name: 'Jewish Federation of Greater Pittsburgh').id)
Classification.create(category_id: Category.find_by(title: 'Community Developement').id , charity_id: Charity.find_by(name: 'The Boston Foundation').id)
Classification.create(category_id: Category.find_by(title: 'Research and Public Policy').id , charity_id: Charity.find_by(name: 'RESULTS Educational Fund').id)
Classification.create(category_id: Category.find_by(title: 'Research and Public Policy').id , charity_id: Charity.find_by(name: 'Middle East Forum').id)
Classification.create(category_id: Category.find_by(title: 'Research and Public Policy').id , charity_id: Charity.find_by(name: 'Public Interest Projects').id)
Classification.create(category_id: Category.find_by(title: 'Research and Public Policy').id , charity_id: Charity.find_by(name: 'Center for Food Safety').id)
Classification.create(category_id: Category.find_by(title: 'Research and Public Policy').id , charity_id: Charity.find_by(name: 'Safe Kids Worldwide').id)
Classification.create(category_id: Category.find_by(title: 'Research and Public Policy').id , charity_id: Charity.find_by(name: 'The Fund for Public Schools').id)
Classification.create(category_id: Category.find_by(title: 'Research and Public Policy').id , charity_id: Charity.find_by(name: 'Southern Environmental Law Center').id)
Classification.create(category_id: Category.find_by(title: 'Research and Public Policy').id , charity_id: Charity.find_by(name: 'The Institute for Justice').id)
Classification.create(category_id: Category.find_by(title: 'Research and Public Policy').id , charity_id: Charity.find_by(name: 'National Immigration Law Center').id)




