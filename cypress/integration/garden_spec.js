describe('My First Test', function() {
  it('Does not do much!', function() {
    cy.visit('http://localhost:3000/gardens/3')
    cy.get('[data-role=garden_name]')

    cy.get(`[data-role=plant_${6}_status]`).should('contain', 'dead')
    cy.get(`[data-role=plant_${6}_root_length]`).should('contain', '24"')

    // click water plant
    // expect those attrs to contain updated data

  })
})
