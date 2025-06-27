<template>
  <div class="td-intro-section">
    <div class="td-wrapper">
      <h1 class="headline-a td-headline">{{ currentCard.fullTitle }}</h1>

      <div></div>

      <div>
        <p
          class="td-text"
          v-for="(paragraph, i) in currentCard.fullText"
          :key="i"
          v-html="paragraph"
        ></p>
      </div>

      <div class="td-button-holder" :style="{ marginTop: buttonOffset + 'px' }">
        <button class="button-a td-button" :disabled="!hasNext" @click="next">
          {{ 'Videre til ' + nextTitle }}
        </button>

        <button
          class="button-a td-button"
          :disabled="!hasPrevious"
          @click="previous"
        >
          {{ 'Tilbage til ' + previousTitle }}
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'CardViewer',
  props: {
    cards: {
      type: Array,
      required: true
    },
    selectedIndex: {
      type: Number,
      required: true
    }
  },
  data() {
    return {
      currentIndex: this.selectedIndex
    }
  },
  computed: {
    currentCard() {
      return this.cards[this.currentIndex]
    },
    hasNext() {
      return this.currentIndex < this.cards.length - 1
    },
    hasPrevious() {
      return this.currentIndex > 0
    },
    nextTitle() {
      if (this.currentIndex < this.cards.length - 1) {
        return this.cards[this.currentIndex + 1].title
      }
      return ''
    },

    previousTitle() {
      if (this.currentIndex > 0) {
        return this.cards[this.currentIndex - 1].title
      }
      return ''
    }
  },
  methods: {
    next() {
      if (this.hasNext) {
        this.currentIndex++
      }
    },
    previous() {
      if (this.hasPrevious) {
        this.currentIndex--
      }
    }
  }
}
</script>

<style scoped>
.td-intro-section {
  width: 100%;
  background-color: var(--color-white);
  display: flex;
  justify-content: center;
  align-items: center;
}

.td-wrapper {
  min-height: 40rem;
  max-width: 1200px;
  box-sizing: border-box;
  padding: 3rem 2rem;
  background-color: var(--color-white);
  display: grid;
  grid-template-rows: auto auto;
  grid-template-columns: 1fr auto;
  align-items: start;
  gap: 40px;
}

.td-headline {
  color: var(--color-dark-green);
  font-size: 3.2rem;
  margin-bottom: 0;
}

.td-text {
  flex-shrink: 1;
  color: black;
  font-family: Arial;
}

.td-button-holder {
  max-width: 220px;
  width: 220px;
  display: flex;
  justify-content: center;
  align-items: flex-start;
  flex-direction: column;
  flex-wrap: wrap;
  white-space: wrap;
  gap: 16px;
}

.td-button {
  width: 100%;
  background-color: var(--color-light-purple);
  border-color: var(--color-light-purple);
  color: var(--color-white);
  padding-right: 20px;
  padding-left: 20px;
  padding-top: 8px;
  padding-bottom: 8px;
  font-weight: 500;
  border-width: 4px;
  flex: 1 1 0;
}

.td-button:hover:not(:disabled) {
  background-color: var(--color-white);
  color: var(--color-light-purple);
  border-color: var(--color-light-purple);
}

button:disabled {
  border-color: var(--color-light-purple) !important;
  border: 4px solid;
  opacity: 0.5;
  cursor: not-allowed;
}

@media (max-width: 768px) {
  .td-button-holder {
    max-width: 100%;
    width: 100%;
  }
  .td-wrapper {
    display: flex;
    align-items: start;
    justify-content: center;
    align-items: flex-start;
    flex-direction: column;
    gap: 20px;
  }

  .td-headline {
    font-size: 2.8rem;
  }
}
</style>
