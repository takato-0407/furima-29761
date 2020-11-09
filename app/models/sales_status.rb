class SalesStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1人' },
    { id: 3, name: '2人' },
    { id: 4, name: '3人~4人' },
    { id: 5, name: '5人~6人' },
    { id: 6, name: '7人~8人' },
    { id: 7, name: '10人以上' }

  ]
end
