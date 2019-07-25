describe('My First Test', function() {
  it('Does not do much!', function() {
    cy.visit('http://localhost:3000/gardens/3')
    cy.get('[data-role=garden_name]')

    cy.get(`[data-role=plant_${7}_status]`).should('contain', 'dead')
    cy.get(`[data-role=plant_${7}_root_length]`).should('contain', '22"')

    cy.get(`[data-role=water_plant_${7}]`).click()

    // expect those attrs to contain updated data

  })
})
