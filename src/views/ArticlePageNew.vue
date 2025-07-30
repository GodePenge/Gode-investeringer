<template>
  <div id="ex-articlePage" class="container-fluid m-0 p-0 ap-intro-section">
    <div class="ap-wrapper">
      <div class="ap-carousel-wrapper">
        <div
          class="card-holder"
          @touchstart="onTouchStart"
          @touchend="onTouchEnd"
        >
          <Transition :name="transitionName" mode="out-in">
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
        <h2 class="ap-headline headline-a">
          En kritisk introduktion til investeringer
        </h2>
        <p class="text-a">
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
import { ref, onBeforeUnmount } from 'vue'
import cardsData from '@/assets/Data/cards.json'
import ArticleCardNew from './ArticleCardNew.vue'
import { computed } from 'vue'

const cards = cardsData
const currentIndex = ref(0)
const intervalId = ref(null)

const direction = ref('next') // 'next' or 'prev'

function nextCard() {
  direction.value = 'next'
  currentIndex.value = (currentIndex.value + 1) % cards.length
}

function prevCard() {
  direction.value = 'prev'
  currentIndex.value = (currentIndex.value - 1 + cards.length) % cards.length
}

const transitionName = computed(() => {
  return direction.value === 'next' ? 'slide-next' : 'slide-prev'
})

const touchStartX = ref(0)

function onTouchStart(e) {
  touchStartX.value = e.changedTouches[0].screenX
}

function onTouchEnd(e) {
  const touchEndX = e.changedTouches[0].screenX
  const deltaX = touchEndX - touchStartX.value

  if (Math.abs(deltaX) > 50) {
    if (deltaX < 0) {
      nextCard() // Swiped left
    } else {
      prevCard() // Swiped right
    }
  }
}

function startAutoSlide() {
  // Start sliding every 5 seconds (customize as needed)
  if (!intervalId.value) {
    intervalId.value = setInterval(prevCard, 5000)
  }
}

function stopAutoSlide() {
  if (intervalId.value) {
    clearInterval(intervalId.value)
    intervalId.value = null
  }
}

const mql = window.matchMedia('(max-width: 768px)')

const checkAndToggleAutoSlide = e => {
  if (e.matches) {
    startAutoSlide()
  } else {
    stopAutoSlide()
  }
}

// Initial check
checkAndToggleAutoSlide(mql)

// Add listener
mql.addEventListener('change', checkAndToggleAutoSlide)

// Cleanup
onBeforeUnmount(() => {
  mql.removeEventListener('change', checkAndToggleAutoSlide)
  stopAutoSlide()
})
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
  margin-bottom: 200px;
}

.ap-headline {
  color: var(--color-dark-green);
  font-size: 3.6rem;
  margin-bottom: 1rem;
}

.slide-next-enter-active,
.slide-prev-enter-active,
.slide-next-leave-active,
.slide-prev-leave-active {
  transition: all 0.4s ease;
  position: relative; /* Take out of normal flow */
}

.slide-next-enter-from {
  transform: translateX(100%);
  opacity: 0;
}
.slide-next-enter-to {
  transform: translateX(0%);
  opacity: 1;
}
.slide-next-leave-from {
  transform: translateX(0%);
  opacity: 1;
}
.slide-next-leave-to {
  transform: translateX(-100%);
  opacity: 0;
}

.slide-prev-enter-from {
  transform: translateX(-100%);
  opacity: 0;
}
.slide-prev-enter-to {
  transform: translateX(0%);
  opacity: 1;
}
.slide-prev-leave-from {
  transform: translateX(0%);
  opacity: 1;
}
.slide-prev-leave-to {
  transform: translateX(100%);
  opacity: 0;
}

@media (max-width: 768px) {
  .ap-carousel-arrows {
    display: none;
  }

  .ap-wrapper {
    padding-top: 8rem;
    flex-direction: column-reverse;
    gap: 40px;
  }

  .ap-intro-text-holder {
    max-width: 600px;
    margin-bottom: 0;
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
