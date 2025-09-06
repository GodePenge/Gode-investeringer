<template>
  <div class="pip-container">
    <div class="pip-wrapper">
      <div class="pip-text-wrapper">
        <h1 class="pip-headline headline-a">
          7 principper for bæredygtige investeringer
        </h1>
        <p class="pip-text text-a">
          Vil du vurdere, om en investering er god for både dig og verden? Vi
          har udviklet 7 principper, som kan guide dig til bæredygtige
          investeringer med ansvarlig samfundsværdi. <br /><br />
          Brug dem som et kompas til at navigere i en ny investeringskultur,
          hvor værdier og etik følges ad.
        </p>
      </div>

      <div class="blob-container">
        <div
          v-for="(blob, index) in blobs"
          :key="index"
          class="blob"
          @click="handleClick(blob.text)"
        >
          <img :src="blob.img" alt="blob" />
          <span>{{ blob.text }}</span>
        </div>
      </div>
    </div>
    <Popup
      v-if="showPopup"
      :title="popupTitle"
      :content="popupContent"
      backgroundColor="var(--color-light-green)"
      @close="showPopup = false"
    />
  </div>
</template>

<script setup>
import { ref } from 'vue'
import Popup from './Popup.vue'
import invesetData from '@/assets/Data/PrinciplesInvest.json'

const blobs = [
  { text: 'Fælles ejerskab', img: '/Images/Modul 12 - figur 2.png' },
  { text: 'Bæredygtighed', img: '/Images/Modul 12 - figur 3.png' },
  { text: 'Generationshensyn', img: '/Images/Modul 12 - figur 5.png' },
  { text: 'Lokal værdi først', img: '/Images/Modul 12 - figur 1.png' },
  { text: 'Stop gældsspiralen', img: '/Images/Modul 12 - figur 4.png' },
  { text: 'Direkte handling', img: '/Images/Modul 12 - figur 6.png' },
  { text: 'Naturrespekt', img: '/Images/Modul 12 - figur 7.png' }
]

const showPopup = ref(false)

var popupTitle = 'Error'
var popupContent = 'Error'

function handleClick(blobTitle) {
  showPopup.value = true

  const found = invesetData.find(item => item.title === blobTitle)
  if (found) {
    popupTitle = found.title
    popupContent = found.text
  } else {
    popupTitle = 'Error could not find'
    popupContent = ''
  }
}
</script>

<style>
.pip-container {
  width: 100%;
  background-color: var(--color-white);
  display: flex;
  justify-content: center;
  align-items: center;
}

.pip-wrapper {
  height: 48rem;
  max-width: 1200px;
  width: 100%;
  box-sizing: border-box;
  padding: 3rem 2rem;
  padding-top: 5rem;
  background-color: var(--color-white);
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  flex-direction: column;
  gap: 0px;
}

.pip-text-wrapper {
  width: 80%;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: left;
  flex-direction: column;
}

.pip-headline {
  font-size: 3.7rem;
  color: var(--color-dark-green);
  text-align: left;
  align-self: flex-start;
  margin-bottom: 0;
}

.pip-text {
  text-align: left;
  font-size: 1rem;
  color: var(--color-dark-green) !important;
}

.blob-container {
  display: grid;
  grid-template-columns: repeat(4, 1.4fr);
  gap: 0rem 6rem;
  justify-items: center;
  padding: 0rem;
}

.blob {
  position: relative;
  cursor: pointer;
  text-align: center;
  z-index: 0;
}

.blob img {
  width: 100%;
  max-width: 200px;
  height: auto;
  transition: transform 0.4s ease;
}

.blob img:hover {
  transform: scale(1.05);
}

.blob span {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-20%, -50%);
  font-weight: bold;
  font-size: 0.85rem;
  color: var(--color-dark-green);
  text-align: center;
  width: 80%;
  z-index: 10;
  pointer-events: none; /* optional: allow clicks to pass through */
}

/* Top row */
.blob:nth-child(1),
.blob:nth-child(2),
.blob:nth-child(3) {
  grid-row: 1;
}
.blob:nth-child(1) {
  grid-column: 1;
  transform: translateX(40%);
}
.blob:nth-child(2) {
  grid-column: 2;
  transform: translateX(40%);
}
.blob:nth-child(3) {
  grid-column: 3;
  transform: translateX(40%);
}

/* Bottom row (4 blobs naturally fill 4 cols) */
.blob:nth-child(4),
.blob:nth-child(5),
.blob:nth-child(6),
.blob:nth-child(7) {
  grid-row: 2;
}

/* --- Mobile: stack into one column --- */
@media (max-width: 768px) {
  .pip-text-wrapper {
    width: 100%;
  }

  .pip-wrapper {
    height: 60rem;
  }
  .blob-container {
    grid-template-columns: repeat(
      3,
      minmax(120px, 0.5fr)
    ); /* tighter columns */
    justify-items: center;
    overflow: visible;
  }

  .blob img {
    width: 100%;
    max-width: 180px;
    height: auto;
  }

  .blob span {
    transform: translate(-35%, -50%);
  }

  /* reset transforms/rows so layout flows naturally in two columns */
  .blob {
    grid-column: auto !important;
    grid-row: auto !important;
  }

  .blob:nth-child(1),
  .blob:nth-child(2),
  .blob:nth-child(3) {
    transform: translateX(0%);
  }

  .blob:nth-child(2),
  .blob:nth-child(5) {
    transform: translateX(-40%);
  }

  .blob:nth-child(3),
  .blob:nth-child(6) {
    transform: translateX(-60%);
  }

  .blob:nth-child(5),
  .blob:nth-child(6) {
    transform: translateY(-10%);
  }

  .blob:nth-child(7) {
    transform: translateX(60%) translateY(-20%);
  }

  .blob:nth-child(6) {
    transform: translateY(80%) translateX(-70%);
  }
}

@media (max-width: 620px) {
  .pip-wrapper {
    height: 70rem;
  }

  .blob-container {
    grid-template-columns: repeat(
      2,
      minmax(140px, 0.6fr)
    ); /* tighter columns */
    justify-items: center;
    overflow: visible;
    gap: 20px;
  }

  .blob {
    grid-column: auto !important;
    grid-row: auto !important;
  }

  .blob span {
    transform: translate(-20%, -50%);
    font-size: 0.9rem;
  }

  .blob:nth-child(2),
  .blob:nth-child(3),
  .blob:nth-child(5),
  .blob:nth-child(6) {
    transform: translateY(0%) translateX(0%);
  }
}

@media (max-width: 400px) {
  .pip-wrapper {
    height: 80rem;
  }

  .pip-headline {
    font-size: 2.7rem;
  }

  .blob-container {
    grid-template-columns: repeat(1, minmax(100px, 0.6fr));
    justify-items: center;
    overflow: visible;
    gap: 10px, 0px;
  }
}
</style>
