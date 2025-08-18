<template>
  <div class="pip-container">
    <div class="pip-wrapper">
      <div class="pip-text-wrapper">
        <h1 class="pip-headline headline-a">
          Principper for Gode Investeringer
        </h1>
        <p class="pip-text text-a">
          Hvis investeringer skal gøre verden bedre, har vi brug for værktøjer
          til at vurdere dem. <br /><br />
          Derfor har vi formuleret 7 principper, som kan hjælpe dig med at se,
          om en investering ikke kun er god for dig, men også for samfundet,
          naturen og kommende generationer. <br /><br />
          Brug dem som kompas til at navigere i en ny investerings kultur, hvor
          værdier og etik følges ad.
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
  padding-bottom: 0;
  background-color: var(--color-white);
  display: flex;
  justify-content: center;
  align-items: left;
  text-align: left;
  flex-direction: column;
  gap: 0px;
}

.pip-text-wrapper {
  width: 85%;
  display: flex;
  justify-content: center;
  align-items: left;
  text-align: left;
  flex-direction: column;
}

.pip-headline {
  font-size: 3.7rem;
  color: var(--color-dark-green);
  margin-bottom: 0;
}

.pip-text {
  font-size: 1rem;
  color: var(--color-dark-green) !important;
}

.blob-container {
  display: grid;
  grid-template-columns: repeat(4, 0.8fr);
  gap: 0rem;
  justify-items: center;
  max-width: 1000px;
  padding: 0rem;
}

/* Each blob styling */
.blob {
  position: relative;
  cursor: pointer;
  text-align: center;
}

.blob img {
  width: 100%;
  max-width: 200px;
  height: auto;
}

.blob span {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-weight: bold;
  font-size: 0.85rem;
  color: #003300;
  text-align: center;
  width: 80%;
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
    height: 68rem;
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
  .blob-container {
    grid-template-columns: repeat(
      2,
      minmax(120px, 0.5fr)
    ); /* tighter columns */
    justify-items: center;
    overflow: visible;
  }

  .blob {
    grid-column: auto !important;
    grid-row: auto !important;
  }

  .blob:nth-child(2),
  .blob:nth-child(3),
  .blob:nth-child(5),
  .blob:nth-child(6) {
    transform: translateY(0%) translateX(0%);
  }
}
</style>
