<template>
  <div class="container-fluid m-0 p-0 navbar-wrapper">
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
      @click.prevent="scrollToTarget('ex-article-page')"
      >Hvorfor Gode Investeringer?</a
    >
    <a
      class="navbar-text highlight-navbar-text"
      href="#"
      @click.prevent="scrollToTarget('ex-article-page')"
      >Hvordan Laves Gode Investeringer?</a
    >
    <a
      class="navbar-text navbar-text-contact"
      href="#"
      @click.prevent="scrollToTarget('ex-contact-page')"
      >kontakt os</a
    >
    <Slide right :closeOnNavigation="true">
      <a
        class="navbar-text navbar-text-burger"
        href="#"
        @click.prevent="scrollToTarget('ex-article-page')"
        >Hvorfor Gode Investeringer?</a
      >
      <a
        class="navbar-text navbar-text-burger"
        href="#"
        @click.prevent="scrollToTarget('ex-article-page')"
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
</template>

<script>
import { nextTick } from 'vue'
import { Slide } from 'vue3-burger-menu'
import { useRouter } from 'vue-router'

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

    const scrollToTarget = idTarget => {
      //Go to home first
      router.push({
        name: 'home'
      })

      // Wait a tick to ensure the DOM is updated
      nextTick(() => {
        const el = document.getElementById(idTarget)
        if (el) {
          // Scroll manually if VueScrollTo is failing
          el.scrollIntoView({ behavior: 'smooth' })
        } else {
          console.warn('Podcast element not found yet, retrying…')
          // Retry after delay in case DOM is not mounted yet
          setTimeout(() => {
            const retryEl = document.getElementById(idTarget)
            if (retryEl) {
              retryEl.scrollIntoView({ behavior: 'smooth' })
            } else {
              console.error('Still cannot find #idTarget')
            }
          }, 300)
        }
      })
    }

    return { scrollToTarget, goToHome }
  }
}
</script>

<style>
.bm-menu {
  height: 40%;
  background-color: var(--color-dark-green);
  padding-top: 30px; /* Place content 60px from the top */
  transition: 0.4s; /*0.5 second transition effect to slide in the sidenav*/
}

.bm-burger-bars {
  background-color: var(--color-dark-green);
}

.bm-burger-button {
  position: absolute;
  margin-left: auto;
  right: 30px;
  top: 20px;
  display: none;
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

.navbar-text-contact {
  transition: font-size, 0.4s;
  font-size: 16px;
  padding-right: 20px;
  position: absolute;
  top: 11px;
  right: 10px;
}

.navbar-text-contact:hover {
  font-size: 17px;
}

.highlight-navbar-text {
  font-size: 17px;
  font-weight: 700;
  margin-left: 10px;
}

.highlight-navbar-text:hover {
  font-size: 18px;
}

.navbar-wrapper {
  display: flex;
  justify-content: left;
  align-items: center;
  flex-direction: row;
  flex-wrap: wrap; /* allows wrapping if needed */
  gap: 12%;
  width: 100%;
  height: 64px;
  padding: 0 1rem;
  background-color: var(--color-red);
  cursor: auto;
}

#logo-image {
  width: 64px;
  height: auto;
  position: relative;
  flex-shrink: 0;
  top: 24px;
  left: 24px;
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
    display: block;
  }
}
</style>
