import axios from 'axios'

export class NuiProxy {
  static async callNui(method: string, parameters: any) {
    try {
      const response = await axios.post(`http://${GetParentResourceName()}/${method}`, parameters)
      const result = response.data

      if (!result || !result.success) {
        return false
      }
      return result.data || {}
    } catch {
      return false
    }
  }
}
