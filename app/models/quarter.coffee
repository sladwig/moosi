`import DS from 'ember-data'`
attr = DS.attr
hasMany = DS.hasMany
belongsTo = DS.belongsTo

Quarter = DS.Model.extend
  name: attr()


`export default Quarter`
