import { Controller } from "@hotwired/stimulus"
import  Swal  from "sweetalert2"

// Connects to data-controller="alert"
export default class extends Controller {

  connect() {
    const emergencyLink = this.element;
    emergencyLink.addEventListener("click", (event) => {
      event.preventDefault();
      Swal.fire({
        icon: "warning",
        title: "Atenção",
        html: 'Em casos de:<br>- Sinais de ataque cardiaco<br>- Sinais de derrame<br>- Tentativa de suicídio<br>- Dificuldade severa em respirar<br>- Sangramento excessivo<br>- Machucados graves<br>- Convulsões<br>Procure a unidade mais próxima ou ligue agora para o SAMU.',
        footer: '<a href="">Por que tenho esse problema?</a>'
      }).then(() => {
        window.location.href = '/clinics';
      });
    });
  }


}
