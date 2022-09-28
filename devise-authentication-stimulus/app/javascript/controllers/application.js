import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
application.warning = true
window.Stimulus   = application

export { application }

console.log('controller/application.js')