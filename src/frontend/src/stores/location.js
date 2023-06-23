import { ref, computed } from 'vue'
import { defineStore } from 'pinia'
import { reactive } from 'vue';


export const getUserLocation = async () => {
  return new Promise((res, rej) => {
    navigator.geolocation.getCurrentPosition(res, rej)
  });
}

export const useLocationStore = defineStore('location', () => {
  const destination = reactive({
    name: '',
    address: '',
    geometry: {
        lat: null,
        lng: null
    }
  })


  const current = reactive({
    geometry: {
      lat: null,
      lng: null,
    }
  })

  const updateCurrentLocation = async () => {
    const userLocation = await getUserLocation()
    current.geometry = {
      lat: userLocation.coords.latitude,
      lng: userLocation.coords.longitude
    }
  }

  return { destination, current, updateCurrentLocation}
});
