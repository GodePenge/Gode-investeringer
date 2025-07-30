<template>
  <div class="card-wrapper">
    <div
      class="card-image"
      :style="{ backgroundImage: 'url(' + image + ')' }"
    ></div>
    <div class="card-content">
      <h3 class="headline-a card-title">{{ title }}</h3>
      <p class="card-text">{{ text }}</p>
    </div>
    <button class="button-a card-button" @click="goToArticle">Læs mere</button>
  </div>
</template>

<script setup>
import { defineProps } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()

const props = defineProps({
  title: String,
  text: String,
  image: String,
  index: Number,
  cards: Array
})

function goToArticle() {
  router
    .push({
      name: 'ArticlePage',
      params: { index: props.index },
      state: { cards: props.cards }
    })
    .then(() => {
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      })
    })
}
</script>

<style scoped>
.card-wrapper {
  width: 30vw;
  background-color: var(--color-white);
  border-radius: 0 0 8px 8px;
  overflow: hidden;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

.card-image {
  position: relative;
  width: 106.4%;
  height: 18vw;
  background-size: cover;
  background-position: center;
  top: 2vw;
  z-index: 0;
}

.card-content h3,
.card-content p {
  margin: 0;
}

.card-content {
  background-color: var(--color-red);
  color: var(--color-white);
  padding: 1rem;
  text-align: center;
  z-index: 10;
  padding-bottom: 60px;
}

.card-title {
  color: var(--color-white);
  margin-bottom: 16px !important;
}

.card-text {
  color: var(--color-white);
}

.card-button {
  background-color: var(--color-light-purple);
  border-color: var(--color-light-purple);
  color: var(--color-white);
  font-weight: 1000;
  cursor: pointer;
  position: relative;
  top: -24px;
  z-index: 20;
}

.card-button:hover {
  background-color: var(--color-white);
  color: var(--color-light-purple);
  border-color: var(--color-light-purple);
}

@media (max-width: 768px) {
  .card-wrapper {
    width: 54vw;
  }

  .card-image {
    top: 2.8vw;
    height: 30vw;
  }
}

@media (max-width: 480px) {
  .card-content {
    min-height: 290px;
  }

  .card-wrapper {
    width: 80vw;
  }

  .card-image {
    top: 2.8vw;
    height: 43vw;
  }
}
</style>
