namespace :surveys do
  task :realtor_respondent, [:touchpoint] => [:environment] do |_task, args|
    seller = FactoryBot.create(:seller)
    realtor = FactoryBot.create(:realtor)

    seller_survey = Survey.new.tap do |survey|
      survey.respondentable = realtor
      survey.requesterable = seller
      survey.touchpoint = args[:touchpoint]
      survey.score = 0
    end

    seller_survey.save!

    message = <<-MESSAGE
      Hi #{seller.first_name},

      Could you please rate your seller for your latest deal.

      For submitting your ratings, please use below curl command.

      curl -X PATCH \
        http://localhost:3000/api/v1/surveys/#{seller_survey.id} \
        -H 'content-type: application/json' \
        -d '{
          "survey":  {
            "score": "your score between 0 to 10"
          }
        }'

      Regards,
      NPS Service
    MESSAGE

    puts message
  end
end
