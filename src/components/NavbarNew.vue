<template>
  <div class="container-fluid m-0 p-0 navbar-wrapper">
    <div class="navbar-container">
      <a class="navbar-brand" href="#">
        <img
          src="GP_Logo_new.png"
          id="logo-image"
          @click.prevent="goToHome"
          class="img-fluid"
        />
      </a>
      <a
        class="navbar-text highlight-navbar-text"
        href="#"
        @click.prevent="scrollToTarget('ex-climateCrisisPage')"
        >Hvorfor Gode Investeringer?</a
      >
      <a
        class="navbar-text highlight-navbar-text"
        href="#"
        @click.prevent="scrollToTarget('ex-utopiaPage')"
        >Hvordan Laves Gode Investeringer?</a
      >
      <a
        class="navbar-text highlight-navbar-text"
        href="#"
        @click.prevent="scrollToTarget('ex-contact-page')"
        >kontakt os</a
      >
      <Slide right :closeOnNavigation="true">
        <a
          class="navbar-text navbar-text-burger"
          href="#"
          @click.prevent="scrollToTarget('ex-climateCrisisPage')"
          >Hvorfor Gode Investeringer?</a
        >
        <a
          class="navbar-text navbar-text-burger"
          href="#"
          @click.prevent="scrollToTarget('ex-utopiaPage')"
          >Hvordan Laves Gode Investeringer?</a
        >
        <a
          class="navbar-text navbar-text-burger"
          href="#"
          @click.prevent="scrollToTarget('ex-contact-page')"
          >kontakt os</a
        >
      </Slide>
    </div>
  </div>
</template>

<script>
import { Slide } from 'vue3-burger-menu'
import { useRouter } from 'vue-router'
import { helperFunctions } from '@/utils/HelperFunctions'

export default {
  components: {
    Slide
  },

  setup() {
    const router = useRouter()

    function goToHome() {
      //Go to home first
      router.push({
        name: 'home'
      })
    }

    const { scrollToTarget } = helperFunctions()

    return { scrollToTarget, goToHome }
  }
}
</script>

<style>
.bm-menu {
  height: 50% !important;
  background-color: var(--color-red) !important;
  padding-top: 30px !important; /* Place content 60px from the top */
  transition: 0.4s !important; /*0.5 second transition effect to slide in the sidenav*/
}

.bm-burger-bars {
  background-color: var(--color-white);
}

.bm-burger-button {
  position: absolute !important;
  margin-left: auto !important;
  right: 30px !important;
  top: 20px !important;
  display: none !important;
}

.bm-item-list {
  color: var(--color-white);
}

.navbar-text {
  text-decoration: none;
  color: var(--color-white) !important;
  transition: font-size, 0.4s;
  font-style: normal;
  font-kerning: normal;
  flex-shrink: 1; /* allow text to shrink */
  min-width: 80px; /* avoid full collapse */
  white-space: nowrap; /* prevent wrapping */
  overflow: hidden;
  text-overflow: ellipsis;
}

.navbar-text-burger {
  font-size: 20px;
  text-decoration: underline;
  text-wrap: wrap;
}

.highlight-navbar-text {
  height: 64px;
  font-size: 17px;
  font-weight: 700;
  margin-left: 10px;
}

.highlight-navbar-text:hover {
  font-size: 18px;
}

.navbar-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-direction: row;
  flex-wrap: wrap;
  max-width: 1200px;
  height: 64px;
  width: 100%;
  background-color: var(--color-red);
  cursor: auto;
}

.navbar-wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: row;
  flex-wrap: wrap; /* allows wrapping if needed */
  max-width: 100%;
  height: 64px;
  padding: 0 1rem;
  background-color: var(--color-red);
  cursor: auto;
}

#logo-image {
  width: 80px;
  height: auto;
  position: relative;
  flex-shrink: 0;
  top: 18px;
  left: 14px;
  margin-right: 15%;
  cursor: pointer;
}

/* Mobile version */

@media (min-width: 768px) and (max-width: 992px) {
  .navbar-wrapper {
    gap: 3%;
  }
}

@media (max-width: 768px) {
  .highlight-navbar-text {
    display: none;
  }
  .navbar-text-contact {
    display: none;
  }
  .bm-burger-button {
    display: block !important;
  }
}
</style>
