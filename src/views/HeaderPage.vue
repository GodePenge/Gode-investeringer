<template>
  <div id="ex-header-page" class="container-fluid m-0 p-0 hp-container">
    <div class="hp-wrapper">
      <div class="hp-text-container">
        <p ref="headline" class="hp-headline">
          Investeringer skal gøre
          <span class="hp-dynamic-wrapper">
            <transition name="fade" mode="out-in">
              <span class="hp-dynamic-word" :key="currentWord">{{
                currentWord
              }}</span>
            </transition>
          </span>
        </p>

        <p class="hp-normal-text">
          I dag skaber investeringer ulighed, kriser og klimaskader. Men det
          behøver ikke være sådan.
        </p>
        <p class="hp-normal-text">
          Projektet Gode Investeringer sætter spørgsmåltegn ved vores
          investeringer - opdag en vej, hvor investeringer spirer med værdi.
        </p>
        <div class="hp-button-holder">
          <button class="hp-purple-button">Dyk ned i investeringer</button>
          <button class="hp-purple-button" @click="showPopup = true">
            Læs mere om projektet
          </button>
        </div>
        <Popup
          v-if="showPopup"
          :title="popupTitle"
          :content="popupContent"
          backgroundColor="var(--color-light-purple)"
          @close="showPopup = false"
        />
      </div>
      <div class="image-holder">
        <img
          src="Images/skyscraper-purple-square.png"
          alt="skyscrape"
          class="hp-skyscrape"
        />
        <img src="Images/forest-blob.png" alt="forest" class="hp-forest" />
        <img
          src="Images/windmill-red-semi.png"
          alt="windmill"
          class="hp-windmill"
        />
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onBeforeUnmount } from 'vue'
import Popup from './Popup.vue'

const showPopup = ref(false)

const popupTitle = 'Projektbeskrivelse'
const popupContent = `Gode Investeringer projektet er udviklet af den almennyttige forening Gode Penge og viser, hvordan investeringer bliver til værktøjer for positiv forandring, når de styres af etik, fælles værdier og social ansvarlighed. Vi skaber viden, engagement og pres for politiske løsninger, der understøtter en bæredygtig fremtid.
`

const words = [
  'fællesskabet stærkere.',
  'godt',
  'værdier til virkelighed.',
  'en forskel.',
  'fremtiden bedre.'
]

const currentWord = ref(words[0])
let index = 0
let intervalId

onMounted(() => {
  intervalId = setInterval(() => {
    index = (index + 1) % words.length
    currentWord.value = words[index]
  }, 4000)
})

onBeforeUnmount(() => {
  clearInterval(intervalId)
})
</script>

<style>
.hp-container {
  width: 100%;
  background-color: var(--color-white);
  display: flex;
  justify-content: center;
  align-items: center;
}

.hp-wrapper {
  height: 40rem;
  max-width: 1200px;
  box-sizing: border-box;
  padding: 3rem 2rem;
  background-color: var(--color-white);
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: row;
  gap: 40px;
}

.hp-text-container {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  flex-wrap: wrap;
  max-width: 600px;
  gap: 1rem;
}

.hp-button-holder {
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: row;
  flex-wrap: wrap;
  white-space: nowrap;
  gap: 16px;
}

.hp-purple-button {
  background-color: var(--color-light-purple);
  color: var(--color-white);
  padding-right: 20px;
  padding-left: 20px;
  padding-top: 8px;
  padding-bottom: 8px;
  font-weight: 500;
  border-width: 4px;
  border-color: rgb(255, 255, 255, 0);
  flex: 1 1 0;
  transition: background-color, color 0.6s;
}

.hp-purple-button:hover {
  background-color: var(--color-white);
  color: var(--color-light-purple);
  border-width: 4px;
  border-color: var(--color-light-purple);
}

.hp-headline {
  color: var(--color-dark-green);
  font-size: clamp(2rem, 6vw, 3.7rem);
  font-family: 'Karma', serif;
  font-weight: 700;
}

.hp-normal-text {
  flex-shrink: 1;
  color: black;
  font-family: Arial;
}

.image-holder {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  width: min(90vw, 500px);
  aspect-ratio: 1 / 1;
}

.image-holder img {
  position: absolute;
  object-fit: contain;
}

.hp-skyscrape {
  width: 70%;
  height: auto;
  left: -8%;
  top: 0%;
  z-index: 3;
}

.hp-forest {
  width: 65%;
  height: auto;
  left: 28%;
  top: 8%;
  z-index: 2;
}

.hp-windmill {
  width: 100%;
  height: auto;
  bottom: -10%;
  z-index: 1;
}

.hp-dynamic-wrapper {
  display: inline-block;
  min-width: 18ch;
  text-align: left;
  position: relative;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

@media (min-width: 992px) and (max-width: 1100px) {
  .hp-headline {
    font-size: clamp(2rem, 8vw, 3rem);
  }
  .hp-purple-button {
    width: 24vw;
  }
}

@media (min-width: 768px) and (max-width: 992px) {
  .hp-wrapper {
    width: 800px;
    padding: 2rem 1rem;
    gap: 0px;
  }

  .hp-headline {
    font-size: 4vw;
  }

  .hp-diamond {
    width: min(90vw, 350px); /* scales with viewport, max 400px */
  }
}

@media (max-width: 768px) {
  .hp-wrapper {
    flex-direction: column-reverse;
    height: auto;
    padding: 2rem 1rem;
    gap: 0px;
  }

  .hp-diamond {
    width: 350px;
  }

  .hp-headline {
    font-size: 7.5vw;
  }

  .hp-text-container {
    padding: 0 1rem;
  }

  .hp-purple-button {
    width: 80vw;
  }

  .hp-skyscrape {
    width: 50%;
    left: -2%;
    top: 22%;
  }

  .hp-forest {
    width: 70%;
    left: 34%;
    top: 20%;
  }

  .hp-windmill {
    width: 100%;
  }
}

@media (max-width: 480px) {
  .hp-headline {
    font-size: 8vw;
  }
}
</style>
