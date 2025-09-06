<template>
  <div class="container-imp">
    <!-- Desktop layout -->
    <div class="desktop-wrapper" v-show="!isMobile">
      <!-- Top three buttons -->
      <div class="row-container">
        <button class="diamond" @click="onClick(buttonKeys[0])">
          <span class="diamond-label">{{ buttonKeys[0] }}</span>
        </button>
        <button class="diamond" @click="onClick(buttonKeys[1])">
          <span class="diamond-label">{{ buttonKeys[1] }}</span>
        </button>
        <button class="diamond" @click="onClick(buttonKeys[2])">
          <span class="diamond-label">{{ buttonKeys[2] }}</span>
        </button>
      </div>

      <!-- Buttons and text -->
      <div class="row-container row-middle">
        <button class="diamond" @click="onClick(buttonKeys[3])">
          <span class="diamond-label">{{ buttonKeys[3] }}</span>
        </button>
        <div class="mb-12">
          <h1 class="headline-a headline-imp">
            Myterne om <br />
            investeringer
          </h1>
          <p class="text-a text-imp">
            Mange af os investerer uden at kende mekanismerne bag. <br />
            Klik og få vendt myterne bag vores investeringer.
          </p>
        </div>
        <button class="diamond" @click="onClick(buttonKeys[4])">
          <span class="diamond-label">{{ buttonKeys[4] }}</span>
        </button>
      </div>

      <!-- Bottom three buttons -->
      <div class="row-container">
        <button class="diamond" @click="onClick(buttonKeys[5])">
          <span class="diamond-label">{{ buttonKeys[5] }}</span></button
        ><button class="diamond" @click="onClick(buttonKeys[6])">
          <span class="diamond-label">{{ buttonKeys[6] }}</span></button
        ><button class="diamond" @click="onClick(buttonKeys[7])">
          <span class="diamond-label">{{ buttonKeys[7] }}</span>
        </button>
      </div>
    </div>

    <div v-show="isMobile" class="mobile-stack">
      <div class="mobile-text-holder">
        <h1 class="headline-a headline-imp">
          Myterne om <br />
          investeringer
        </h1>
        <p class="text-a text-imp">
          Mange af os investerer uden at kende mekanismerne bag. <br />
          <br />
          Klik og få vendt myterne bag vores investeringer.
        </p>
      </div>

      <div class="mobile-button-holder">
        <div
          v-for="(key, i) in buttonKeys"
          :key="i"
          :class="['mobile-diamond-wrapper', i % 2 === 0 ? 'left' : 'right']"
          :style="{
            top: `${i * 100 + 300}px`,
            left: i % 2 === 0 ? '50px' : 'auto',
            right: i % 2 === 1 ? '50px' : 'auto'
          }"
        >
          <button class="diamond" @click="onClick(key)">
            <span class="diamond-label">{{ key }}</span>
          </button>
        </div>
      </div>
    </div>

    <Popup
      v-if="showPopup"
      :title="popupTitle"
      :content="popupContent"
      backgroundColor="var(--color-light-purple)"
      @close="showPopup = false"
    />
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import Popup from './Popup.vue'
import investMythData from '@/assets/Data/InvestMyths.json'

const buttonKeys = [
  'Aktiehandel',
  'Indeksfonde',
  'Pension',
  'Kursstigning',
  'Afkast',
  'Ejendom',
  'Tidspunkt',
  'Vækst'
]

const showPopup = ref(false)
const isMobile = ref(false)

var popupTitle = 'Error'
var popupContent = 'Error'

function handleResize() {
  isMobile.value = window.innerWidth < 768
}

onMounted(() => {
  handleResize()
  window.addEventListener('resize', handleResize)
})

onUnmounted(() => {
  window.removeEventListener('resize', handleResize)
})

function onClick(name) {
  showPopup.value = true

  console.log(name)

  const found = investMythData.find(item => item.key === name)
  if (found) {
    popupTitle = found.title
    popupContent = found.text
  } else {
    popupTitle = 'Error could not find'
    popupContent = ''
  }
}
</script>

<style scoped>
.container-imp {
  width: 100%;
  overflow-x: hidden;
  background-color: var(--color-dark-green);
  display: flex;
  justify-content: center;
  align-items: center;
}

.desktop-wrapper {
  height: 40rem;
  max-width: 1200px;
  width: 100%;
  box-sizing: border-box;
  padding: 2rem;
  padding-top: 2.8rem;
  padding-bottom: 2.8rem;
  background-color: var(--color-dark-green);
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  flex-direction: column;
  gap: 40px;
}

.row-container {
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  flex-direction: row;
  gap: 180px;
}

.row-middle {
  gap: 60px;
}

.diamond {
  width: 120px;
  height: 120px;
  background-color: var(--color-light-purple);
  transform: rotate(45deg);
  display: flex;
  align-items: center;
  justify-content: center;
  transition: background-color 0.3s, transform 0.2s;
  border: none;
  cursor: pointer;
  padding: 0; /* Ensure no unexpected offset */
  overflow: hidden; /* Optional: prevent overflow */
}

.diamond:hover {
  background-color: var(--color-dark-purple);
  transform: rotate(45deg) scale(1.05);
}

.diamond-label {
  transform: rotate(-45deg);
  color: white;
  font-size: 20px;
  text-align: center;
  width: 120px;
  pointer-events: none; /* Ensures click works on button, not just label */
}

.headline-imp {
  font-size: 3.7rem;
  font-weight: 600;
  color: var(--color-white);
}

.text-imp {
  font-size: 1.2rem;
  color: var(--color-white);
}

@media (max-width: 768px) {
  .headline-imp {
    font-size: 2.8rem;
  }

  .mobile-stack {
    position: relative;
    display: flex;
    padding: 2rem;
    background-color: var(--color-dark-green);
    flex-direction: column;
    align-items: center;
    text-align: left;
    gap: 0;
    width: 100%;
  }

  .mobile-text-holder {
    display: flex;
    padding: 0rem;
    background-color: var(--color-dark-green);
    flex-direction: column;
    align-items: left;
    text-align: left;
    gap: 0;
    width: 100%;
  }

  .mobile-button-holder {
    display: flex;
    padding: 2rem;
    background-color: var(--color-dark-green);
    flex-direction: column;
    align-items: center;
    text-align: center;
    max-width: 300px;
    height: 900px;
    gap: 0;
    width: 100%;
  }

  .diamond {
    width: 120px;
    height: 120px;
  }

  .diamond-label {
    font-size: 18px;
    width: 120px;
  }

  .mobile-diamond-wrapper {
    position: absolute;
    width: 100%;
    display: flex;
    justify-content: center;
  }
}

@media (max-width: 400px) {
  .mobile-diamond-wrapper {
    top: auto !important; /* ignore inline top */
    position: relative; /* let them flow below the text */
    margin-top: 40px; /* add desired spacing */
  }

  .mobile-button-holder {
    height: auto; /* prevent giant empty space */
  }
}
</style>
