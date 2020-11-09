class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '居酒屋' },
    { id: 3, name: 'バル' },
    { id: 4, name: 'ビストロ' },
    { id: 5, name: 'レストラン' },
    { id: 6, name: 'グランメゾン' },
    { id: 7, name: 'カフェ' },
    { id: 8, name: 'その他' }
  ]
end
