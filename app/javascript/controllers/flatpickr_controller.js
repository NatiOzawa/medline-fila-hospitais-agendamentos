import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "date" ]
  connect() {
    flatpickr(this.dateTarget, {
      enableTime: false,
      minDate: "today",
      maxDate: new Date(2023, 11, 29),
      altInput: true,
      dateFormat: "d-m-y",
      time_24hr: true,
      altFormat: "j-F-y",
      minuteIncrement: 15,

      disable: [
        function(date) {
          return date.getDay() === 6 || date.getDay() === 0;
        }
      ],

      locale: {
        months: {
          shorthand: [
            "Jan",
            "Fev",
            "Mar",
            "Abr",
            "Mai",
            "Jun",
            "Jul",
            "Ago",
            "Set",
            "Out",
            "Nov",
            "Dez"
          ],
          longhand: [
            "Janeiro",
            "Fevereiro",
            "Março",
            "Abril",
            "Maio",
            "Junho",
            "Julho",
            "Agosto",
            "Setembro",
            "Outubro",
            "Novembro",
            "Dezembro"
          ]
        }
      }
    })
  }
}
