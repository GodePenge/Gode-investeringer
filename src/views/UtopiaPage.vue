<template>
  <div id="ex-climateCrisisPage" class="up-container">
    <div class="up-wrapper">
      <div class="up-left-holder">
        <img
          src="Images/landscape-blob.png"
          alt="landscape"
          class="up-landscape"
        />
        <button class="up-button" @click="goToArticle">Læs mere</button>
      </div>
      <div class="up-text-holder">
        <h1 class="up-headline">Investér i den verden du ønsker at leve i</h1>
        <p class="up-text">
          Når vi investerer, former vi fremtiden. <br />
          <br />
          Vi kan vælge at understøtte virksomheder, der bygger fællesskaber,
          beskytter naturen og skaber reel værdi for mennesker. <br />
          <br />
          En bæredygtig økonomi kræver en ny tilgang – hvor afkastet ikke kun
          måles i penge, men i goder for samfundet.
        </p>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'
import investInfo from '@/assets/Data/UtopiaInfo.json'

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
.up-container {
  width: 100%;
  background-color: var(--color-light-green);
  display: flex;
  justify-content: center;
  align-items: center;
}

.up-wrapper {
  height: 40rem;
  max-width: 1200px;
  box-sizing: border-box;
  padding: 3rem 2rem;
  background-color: var(--color-light-green);
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: row;
  gap: 20px;
}

.up-text-holder {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  flex-wrap: wrap;
  gap: 1rem;
}

.up-headline {
  color: var(--color-white);
  font-size: 3.7rem;
  font-family: 'Karma', serif;
  font-weight: 700;
}

.up-text {
  flex-shrink: 1;
  color: var(--color-white);
  font-family: Arial;
}

.up-left-holder {
  width: 100%;
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  flex-wrap: wrap;
  gap: 6rem;
}

.up-landscape {
  position: absolute;
  left: 40px;
  width: 340px;
  height: auto;
  z-index: 1;
}

.up-button {
  position: relative;
  background-color: var(--color-light-purple);
  color: var(--color-white);
  padding-right: 60px;
  padding-left: 60px;
  padding-top: 8px;
  padding-bottom: 8px;
  font-weight: 500;
  border-width: 4px;
  border-color: rgb(255, 255, 255, 0);
  flex: 1 1 0;
  z-index: 2;
  left: 100px;
  transition: background-color, color 0.6s;
}

.up-button:hover {
  background-color: var(--color-white);
  color: var(--color-light-purple);
  border-width: 4px;
  border-color: var(--color-light-purple);
}

@media (max-width: 992px) {
  .up-landscape {
    position: relative;
    width: 200px;
    left: 0;
  }

  .up-left-holder {
    flex-direction: column-reverse;
    gap: 20px;
  }

  .up-button {
    left: 0;
  }
}

@media (max-width: 768px) {
  .up-wrapper {
    height: auto;
    flex-direction: column-reverse;
    gap: 40px;
  }

  .up-landscape {
    width: 300px;
  }

  .up-headline {
    font-size: 3rem;
  }

  .up-text {
    font-size: 0.92rem;
  }

  .up-left-holder {
    flex-direction: column-reverse;
  }
}
</style>
