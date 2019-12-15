class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :undeleted, -> { where(marked_as_deleted: false) }

  def delete!
    update_columns(marked_as_deleted: true)
  end

  def self.pagination(params)
    undeleted.order(created_at: :desc).page(params[:page]).per(params[:size])
  end
end