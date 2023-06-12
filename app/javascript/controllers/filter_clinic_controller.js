import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-clinic"
export default class extends Controller {
  static targets = ["form"]

  connect() {
    // console.log(this.formTarget)
  }
  changeDropdown() {
    this.formTarget.action = "new"
    this.formTarget.method = "GET"
    this.formTarget.submit()
  }
}
