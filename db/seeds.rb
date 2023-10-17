# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

########## ユーザー
# 五十嵐さん
Admin.create!(
  first_name: "五十嵐",
  last_name: "一稀",
  first_name_kana: 'イガラシ',
  last_name_kana: 'カズキ',
  email: "igarashi@igarashi",
  password: "123456789",
  password_confirmation: "123456789",
  telephone_number: "123456789",
  post_code: "1234567",
  address: "栃木県栃木市",
  is_member: true
)

# その他顧客ユーザー
20.times do |num|
  Customer.create!(
    first_name: "顧客#{num + 1}",
    last_name: "ユーザー#{num + 1}",
    first_name_kana: "コキャク#{num + 1}",
    last_name_kana: "ユーザー#{num + 1}",
    email: "email#{num + 1}@email",
    password: "password#{num + 1}",
    password_confirmation: "password#{num + 1}",
    telephone_number: "password#{num + 1}",
    post_code: "1234567",
    address: "栃木県"
    # is_member: false
  )
end


# 山下
# User.create!(
#   name: "Fujii",
#   email: "fujii@fujii",
#   password: "11111111",
#   password_confirmation: "11111111",
#   telephone_number: "111111111",
#   admin_flag: true
# )

# # 池上さん
# User.create!(
#   name: "Ikegami",
#   email: "ikegami@ikegami",
#   password: "000000000",
#   password_confirmation: "000000000",
#   telephone_number: "000000000",
#   admin_flag: true
# )

# # しょーさん（顧客ユーザー）
# User.create!(
#   name: "しょーさん",
#   email: "sho@sho",
#   password: "22222222",
#   password_confirmation: "22222222",
#   telephone_number: "222222222"
# )


