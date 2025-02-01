class CountrySerializer < ActiveModel::Serializer
  attributes :id, :safe_name, :user_email

  def user_email
    scope&.email
  end
end
