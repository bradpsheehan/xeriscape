import React, { useEffect, useState } from 'react'
import axios from 'axios'

export function Garden(props) {
  const [plants, setPlants] = useState(props.garden.plants)
  const [rootLengths, setRootLengths] = useState(props.garden.plant_root_lengths)

  function handleWatering(event) {
    axios.post(`/api/v1/irrigations`, { plant_id: event.currentTarget.childNodes[0].value }).then((response) => {
      let response_data = response.data.data
      console.log(response_data)
      let newRootLengths = {...rootLengths}
      newRootLengths[response_data.irrigation.plant_id] = {
        root_length: response_data.plant_root_length,
        status: response_data.plant_status
      }
      console.log(newRootLengths)
      setRootLengths(newRootLengths)
    })

    event.preventDefault()
  }

  const plantListItems = plants.map((plant, index) => {
    return (
      <div className='plant-card' key={index}>
        <h4>{plant.name}</h4>
        <h5>{plant.description}</h5>
        <ul>
          <li><strong>Status: </strong><span data-role={`plant_${plant.id}_status`}>{rootLengths[plant.id].status}</span></li>
          <li><strong>Root Length: </strong><span data-role={`plant_${plant.id}_root_length`}>{rootLengths[plant.id].root_length}"</span></li>
        </ul>
        <form action="post" onSubmit={handleWatering}>
          <input type="hidden" name="plant_id" value={plant.id}/>
          <button data-role={`water_plant_${plant.id}`}>Water Plant</button>
        </form>
        <hr/>
      </div>
    )
  })

  return (
    <div>
      <h1 data-role="garden_name">{ props.garden.name }</h1>
      <h3>Plant Count: { props.garden.plants.length }</h3>

      <hr/>

      {plantListItems}

    </div>
  )
}

export default Garden
