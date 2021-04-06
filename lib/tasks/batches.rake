namespace :batches do
  
  desc "Creates a batch, matches, and prints them"
  task :create_and_print_batch, [:campaign_id, :batch_duration_minutes, :batch_size] => [:environment] do |t, args|
      puts args[:campaign_id]
      puts args[:batch_duration_minutes]
      puts args[:batch_size]
      campaign = Campaign.find_by(id: args[:campaign_id])
      unless campaign
        puts "Campaign not found" and return
      end
      puts "Campaign : #{campaign.name}"
      batch = CampaignBatch.create!(campaign: campaign, vaccination_center: campaign.vaccination_center, partner: campaign.partner, size: args[:batch_size], duration_in_minutes: args[:batch_duration_minutes])

      puts "Batch #{batch.id} created"
    end
end
