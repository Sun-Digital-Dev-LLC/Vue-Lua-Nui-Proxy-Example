<template>
  <div class="flex min-h-screen bg-gray-400 items-center justify-center">
    <div class="items-center justify-center">
      <div class="text-center">
        <h1 class="text-4xl text-black font-bold mb-4">Welcome {{ user }}</h1>
        <p class="text-lg text-white">這是一個能讓 Vue 與 Lua 做 NUI 來回傳接訊息的範本</p>
        <p class="text-lg text-white">This is a template that allows Vue and Lua to use NUI to send messages back and forth.</p>
      </div>
      <div class="flex mt-4 gap-2 justify-center">
        <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-lg">Send to Lua</button>
        <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-lg">Send to Vue</button>
      </div>
      <OpenContianer />
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import OpenContianer from './components/OpenContianer.vue'

const user = ref('Guest')
</script>
