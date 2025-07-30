<!-- src/components/Popup.vue -->
<template>
  <div class="popup-backdrop" @click.self="close">
    <div class="popup-box" :style="{ backgroundColor: backgroundColor }">
      <button class="popup-close" @click="close">×</button>
      <h2 class="headline-a popup-title">{{ title }}</h2>
      <p class="popup-text" v-html="content"></p>
    </div>
  </div>
</template>

<script setup>
import { defineProps, defineEmits } from 'vue'

defineProps({
  backgroundColor: { type: String, default: '#92D097' },
  title: { type: String, required: true },
  content: { type: String, required: true }
})
const emit = defineEmits(['close'])
function close() {
  emit('close')
}
</script>

<style scoped>
.popup-title {
  margin-top: 60px;
  font-size: 2.5rem;
  font-weight: 500;
  margin-bottom: 20px;
}

.popup-text {
  font-family: 'Ariel';
  font-size: 1.2rem;
}

.popup-backdrop {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background: rgba(0, 0, 0, 0.4);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
}

.popup-box {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: left;
  flex-direction: column;
  width: 70%;
  max-width: 1200px;
  min-height: 60%;
  max-height: 90%;
  overflow-y: auto;
  padding: 4rem;
  color: var(--color-white);
}

.popup-close {
  position: absolute;
  top: 0px;
  right: 0rem;
  background: none;
  border: none;
  font-size: 4rem;
  color: var(--color-white);
  line-height: 1;
  cursor: pointer;
  margin-right: 10px;
}

@media (max-width: 480px) {
  .popup-box {
    width: 85%;
  }
  .popup-title {
    font-size: 2rem;
    text-wrap: wrap;
  }

  .popup-text {
    font-family: 'Ariel';
    font-size: 1rem;
  }
}
</style>
