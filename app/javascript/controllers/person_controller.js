import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['address', 'addAddress', 'removeButton']
  static values = { addressVisible: Boolean }

  addressVisibleValueChanged() {
    if (this.addressVisibleValue) {
      this.addressTarget.classList.remove('hidden')
      this.removeButtonTarget.classList.remove('!hidden')
      this.addAddressTarget.classList.add('hidden')
    } else {
      this.addressTarget.classList.add('hidden')
      this.removeButtonTarget.classList.add('!hidden')
      this.addAddressTarget.classList.remove('hidden')
    }

    this.updateRemoveNested()
  }

  updateRemoveNested() {
    const destroyInput = this.addressTarget.querySelector("input[name*='_destroy']")

    destroyInput.value = !this.addressVisibleValue
  }

  changeVisibleButtonIcon() {
    if (this.addressVisibleValue) {
      icon.classList.remove('fa-plus')
    } else {
      icon.classList.add('fa-plus')
    }
  }

  changeAddressVisible() {
  }

  toggleAddressVisible() {
    this.addressVisibleValue = !this.addressVisibleValue
  }
}