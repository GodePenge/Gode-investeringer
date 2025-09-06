<template>
  <div class="container-oip">
    <div class="wrapper-oip">
      <h1 class="headline-a headline-oip">Danskernes investeringer i tal</h1>

      <div class="row-container">
        <div class="image-container" @click="onClick(0)">
          <div class="semi-circle"></div>

          <span class="text-a overlay-text">{{
            ourInvestmentsData[0].title
          }}</span>
        </div>
        <div class="image-container" @click="onClick(1)">
          <div class="semi-circle"></div>

          <span class="text-a overlay-text">{{
            ourInvestmentsData[1].title
          }}</span>
        </div>
      </div>
      <div class="row-container" @click="onClick(2)">
        <div class="image-container">
          <div class="semi-circle"></div>

          <span class="text-a overlay-text">{{
            ourInvestmentsData[2].title
          }}</span>
        </div>
        <div class="image-container" @click="onClick(3)">
          <div class="semi-circle"></div>

          <span class="text-a overlay-text">{{
            ourInvestmentsData[3].title
          }}</span>
        </div>
      </div>
      <Popup
        v-if="showPopup"
        :title="popupTitle"
        :content="popupContent"
        backgroundColor="var(--color-red)"
        @close="showPopup = false"
      />
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import Popup from './Popup.vue'
import ourInvestmentsData from '@/assets/Data/OurInvestments.json'

const showPopup = ref(false)

var popupTitle = 'Error'
var popupContent = 'Error'

function onClick(id) {
  showPopup.value = true

  const found = ourInvestmentsData.find(item => item.key === id)
  if (found) {
    popupTitle = found.title
    popupContent = found.text

    console.log(found.images)
  } else {
    popupTitle = 'Error could not find'
    popupContent = ''
  }
}
</script>

<style scoped>
.container-oip {
  width: 100%;
  background-color: var(--color-white);
  display: flex;
  justify-content: center;
  align-items: center;
}

.wrapper-oip {
  height: 42rem;
  max-width: 1200px;
  width: 100%;
  box-sizing: border-box;
  padding: 2rem;
  background-color: var(--color-white);
  display: flex;
  justify-content: center;
  align-items: left;
  text-align: left;
  flex-direction: column;
  gap: 40px;
}

.headline-oip {
  padding-left: 36px;
  color: var(--color-dark-green);
  font-size: 3.2rem;
  padding-bottom: 0;
  margin-bottom: 0;
}

.row-container {
  padding: 0;
  background-color: var(--color-white);
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  flex-direction: row;
  gap: 120px;
}

.semi-circle {
  width: 400px;
  height: 200px;
  background: var(--color-red);
  border-top-left-radius: 200px;
  border-top-right-radius: 200px;
  cursor: pointer;
  transition: transform 0.4s ease;
}

.image-container {
  position: relative;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.semi-circle:hover {
  transform: scale(1.03);
}

.image-oip {
  width: 400px;
  height: auto;
  display: block;
  transition: opacity 0.3s ease;
}

.image-container:hover .image-oip {
  opacity: 0.9;
}

.overlay-text {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: var(--color-white);
  font-size: 18px;
  text-align: center;
  z-index: 2;
  cursor: pointer;
}

@media (max-width: 1100px) {
  .row-container {
    gap: 20px;
  }
}

@media (max-width: 768px) {
  .semi-circle {
    width: 300px;
    height: 150px;
    border-top-left-radius: 150px;
    border-top-right-radius: 150px;
  }

  .overlay-text {
    width: 60%;
  }

  .headline-oip {
    padding-left: 0;
  }

  .wrapper-oip {
    height: 1000px !important;
    padding-top: 0;
    padding-bottom: 0;
    height: 74rem;
  }

  .row-container {
    flex-direction: column;
    gap: 40px;
  }
}

@media (max-width: 400px) {
  .headline-oip {
    font-size: 2.4rem;
  }

  .semi-circle {
    width: 280px;
    height: 150px;
    border-top-left-radius: 150px;
    border-top-right-radius: 150px;
  }
}
</style>
