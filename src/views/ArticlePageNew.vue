<template>
  <div class="container-fluid m-0 p-0 ap-intro-section">
    <div class="ap-wrapper">
      <div class="ap-carousel-wrapper">
        <div class="card-holder">
          <Transition name="slide" mode="out-in">
            <ArticleCardNew
              v-bind="cards[currentIndex]"
              :index="currentIndex"
              :cards="cards"
              :key="currentIndex"
            />
          </Transition>
        </div>

        <div class="ap-carousel-arrows">
          <span class="ap-arrow-button" @click="prevCard">‹</span>
          <span class="ap-arrow-button" @click="nextCard">›</span>
        </div>
      </div>

      <div class="ap-intro-text-holder">
        <h2 class="ap-headline">En kritisk introduktion til investeringer</h2>
        <p class="hp-normal-text">
          Når man hører ordet investering, tænker mange måske på aktier,
          ejendomme eller pension. Men egentlig handler investering
          grundlæggende om, at bruge sine penge på udvikling, der skaber
          forandring over tid.
        </p>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import cardsData from '@/assets/Data/cards.json'
import ArticleCardNew from './ArticleCardNew.vue'

const cards = cardsData

const currentIndex = ref(0)

function nextCard() {
  currentIndex.value = (currentIndex.value + 1) % cards.length
}

function prevCard() {
  currentIndex.value = (currentIndex.value - 1 + cards.length) % cards.length
}
</script>

<style scoped>
.ap-intro-section {
  width: 100%;
  background-color: var(--color-white);
  display: flex;
  justify-content: center;
  align-items: center;
}

.ap-wrapper {
  min-height: 40rem;
  max-width: 1200px;
  box-sizing: border-box;
  padding: 3rem 2rem;
  background-color: var(--color-white);
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: row;
  gap: 80px;
}

.ap-carousel-wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

.card-holder {
  display: flex;
  flex-direction: column-reverse;
  align-items: center;
  justify-content: flex-start;
  min-height: 560px; /* Adjust this based on expected max height */
  position: relative;
  width: 100%;
}

.ap-carousel-arrows {
  display: flex;
  justify-content: center;
  gap: 2rem;
  position: relative;
  top: -40px;
}

.ap-arrow-button {
  color: var(--color-light-purple);
  cursor: pointer;
  font-size: 6rem;
  transition: color 0.3s;
}

.ap-arrow-button:hover {
  color: var(--color-dark-purple);
}

.ap-intro-text-holder {
  max-width: 600px;
}

.ap-headline {
  color: var(--color-dark-green);
  font-size: 3.7rem;
  font-family: 'Karma', serif;
  font-weight: 700;
  margin-bottom: 1rem;
}

.slide-enter-active,
.slide-leave-active {
  transition: all 0.4s ease;
  position: relative;
}

.slide-enter-from {
  transform: translateX(100%);
  opacity: 0;
}
.slide-enter-to {
  transform: translateX(0%);
  opacity: 1;
}

.slide-leave-from {
  transform: translateX(0%);
  opacity: 1;
}
.slide-leave-to {
  transform: translateX(-100%);
  opacity: 0;
}

@media (max-width: 768px) {
  .ap-wrapper {
    padding-top: 8rem;
    flex-direction: column-reverse;
    gap: 40px;
  }

  .ap-intro-text-holder {
    max-width: 600px;
  }

  .ap-headline {
    font-size: 7.5vw;
  }

  .card-holder {
    min-height: 500px;
  }
}

@media (max-width: 480px) {
  .ap-headline {
    font-size: 12vw;
  }
}
</style>
