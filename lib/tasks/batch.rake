namespace :batch do
  desc "TODO"
  task delete_old_deny_tokens: :environment do
    DenyToken.where('expire < ?', DateTime.now).destroy_all
  end

end
