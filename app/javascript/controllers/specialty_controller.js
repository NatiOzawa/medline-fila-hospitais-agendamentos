import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = ["doctors", "clinics" ]
  static values = {
    urlDoctors: String,
    specialtyParam: String,
    urlClinics: String
  }

  connect() {
    if (this.doctorsTarget.id === "") {
      this.doctorsTarget.id = Math.random().toString(36)
    }
    if (this.clinicsTarget.id === "") {
      this.clinicsTarget.id = Math.random().toString(36)
    }
  }

  changeDoctors(event) {
    let params = new URLSearchParams()
    params.append(this.specialtyParamValue, event.target.selectedOptions[0].value)
    params.append("target", this.doctorsTarget.id)

    get(`${this.urlDoctorsValue}?${params}`, {
      responseKind: "turbo-stream"
    })
  }

  changeClinics(event) {
    let params = new URLSearchParams()
    params.append(event.target.dataset.specialtyParamDoctorsValue, event.target.selectedOptions[0].value)
    params.append("target", this.clinicsTarget.id)

    get(`${event.target.dataset.specialtyUrlClinicsValue}?${params}`, {
      responseKind: "turbo-stream"
    })
  }
}
