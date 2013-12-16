namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(email: "admin@admin.ie",
                 password: "administrator",
                 password_confirmation: "administrator")
    admin.toggle!(:admin)
    admin.toggle!(:approved)
  end
end