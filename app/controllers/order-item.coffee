`import Ember from 'ember'`

OrderItemController = Ember.ObjectController.extend
  needs: ['transaction']

  transaction: Em.computed.alias 'controllers.transaction'
  hasFrom: Em.computed.bool 'transaction.from'
  isFrom: Em.computed 'transaction.from', ->
    @get('transaction.from') is @get('content')
  isTo: Em.computed 'transaction.to', ->
    @get('transaction.to') is @get('content')

  actions:
    showPutBack: ->
      @set 'transaction.from', @get 'content'
      false

`export default OrderItemController`
