namespace :surveys do
  task :seller_respondent, [:touchpoint] => [:environment] do |_task, args|
    seller = FactoryBot.create(:seller)
    realtor = FactoryBot.create(:realtor)

    realtor_survey = Survey.new.tap do |survey|
      survey.respondentable = seller
      survey.requesterable = realtor
      survey.touchpoint = args[:touchpoint]
      survey.score = 0
    end

    realtor_survey.save!

    message = <<-MESSAGE
      Hi #{seller.first_name},

      Could you please rate your realtor for your latest deal.

      For submitting your ratings, please use below curl command.

      curl -X PATCH \
        http://localhost:3000/api/v1/surveys/#{realtor_survey.id} \
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
