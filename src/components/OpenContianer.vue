<template>
    <div v-show=isNuiOpen.display class="flex items-center">
        <p class="text-white">Open</p>
    </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
// import { nuiProxy } from '../api/NuiProxy'

const isNuiOpen = ref(false)

</script>