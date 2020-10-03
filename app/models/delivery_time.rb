class DeliveryTime < ApplicationRecord
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '午前中（8時～12時' },
    { id: 3, name: '14時～16時' },
    { id: 4, name: '16時～18時' },
    { id: 5, name: '18時～20時' },
    { id: 6, name: '19時～21時' },
    { id: 7, name: '指定なし' },
  ]
end
