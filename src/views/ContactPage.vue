<template>
  <div id="ex-contact-page" class="container-fluid background-contact">
    <div class="col-md-3">
      <strong class="mb-2 headline">Kontakt os</strong>
      <p></p>
      <p class="normal-text">
        Sebastian Solander-Bruus <br />
        <a class="link-text" href="mailto:sebastian@godepenge.dk"
          >sebastian@godepenge.dk</a
        >
      </p>
      <p class="normal-text">
        Jonas Jensen <br />
        <a class="link-text" href="mailto:jonas@godepenge.dk"
          >jonas@godepenge.dk</a
        >
      </p>
    </div>
    <div class="col-md-3">
      <strong class="mb-2 headline">Om projektet</strong>
      <p></p>
      <p class="link-text">
        <a class="link-text" @click="showPopup = true">Projektbeskrivelse</a
        ><br />
        <a href="Documents/Tak-til.pdf" download>Tak til.pdf</a><br />
        <a href="Documents/Disclaimer.pdf" download>Disclaimer.pdf</a><br />
        <a href="Documents/Billedkreditering.pdf" download
          >Licens og billedkreditering.pdf</a
        >
      </p>
      <p class="link-text">
        <a href="https://www.godepenge.dk/" target="_blank"
          >Gode Penge hjemmeside</a
        >
      </p>
    </div>
    <div class="row">
      <div class="d-flex flex-column align-items-start">
        <strong class="mb-2 headline">Støtte</strong>
        <div class="cp-image-holder" style="gap: 20px; min-width: 232px">
          <img src="FS-Fond-logo.png" id="logo-img-buttom" class="img-fluid" />
          <img
            src="tuborgfondet-logo.png"
            id="logo-img-buttom"
            class="img-fluid logo-img"
          />
          <img
            src="KR-Foundation_Logo.png"
            id="logo-img-buttom"
            class="img-fluid logo-img"
          />
        </div>
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
  align-items: center;
  gap: 40px;
  background-color: var(--color-red);
  padding-top: 48px;
  padding-bottom: 48px;
  padding-left: 60px;
}

.headline {
  display: block;
  color: var(--color-white);
  font-size: 1.2rem;
  padding-bottom: 18px;
}

.cp-image-holder {
  min-width: 240px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
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

#logo-img-buttom {
  width: auto;
  display: block;
  height: 50px;
}

@media (max-width: 768px) {
  .background-contact {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    gap: 40px;
  }

  .background-contact > div {
    align-items: center; /* center inner flex columns */
    display: flex;
    flex-direction: column;
  }

  .headline,
  .normal-text,
  .link-text {
    align-self: center; /* optional */
    text-align: center; /* ensure text is centered */
  }

  .cp-image-holder {
    align-items: center;
  }
}
</style>
