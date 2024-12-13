<template>
  <div v-show="isVisible" class="min-h-screen bg-gray-800 flex items-center justify-center p-4">
    <!-- 外框容器 -->
    <div class="bg-white rounded-lg shadow-xl p-8 w-[800px] max-w-full">
      <!-- 內容區域 -->
      <div class="space-y-6">
        <!-- 標題區域 -->
        <div class="text-center">
          <h1 class="text-4xl text-gray-800 font-bold mb-4">Welcome {{ user }}</h1>
          <p class="text-lg text-gray-600">這是一個能讓 Vue 與 Lua 做 NUI 來回傳接訊息的範本</p>
          <p class="text-lg text-gray-600">This is a template that allows Vue and Lua to use NUI to send messages back and forth.</p>
        </div>

        <!-- 輸入和按鈕區域 -->
        <div class="flex flex-col sm:flex-row gap-4 justify-center items-center">
          <input 
            v-model="inputMessage"
            class="flex-1 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
            placeholder="Enter your message..."
          />
          <div class="flex gap-2">
            <button 
              @click="sendToLua"
              class="bg-green-600 hover:bg-green-700 text-white font-bold py-2 px-4 rounded-lg transition-colors"
            >
              Send to Lua
            </button>
            <button 
              @click="sendToVue"
              class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-lg transition-colors"
            >
              Send to Vue
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
  inputMessage.value = '' // 清空輸入
}

const sendToVue = () => {
  // 這裡可以添加發送到 Vue 的邏輯
  console.log('Message to Vue:', inputMessage.value)
  inputMessage.value = '' // 清空輸入
}

onMounted(() => {
  nuiProxy.on('openNui', handleUIState)
})

onUnmounted(() => {
  nuiProxy.off('openNui', handleUIState)
  nuiProxy.emit('sun_NuiView/close', {})
})
</script>