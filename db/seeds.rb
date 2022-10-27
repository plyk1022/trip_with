Admin.create(
  email: 'admin@trip-with.com',
  password: 'admin-trip-with'
  )

Prefecture.create(name: '北海道')
Prefecture.create(name: '青森県')
Prefecture.create(name: '岩手県')
Prefecture.create(name: '宮城県')
Prefecture.create(name: '秋田県')
Prefecture.create(name: '山形県')
Prefecture.create(name: '福島県')
Prefecture.create(name: '茨城県')
Prefecture.create(name: '栃木県')
Prefecture.create(name: '群馬県')
Prefecture.create(name: '埼玉県')
Prefecture.create(name: '千葉県')
Prefecture.create(name: '東京都')
Prefecture.create(name: '神奈川県')
Prefecture.create(name: '新潟県')
Prefecture.create(name: '富山県')
Prefecture.create(name: '石川県')
Prefecture.create(name: '福井県')
Prefecture.create(name: '山梨県')
Prefecture.create(name: '長野県')
Prefecture.create(name: '岐阜県')
Prefecture.create(name: '静岡県')
Prefecture.create(name: '愛知県')
Prefecture.create(name: '三重県')
Prefecture.create(name: '滋賀県')
Prefecture.create(name: '京都府')
Prefecture.create(name: '大阪府')
Prefecture.create(name: '兵庫県')
Prefecture.create(name: '奈良県')
Prefecture.create(name: '和歌山県')
Prefecture.create(name: '鳥取県')
Prefecture.create(name: '島根県')
Prefecture.create(name: '岡山県')
Prefecture.create(name: '広島県')
Prefecture.create(name: '山口県')
Prefecture.create(name: '徳島県')
Prefecture.create(name: '香川県')
Prefecture.create(name: '愛媛県')
Prefecture.create(name: '高知県')
Prefecture.create(name: '福岡県')
Prefecture.create(name: '佐賀県')
Prefecture.create(name: '長崎県')
Prefecture.create(name: '熊本県')
Prefecture.create(name: '大分県')
Prefecture.create(name: '宮崎県')
Prefecture.create(name: '鹿児島県')
Prefecture.create(name: '沖縄県')

users = User.create!([
  {
    email: 'trip-taro@test.com',
    name: 'トリップ太郎',
    introduction: '旅行が趣味です。駅弁も旅行の楽しみ！',
    password: 'password',
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpeg"),
    filename:"sample-user1.jpeg")},
  {
    email: 'travel-hanako@test.com',
    name: 'トラベル花子',
    introduction: 'お出かけ記録',
    password: 'password',
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpeg"),
    filename:"sample-user2.jpeg")},
  {
    email: 'toricco@test.com',
    name: 'とりっこ@一人旅',
    introduction: '一人旅記録
    旅行を楽しみに日々お仕事頑張ってます！',
    password: 'password',
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpeg"),
    filename:"sample-user3.jpeg")},
  {
    email: 'ryoko-shoshinsha@test.com',
    name: '旅行初心者',
    introduction: '投稿少なめ、閲覧メイン。
    もっといろんなとこに行ってみたい!',
    password: 'password',
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpeg"),
    filename:"sample-user4.jpeg")},
  {
    email: 'ichiro@test.com',
    name: '旅好き一郎',
    introduction: '自然を求めてよく旅行をしています。
    山登りも好きです。',
    password: 'password',
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpeg"),
    filename:"sample-user5.jpeg")},
  {
    email: 'tsukisoi@test.com',
    name: 'つきそい二郎',
    introduction: '旅行好きな妻のつきそい旅',
    password: 'password',
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpeg"),
    filename:"sample-user6.jpeg")},
  {
    email: 'kuidaore@test.com',
    name: 'くいだおれ三郎',
    introduction: 'グルメ旅多め
    全国の美味しいものを食べ尽くす！',
    password: 'password',
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpeg"),
    filename:"sample-user7.jpeg")},
  {
    email: 'touring@test.com',
    name: 'ツーリング四郎',
    introduction: 'バイクで日本一周中',
    password: 'password',
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpeg"),
    filename:"sample-user8.jpeg")},
  {
    email: 'michiko@test.com',
    name: 'みち子＠歴女',
    introduction: '歴史スポット巡り',
    password: 'password',
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpeg"),
    filename:"sample-user9.jpeg")},
  {
    email: 'machiko@test.com',
    name: '御朱印町子',
    introduction: '御朱印集めに全国へ',
    password: 'password',
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.jpeg"),
    filename:"sample-user10.jpeg")},
  ]
)