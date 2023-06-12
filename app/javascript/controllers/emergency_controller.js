import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="emergency"
export default class extends Controller {
  static targets = ["lat", "long"]

  success(position) {
    document.querySelector("#lat").value = position.coords.latitude
    document.querySelector("#long").value = position.coords.longitude
    console.log(position.coords.latitude, position.coords.longitude)
  }

  error() {
    console.log('Please enable geolocation Services')
    this.latTarget.innerHTML = "Por favor, habilite os serviços de localização do seu navegador!"
  }

  connect() {

    navigator.geolocation.getCurrentPosition(this.success, this.error)
  }

  call(event) {
    let params = new URLSearchParams()
    event.preventDefault()
    params.append("latitude", this.latTarget.value)
    params.append("longitude", this.longTarget.value)

    fetch(`/clinics?${params}`, {
      headers: {Accept: "text/plain"}
       })
    .then(response => response.text())

  }


}
