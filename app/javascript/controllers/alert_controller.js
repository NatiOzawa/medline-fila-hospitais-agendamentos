import { Controller } from "@hotwired/stimulus"
import  Swal  from "sweetalert2"

// Connects to data-controller="alert"
export default class extends Controller {

  connect() {

  }

  display() {
    Swal.fire({
      title: '',
      text: '',
      imageUrl: '/images/alerta.png',
      imageWidth: 400,
      imageHeight: 300,
      imageAlt: 'Alerta',
    })
      // .then(() => {
      //   window.location.href = '/clinics';
      //   });
  }
}
