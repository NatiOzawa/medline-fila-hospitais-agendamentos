import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="emergency"
export default class extends Controller {
  static targets = ["lat", "long"]

  success(position) {
    document.querySelector("#lat").innerHTML = position.coords.latitude
    document.querySelector("#long").innerHTML = position.coords.longitude
    console.log(position.coords.latitude, position.coords.longitude)
  }

  error() {
    console.log('Please enable geolocation Services')
    this.latTarget.innerHTML = "Por favor, habilite os serviços de localização do seu navegador!"
  }

  connect() {
    console.log(this.latTarget)
    navigator.geolocation.getCurrentPosition(this.success, this.error)
  }
}
