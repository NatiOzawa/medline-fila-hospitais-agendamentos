import { Controller } from "@hotwired/stimulus"
import  Swal  from "sweetalert2"

// Connects to data-controller="alert"
export default class extends Controller {
  static targets = ["list"]
  connect() {
    if (this.listTarget) {
      Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: 'Something went wrong!',
        footer: '<a href="">Why do I have this issue?</a>'
      })
    }

  }
}
