<template>
  <div v-show="isVisible" class="min-h-screen bg-gray-800 flex items-center justify-center p-4">
    <!-- 外框容器 -->
    <div class="bg-white rounded-lg shadow-xl p-8 w-[800px] max-w-full">
      <div class="flex justify-between mb-4">
        <button class="flex justify-start">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
            <path
              d="M18.75 12.75h1.5a.75.75 0 0 0 0-1.5h-1.5a.75.75 0 0 0 0 1.5ZM12 6a.75.75 0 0 1 .75-.75h7.5a.75.75 0 0 1 0 1.5h-7.5A.75.75 0 0 1 12 6ZM12 18a.75.75 0 0 1 .75-.75h7.5a.75.75 0 0 1 0 1.5h-7.5A.75.75 0 0 1 12 18ZM3.75 6.75h1.5a.75.75 0 1 0 0-1.5h-1.5a.75.75 0 0 0 0 1.5ZM5.25 18.75h-1.5a.75.75 0 0 1 0-1.5h1.5a.75.75 0 0 1 0 1.5ZM3 12a.75.75 0 0 1 .75-.75h7.5a.75.75 0 0 1 0 1.5h-7.5A.75.75 0 0 1 3 12ZM9 3.75a2.25 2.25 0 1 0 0 4.5 2.25 2.25 0 0 0 0-4.5ZM12.75 12a2.25 2.25 0 1 1 4.5 0 2.25 2.25 0 0 1-4.5 0ZM9 15.75a2.25 2.25 0 1 0 0 4.5 2.25 2.25 0 0 0 0-4.5Z" />
          </svg>
        </button>
        <button class="flex justify-end">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
            class="size-6 hover:text-red-500">
            <path fill-rule="evenodd"
              d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25Zm-1.72 6.97a.75.75 0 1 0-1.06 1.06L10.94 12l-1.72 1.72a.75.75 0 1 0 1.06 1.06L12 13.06l1.72 1.72a.75.75 0 1 0 1.06-1.06L13.06 12l1.72-1.72a.75.75 0 1 0-1.06-1.06L12 10.94l-1.72-1.72Z"
              clip-rule="evenodd" />
          </svg>
        </button>
      </div>

      <!-- 內容區域 -->
      <div class="space-y-6">
        <!-- 標題區域 -->
        <div class="text-center">
          <h1 class="text-4xl text-gray-800 font-bold mb-4">Welcome {{ user }}</h1>
          <p class="text-lg text-gray-600">這是一個能讓 Vue 與 Lua 做 NUI 來回傳接訊息的範本</p>
          <p class="text-lg text-gray-600">This is a template that allows Vue and Lua to use NUI to send messages back
            and forth.</p>
        </div>

        <!-- 輸入和按鈕區域 -->
        <div class="flex flex-col sm:flex-row gap-4 justify-center items-center">
          <input v-model="inputMessage"
            class="flex-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
            placeholder="Enter your message..." />
          <div class="flex gap-2">
            <button @click="sendToLua"
              class="bg-green-600 hover:bg-green-700 text-white font-bold py-2 px-4 rounded-lg transition-colors">
              Send to Lua
            </button>
          </div>
        </div>

        <OpenContianer />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'
import OpenContianer from './components/OpenContianer.vue'
import { nuiProxy } from './api/NuiProxy'

const isVisible = ref(true)
const inputMessage = ref('')
const user = ref('Guest')

const handleUIState = (data: { enable: boolean }) => {
  isVisible.value = data.enable
  console.log('Data Value: ', data)
  console.log('UI 狀態:', isVisible.value ? '開啟' : '關閉')
}

const sendToLua = () => {
  if (!inputMessage.value.trim()) return

  nuiProxy.emit('sun_NuiView/message', {
    type: 'message',
    content: inputMessage.value
  })
  inputMessage.value = ''
}

onMounted(() => {
  nuiProxy.on('openNui', handleUIState)
})

onUnmounted(() => {
  nuiProxy.off('openNui', handleUIState)
  nuiProxy.emit('sun_NuiView/close', {})
})
</script>