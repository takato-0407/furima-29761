class Prefecture < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ランチのみ(午前中~夕方まで)' },
    { id: 3, name: 'ランチ・ディナー(午前中~午後23時頃まで)' },
    { id: 4, name: 'ディナーのみ(夕方~午後23時頃まで)' },
    { id: 5, name: '24時間営業' },
    { id: 6, name: 'その他' }
  ]
end
