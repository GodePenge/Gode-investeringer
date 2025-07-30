<template>
  <div class="ic-container">
    <div class="ic-wrapper">
      <div class="ic-text-holder">
        <h1 class="headline-a ic-headline">
          Hvad skal dine investeringer skabe?
        </h1>
        <p class="text-a ic-text">
          Investering handler ikke kun om penge, det handler også om, hvilken
          verden vi er med til at forme i fremtiden. <br />
          <br />
          Hos Gode Penge opfordrer vi til at tænke over intentionen bag
          investeringer og vælge investeringsprodukter, der skaber samfundsværdi
          frem for blot økonomisk gevinst.
        </p>
        <button class="button-a ic-button">
          <span class="btn-text-large" @click="goToArticle"
            >Læs hvorfor vores investeringer skal gøre godt</span
          >
          <span class="btn-text-small" @click="goToArticle">Læs hvorfor</span>
        </button>
      </div>
      <div class="image-cropper">
        <img src="Images/hugging-red-square.png" class="ic-hug" />
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'
import investInfo from '@/assets/Data/investInfo.json'

const router = useRouter()

const cards = investInfo

function goToArticle() {
  router
    .push({
      name: 'ArticlePage',
      params: { index: 0 },
      state: { cards: cards }
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
.ic-container {
  width: 100%;
  background-color: var(--color-dark-green);
  display: flex;
  justify-content: center;
  align-items: center;
}

.ic-wrapper {
  max-width: 1200px;
  box-sizing: border-box;
  padding: 3rem 2rem;
  background-color: var(--color-dark-green);
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: visible;
  flex-direction: row;
  gap: 80px;
  overflow-x: hidden;
}

.ic-text-holder {
  display: flex;
  justify-content: center;
  align-items: flex-start;
  flex-direction: column;
  width: min(40vw, 600px);
  gap: 40px;
}

.ic-headline {
  text-align: left;
  position: relative;
  color: var(--color-white);
  white-space: nowrap;
  overflow: visible;
  width: 10px;
  font-size: 3.7rem;
  margin-bottom: 0;
  z-index: 10;
}

.ic-text {
  flex-shrink: 1;
  color: var(--color-white);
}

.ic-button {
  background-color: var(--color-light-green);
  border-color: var(--color-light-green);
  color: var(--color-white);
  padding: 0.5rem 1rem;
  font-weight: 1000;
}
.ic-button:hover {
  background-color: var(--color-white);
  color: var(--color-light-green);
  border-color: var(--color-light-green);
}

.btn-text-small {
  display: none;
}
.btn-text-large {
  display: inline;
}

.image-cropper {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-left: 40px;
  width: 450px;
  height: 410px;
  overflow: hidden;
  position: relative;
}

.ic-hug {
  width: 500px;
  height: auto;
  display: block;
}

@media (min-width: 992px) and (max-width: 1100px) {
  .ic-text-holder {
    gap: 20px;
  }

  .ic-headline {
    font-size: 3rem;
  }
  .ic-hug {
    width: 450px;
  }
}

@media (min-width: 768px) and (max-width: 992px) {
  .ic-text-holder {
    gap: 20px;
  }
  .ic-wrapper {
    gap: 60px;
  }

  .ic-headline {
    font-size: 2.6rem;
  }
  .ic-hug {
    width: 380px;
  }
  .ic-button {
    align-self: center;
  }
  .btn-text-small {
    display: inline;
  }
  .btn-text-large {
    display: none;
  }
}

@media (max-width: 768px) {
  .ic-container {
    overflow: hidden;
  }

  .ic-text-holder {
    position: relative;
    top: -200px;
    gap: 20px;
    width: 80vw;
    align-items: center;
  }
  .ic-wrapper {
    gap: 60px;
    flex-direction: column-reverse;
    padding-bottom: 0;
    margin-bottom: -80px;
  }

  .ic-headline {
    text-wrap: wrap;
    width: 100%;
    font-size: 3.7rem;
  }

  .image-cropper {
    margin-left: 0;
    width: 80vw;
    height: auto;
  }

  .ic-hug {
    width: 80vw;
  }
  .ic-button {
    align-self: center;
  }
  .btn-text-small {
    display: inline;
  }
  .btn-text-large {
    display: none;
  }
}

@media (max-width: 480px) {
  .ic-headline {
    font-size: 2.8rem;
  }
}
</style>
