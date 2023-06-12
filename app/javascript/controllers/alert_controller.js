import { Controller } from "@hotwired/stimulus"
import  Swal  from "sweetalert2"

// Connects to data-controller="alert"
export default class extends Controller {
  static targets = ["list"]
  connect() {
    if (this.listTarget) {
      Swal.fire({
        icon: 'warning',
        title: 'Atenção',
        text: 'Em casos de: <li>- Sinais de ataque cardiaco </li> <li>Sinais de derrame</li>, Tentativa de suicídio, dificuldade servera em respirar, sangramento excessivo, machucados graves, convulsões procure a unidade mais próxima ou Ligue agora para o samu',
        footer: '<a href="">Why do I have this issue?</a>'
      })
    }
  }
}
