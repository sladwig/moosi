`import DS from 'ember-data'`
attr = DS.attr
hasMany = DS.hasMany
belongsTo = DS.belongsTo

Order = DS.Model.extend
  number: attr 'string'
  customer: attr 'string'
  adress: attr 'string'
  date: attr 'date'
  orderItems: hasMany 'orderItem', async: true
  findOrderItemFor: (plant) ->
    orderItem = @get('orderItems').find (orderItem) -> orderItem.get('plant') is plant
    return orderItem if orderItem
    orderItem = @store.createRecord 'orderItem',
      order: @
      plant: plant
      quantity: 0
    orderItem.save()
    orderItem
  totalPrice: Em.computed 'orderItems.@each.total', ->
    sum = 0
    @get('orderItems').forEach (orderItem) -> sum += orderItem.get 'total'
    sum
  name: Em.computed 'number', -> "Rechnung #{@get('number')}"

Order.reopenClass
  FIXTURES: [
    {
      id: 1
      number: '1'
      customer: 'Marko Liebknecht'
      adress: 'Tannenallee 23
      23443 Freiland'
      date: '2014-11-15'
      orderItems: [1, 2]

    }
    {
      id: 2
      number: '2'
      customer: 'Resi Laub'
      adress: 'Hammer Baum 23
      20243 Hamburg'
      date: '2014-12-02'
      orderItems: [3]
    }

  ]

`export default Order`
