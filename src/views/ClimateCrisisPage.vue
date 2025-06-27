<template>
  <div id="ex-climateCrisisPage" class="ccp-container">
    <div class="ccp-wrapper">
      <div class="ccp-text-holder">
        <h1 class="headline-a ccp-headline">
          Klimakrisen og vores investeringerne
        </h1>
        <p class="text-a ccp-text">
          Klimakrisen rammer ikke kun naturen – den rammer også vores
          investeringer. <br />
          <br />
          Når økonomisk vækst driver udledninger, og forsikringsselskaber
          advarer om uoverskuelige risici, står vi over for en ny virkelighed.
          Måden vi investerer på, må gentænkes. <br />
          <br />
          Her kan du dykke ned i, hvordan klimakrisen udfordrer vores nuværende
          system – og hvorfor det haster med at handle anderledes.
        </p>
      </div>
      <div class="ccp-left-holder">
        <div class="cpp-square"></div>
        <img src="Images/stonks-image.png" alt="stonk" class="ccp-stonk" />
        <button class="button-a ccp-button" @click="goToArticle">
          Læs mere
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'
import investInfo from '@/assets/Data/ClimateCrisisInfo.json'

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
.ccp-container {
  width: 100%;
  background-color: var(--color-red);
  display: flex;
  justify-content: center;
  align-items: center;
}

.ccp-wrapper {
  height: 40rem;
  max-width: 1200px;
  box-sizing: border-box;
  padding: 3rem 2rem;
  background-color: var(--color-red);
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: row;
  gap: 80px;
}

.ccp-text-holder {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  flex-wrap: wrap;
  gap: 1rem;
}

.ccp-headline {
  color: var(--color-white);
  font-size: 3.7rem;
}

.ccp-text {
  flex-shrink: 1;
  color: var(--color-white);
}

.ccp-left-holder {
  width: 100%;
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  flex-wrap: wrap;
  gap: 6rem;
}

.cpp-square {
  position: relative;
  width: 200px;
  height: 200px;
  background-color: var(--color-dark-green);
  transform: rotate(45deg);
}

.ccp-stonk {
  position: absolute;
  width: 320px;
  bottom: 0px;
  height: auto;
  z-index: 1;
}

.ccp-button {
  position: relative;
  background-color: var(--color-dark-green);
  border-color: var(--color-dark-green);
  color: var(--color-white);
  padding-right: 20px;
  padding-left: 20px;
  padding-top: 8px;
  padding-bottom: 8px;
  font-weight: 500;
  border-width: 4px;
  flex: 1 1 0;
  z-index: 2;
}

.ccp-button:hover {
  background-color: var(--color-white);
  color: var(--color-dark-green);
  border-color: var(--color-dark-green);
}

@media (max-width: 768px) {
  .ccp-wrapper {
    height: auto;
    flex-direction: column;
    gap: 40px;
  }

  .ccp-headline {
    font-size: 3rem;
  }

  .ccp-text {
    font-size: 0.92rem;
  }

  .ccp-left-holder {
    flex-direction: column-reverse;
  }

  .ccp-stonk {
    top: 20px;
  }
}
</style>
