class UpdatePlayerAveragesWorker
    include Sidekiq::Worker
  
    def perform
      if User.pending.count > 0
        User.tutors.each do |tutor|
          NewStudentsMailer.send_to(tutor, User.pending.sample(3)).deliver
        end
      end
    end
  end