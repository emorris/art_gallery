class AppSetting < ActiveRecord::Base
  validates_inclusion_of :singleton_guard, :in => [0]

  def self.instance
    begin
      find(1)
    rescue ActiveRecord::RecordNotFound
      app_setting = AppSetting.new
      app_setting.singleton_guard = 0
      app_setting.save!
      app_setting
    end
  end
end
