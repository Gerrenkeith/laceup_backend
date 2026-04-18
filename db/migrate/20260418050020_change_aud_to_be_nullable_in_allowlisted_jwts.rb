class ChangeAudToBeNullableInAllowlistedJwts < ActiveRecord::Migration[7.1]
  def change
    change_column_null :allowlisted_jwts, :aud, true
  end
end
