`import Ember from 'ember'`

PlantRoute = Ember.Route.extend
  actions:
    goBack: ->
      @transitionTo 'plants'


`export default PlantRoute`
