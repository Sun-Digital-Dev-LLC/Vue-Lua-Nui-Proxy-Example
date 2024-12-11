import { defineStore } from 'pinia'
import { NuiProxy } from '../services/NuiProxy'

export const useOpenNuiStore = defineStore('openNui', {
  state: () => {
    return { display: false }
  },

  actions: {
    close() {
      NuiProxy.callNui('close', null)
    },
  },
})
