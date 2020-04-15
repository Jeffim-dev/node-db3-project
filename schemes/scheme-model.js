const db = require('../data/db-config.js')

function find() {
  return db('schemes');
}

function findById(id) {
  return db('schemes').where({ id }).first();
}

function findSteps(id) {
  return db('steps as st')
    .join('schemes as sc', 'sc.id', 'st.scheme_id')
    .select('st.id', 'st.step_number', 'st.instructions', 'st.scheme_id')
    .where({ scheme_id: id })
}

function add(schemeData) {
  return db('schemes').insert(schemeData)
}

function addStep(stepData, id) {
  return db('steps').where({ id }).insert(stepData)
}

function update(changes, id) {
  return db('schemes').where({ id }).update(changes);
}

function remove(id) {
  return db('schemes').where({ id }).del()
} 

module.exports = {
  find,
  findById,
  findSteps,
  add,
  addStep,
  update,
  remove
}