class Update
    include ActiveModel::Model
    #要素を定義します
    attr_accessor :lat, :lng ,:range ,:smoking
    #バリデーションの定義
    validates :lat, presence: true
    validates :lng, presence: true
    validates :range, presence: true
    validates :smoking, presence: true
end