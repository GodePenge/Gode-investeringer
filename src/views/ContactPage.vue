<template>
  <div id="ex-contact-page" class="background-contact">
    <!-- Section 1: Contact -->
    <div class="flex-column contact-section">
      <strong class="mb-2 headline">Kontakt os</strong>
      <p class="normal-text">
        Sebastian Solander-Bruus <br />
        <a class="link-text" href="mailto:sebastian@godepenge.dk">
          sebastian@godepenge.dk
        </a>
      </p>
      <p class="normal-text">
        Jonas Jensen <br />
        <a class="link-text" href="mailto:jonas@godepenge.dk">
          jonas@godepenge.dk
        </a>
      </p>
    </div>

    <!-- Section 2: About -->
    <div class="flex-column about-section">
      <strong class="mb-2 headline">Om projektet</strong>
      <p class="link-text">
        <a class="link-text" @click="showPopup = true">Projektbeskrivelse</a
        ><br />
        <a href="Documents/Tak-til.pdf" download>Tak til.pdf</a><br />
        <a href="Documents/Disclaimer.pdf" download>Disclaimer.pdf</a><br />
        <a href="Documents/Billedkreditering.pdf" download>
          Licens og billedkreditering.pdf
        </a>
      </p>
      <p class="link-text">
        <a href="https://www.godepenge.dk/" target="_blank"
          >Gode Penge hjemmeside</a
        >
      </p>
    </div>

    <!-- Section 3: Support -->
    <div class="flex-column support-section">
      <strong class="mb-2 headline">Støtte</strong>
      <div class="cp-image-holder">
        <img src="FS-Fond-logo.png" id="logo-img" class="img-fluid" />
        <img src="tuborgfondet-logo.png" id="logo-img" class="img-fluid" />
        <img src="KR-Foundation_Logo.png" id="logo-img" class="img-fluid" />
      </div>
    </div>

    <!-- Popup -->
    <Popup
      v-if="showPopup"
      :title="popupTitle"
      :content="popupContent"
      backgroundColor="var(--color-red)"
      @close="showPopup = false"
    />
  </div>
</template>

<script setup>
import { ref } from 'vue'
import Popup from './Popup.vue'

const showPopup = ref(false)

const popupTitle = 'Projektbeskrivelse'
const popupContent = `Gode Investeringer projektet er udviklet af den almennyttige forening Gode Penge og viser, hvordan investeringer bliver til værktøjer for positiv forandring, når de styres af etik, fælles værdier og social ansvarlighed. Vi skaber viden, engagement og pres for politiske løsninger, der understøtter en bæredygtig fremtid.
`
</script>

<style>
.background-contact {
  display: flex;
  justify-content: center;
  align-items: flex-start;
  gap: 60px;
  background-color: var(--color-red);
  padding: 48px 60px;
  flex-wrap: wrap;
  text-align: left;
}

.flex-column {
  display: flex;
  flex-direction: column;
  max-width: 300px;
}

.headline {
  display: block;
  color: var(--color-white);
  font-size: 1.2rem;
  padding-bottom: 18px;
}

.normal-text {
  color: var(--color-white);
  font-family: Arial;
}

.link-text {
  color: var(--color-white);
  cursor: pointer;
}

.link-text a {
  all: unset;
  color: inherit;
  text-decoration: underline;
}

.link-text a:hover {
  text-decoration: none;
}

.cp-image-holder {
  display: flex;
  flex-direction: column;
  gap: 20px;
  align-items: center;
  min-width: 232px;
}

#logo-img {
  height: 50px;
  width: auto;
  display: block;
}

@media (max-width: 768px) {
  .background-contact {
    flex-direction: column;
    align-items: center;
    text-align: center;
    padding: 32px 20px;
  }

  .flex-column {
    align-items: center;
    text-align: center;
  }
}
</style>
