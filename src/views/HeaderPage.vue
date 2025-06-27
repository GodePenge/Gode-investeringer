<template>
  <div id="ex-header-page" class="container-fluid m-0 p-0 hp-container">
    <div class="hp-wrapper">
      <div class="hp-text-container">
        <h1 class="hp-headline headline-a">
          Investeringer skal gøre
          <span class="hp-dynamic-wrapper">
            <transition name="fade" mode="out-in">
              <span class="hp-dynamic-word" :key="currentWord">{{
                currentWord
              }}</span>
            </transition>
          </span>
        </h1>

        <p class="text-a">
          I dag skaber investeringer ulighed, kriser og klimaskader. Men det
          behøver ikke være sådan. <br />
          <br />Projektet Gode Investeringer sætter spørgsmåltegn ved vores
          investeringer - opdag en vej, hvor investeringer spirer med værdi.
        </p>
        <div class="hp-button-holder">
          <button
            class="button-a hp-purple-button"
            @click.prevent="scrollToTarget('ex-articlePage')"
          >
            Dyk ned i investeringer
          </button>
          <button class="button-a hp-purple-button" @click="showPopup = true">
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
import { helperFunctions } from '@/utils/HelperFunctions'

const { scrollToTarget } = helperFunctions()

const showPopup = ref(false)

const popupTitle = 'Projektbeskrivelse'
const popupContent = `Gode Investeringer projektet er udviklet af den almennyttige forening Gode Penge og viser, hvordan investeringer bliver til værktøjer for positiv forandring, når de styres af etik, fælles værdier og social ansvarlighed. Vi skaber viden, engagement og pres for politiske løsninger, der understøtter en bæredygtig fremtid.
`

const words = [
  'fællesskabet stærkere',
  'godt',
  'værdier til virkelighed',
  'en forskel',
  'fremtiden bedre'
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
  height: 36rem;
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
  padding-left: 60px;
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
  border-color: var(--color-light-purple) !important;
  color: var(--color-white);
}

.hp-purple-button:hover {
  background-color: var(--color-white);
  color: var(--color-light-purple);
  border-color: var(--color-light-purple);
}

.hp-headline {
  font-size: 3.3rem;
  color: var(--color-dark-green);
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
  width: 80%;
  height: auto;
  left: -14%;
  top: 6%;
  z-index: 3;
}

.hp-forest {
  width: 70%;
  height: auto;
  left: 30%;
  top: 16%;
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
    font-size: 2.6rem;
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
    font-size: 7vw;
  }
}
</style>
