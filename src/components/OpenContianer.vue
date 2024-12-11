<template>
    <div v-show=isNuiOpen.display class="flex items-center">
        <p class="text-white">Open</p>
    </div>
</template>

<script setup>
import { ref } from 'vue'
import { useOpenNuiStore } from '../stores/openNui'

const isNuiOpen = useOpenNuiStore()
</script>