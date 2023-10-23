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

Admin.create!(
  first_name: "杉澤",
  last_name: "勇弥",
  first_name_kana: 'スギサワ',
  last_name_kana: 'ユウヤ',
  email: "sugisawa@sugisawa",
  password: "123456789",
  password_confirmation: "123456789",
  telephone_number: "123456789",
  post_code: "1234567",
  address: "東京",
  is_member: true
)

Admin.create!(
  first_name: "山下",
  last_name: "哲平",
  first_name_kana: 'ヤマシタ',
  last_name_kana: 'テッペイ',
  email: "yamashita@yamashita",
  password: "123456789",
  password_confirmation: "123456789",
  telephone_number: "123456789",
  post_code: "1234567",
  address: "東京",
  is_member: true
)

Admin.create!(
  first_name: "阿部",
  last_name: "英行",
  first_name_kana: 'アベ',
  last_name_kana: 'ヒデユキ',
  email: "abe@abe",
  password: "123456789",
  password_confirmation: "123456789",
  telephone_number: "123456789",
  post_code: "1234567",
  address: "東京",
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
  )
end

genres = [
  "ケーキ",
  "プリン",
  "焼き菓子",
  "キャンディー"
  ]

genres.each do |genre|
  Genre.create!(
    name: genre
  )
end


items_array = [
  # ケーキ
  ['ショートケーキ',
  'チョコレートケーキ',
  'レアチーズケーキ',
  'ベイクドチーズケーキ',
  'モンブラン',
  'ブッシュドノエル',
  '生チョコタルト',
  'チーズタルト',
  'タルトタタン',
  'ミルクレープ'
  ],
  # プリン
  [
    'カスタードプリン',
    'ミルクプリン',
    '抹茶プリン'
  ],

  # 焼き菓子
  [
  'マドレーヌ',
  'フィナンシェ',
  'マカロン',
  'バウムクーヘン',
  'ラスク',
  'リーフパイ'
  ],
  # キャンディ
  [
   '棒付キャンディ',
   'ドロップ',
   '金平糖',
   'グミ'
    ]
 ]

count = 1
items_array.each_with_index do |items, i|
  items.each_with_index do |item, j|
    item = Item.create!(
      name: item,
      explanation: "#{item}の説明。",
      genre_id: i+1,
      # stock: 20,
      cost: 400,
      is_sales: true
    )
  # puts count
    # 画像
     item.image.attach(io: File.open(Rails.root.join("app/assets/images/cake.image/cake#{count}.jpg")),filename: "item-#{i+1}-#{j+1}.jpg")
     count += 1
  end
  
    9.times do |n|
    Address.create!(
      name: "test#{n + 1}",
      post_code: "1234567",
      address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
      customer_id: n + 1
    )
  end
  
  # 10.times do |n|
  #   Order.create!(
  #     customer_id: n +1,
  #     address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
  #     post_code: "1234567",
  #     name: "test#{n + 1}",
  #     shipping_cost: "800",
  #     total_payment: "#{1000 + (n * 1000) +800}",
  #     payment_method: "クレジットカード",
  #     status: "入金待ち"
  #   )
  # end
  
  # 10.times do |n|
  #   OrderDetail.create!(
  #     item_id: n + 1,
  #     order_id: n + 1,
  #     count: n + 3,
  #     price: "#{1000 + (n * 1000)}",
  #     making_status: "着手不可"
  #   )
  # end
  
end