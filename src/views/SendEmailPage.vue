<template>
  <div class="sep-container">
    <div class="sep-wrapper">
      <div class="sep-text-wrapper">
        <h1 class="sep-headline headline-a">
          Skal vi fortælle om Gode Investeringer hos dig?
        </h1>
        <p class="sep-text text-a">
          Hvordan fungerer vores investeringssystem i dag? Hvilke udfordringer
          stiller det? <br />
          Hvordan kan vores vi mulighederne for forandring? <br />
          <br />
          Gennem vores interaktive workshop hører deltagerne mere om <br />
          investeringernes forandringspotentiale og, hvordan vi skaber en bedre
          verden.
        </p>

        <div class="sep-input-holder">
          <input
            v-model="name"
            class="input-field"
            type="text"
            placeholder="Fulde navn"
          />
          <input
            v-model="email"
            class="input-field"
            type="email"
            placeholder="Email"
          />
          <button @click="sendEmail" class="button-a sep-button">
            Send Email
          </button>
        </div>
      </div>
      <img src="Images/Henry_Be_On_Unsplash.png" class="sep-image" />
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      name: '',
      email: ''
    }
  },
  methods: {
    sendEmail() {
      const recipient = 'kontakt@godepenge.dk'
      const subject = encodeURIComponent(
        'Ønske om mere info fra gode investeringer'
      )
      const body = encodeURIComponent(
        `Navn: ${this.name}\nEmail: ${this.email}`
      )

      // Opens the default email client with pre-filled fields
      window.location.href = `mailto:${recipient}?subject=${subject}&body=${body}`
    }
  }
}
</script>

<style>
.sep-container {
  width: 100%;
  background-color: var(--color-light-purple);
  display: flex;
  justify-content: center;
  align-items: center;
}

.sep-wrapper {
  height: 40rem;
  max-width: 1200px;
  width: 100%;
  box-sizing: border-box;
  padding: 3rem 2rem;
  padding-top: 5rem;
  padding-bottom: 0;
  background-color: var(--color-light-purple);
  display: flex;
  justify-content: center;
  align-items: left;
  text-align: left;
  flex-direction: row;
  gap: 40px;
}

.sep-text-wrapper {
  width: 85%;
  display: flex;
  justify-content: center;
  align-items: left;
  text-align: left;
  flex-direction: column;
}

.sep-headline {
  font-size: 3.7rem;
  color: var(--color-white);
  margin-bottom: 0;
}

.sep-text {
  font-size: 1rem;
  color: var(--color-white) !important;
}

.sep-image {
  width: 500px;
  height: auto;
  object-fit: contain; /* Maintain aspect ratio */
}

.sep-input-holder {
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  flex-direction: row;
  gap: 10px;
}

.input-field {
  border: var(--color-white);
  border-width: 2px;
  border-style: solid;
  color: var(--color-white);
  font-style: none;
  text-decoration: none;
  background-color: var(--color-light-purple);
  text-align: center;
  align-items: center;
  height: 46px;
}

.input-field::placeholder {
  color: var(--color-white);
}

.input-field:focus {
  border-width: 2px;
  border-style: solid;
  color: var(--color-white);
  outline: none;
  border-color: var(--color-white);
  box-shadow: none;
}

.sep-button {
  position: relative;
  background-color: var(--color-light-green);
  color: var(--color-white);
  border-color: var(--color-light-green) !important;
  padding-top: 8px;
  padding-bottom: 8px;
  width: 140px;
  font-weight: 500;
  flex: 1 1 0;
  z-index: 2;
}

.sep-button:hover {
  background-color: var(--color-white);
  color: var(--color-light-green);
  border-color: var(--color-light-green);
}

@media (max-width: 1100px) {
  .sep-text-wrapper {
    width: 100%;
  }
  .sep-image {
    display: none;
  }
}

@media (max-width: 768px) {
  .sep-headline {
    font-size: 3rem;
  }

  .sep-wrapper {
    height: 40rem;
  }

  .sep-input-holder {
    flex-direction: column;
  }

  .sep-button {
    width: 188px;
  }
}

@media (max-width: 420px) {
  .sep-headline {
    font-size: 2.5rem;
  }

  .sep-wrapper {
    height: 46rem;
  }
}
</style>
