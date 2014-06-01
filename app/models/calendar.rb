class Calendar < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    create! do |calendr|
      calendr.provider = auth["provider"]
      calendr.uid = auth["uid"]
      calendr.name = auth["info"]["name"]
    end
  end


end
