# ながのCake　ECサイト
## アプリケーション概要
![スクショ](https://github.com/nagano-cake-k/nagano-cake/assets/141293221/0e57821e-5bca-4ecd-8860-cf825894716e)

### 概要
長野県にある洋菓子店「ながのCAKE」様の商品を通販するためのECサイト開発。  
DMM WEB CAMPが用意した架空の店舗です。  

### 案件の背景
元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになった。   
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、  
管理機能を含んだ通販サイトを開設しようと思い至った。  

### 通販について
・通販では注文に応じて制作する受注生産型としている。  
・現在通販での注文料は十分に対応可能な量のため、１日の受注量に制限は設けない。  
・送料は１配送につき全国一律８００円  
・友人や家族へのプレゼントなど、注文者の住所以外にも商品を発送できる。  
・支払い方法はクレジットカード、銀行振込から選択できる。  

### 使用言語
・HTML/CSS  
・Sass  
・JavaScript  
・Ruby  

### フレームワーク・ライブラリ
・Ruby on Rails  
・devise  
・Kaminari  
・enum_help  
・jQuery  
・Bootstrap  

### 使用方法
$ git clone git@github.com:nagano-cake-k/nagano-cake.git  
$ cd nagano-cake  
$ bundle install  
$ rails db:migrate  
$ rails db:seed  
$ yarn add @babel/plugin-proposal-private-methods @babel/plugin-proposal-private-property-in-object  
$ rails s  


### 設計書

![roomK＿ゲームフリーク＿ER図（改定） (1)](https://github.com/nagano-cake-k/nagano-cake/assets/141293221/d4d9cfab-0ff5-47aa-97e9-960d5f3025cf)
[チームK_ゲームフリーク_アプリケーション詳細設計書_回答用  - routes.pdf](https://github.com/nagano-cake-k/nagano-cake/files/13174874/K_._._.-.routes.pdf)
