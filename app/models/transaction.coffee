`import DS from 'ember-data'`

[attr, hasMany, belongsTo] = [DS.attr, DS.hasMany, DS.belongsTo]


Transaction = DS.Model.extend
  from: belongsTo 'position'
  to: belongsTo 'position'
  quantity: attr 'number'
  date: attr 'date', defaultValue: -> new Date()
  isRealTransaction: Em.computed 'from', 'to', ->
    @get('to') isnt @get('from')
`export default Transaction`
