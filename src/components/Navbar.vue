<template>
  <nav class="navbar navbar-expand-lg navbar-styling navbar-dark">
    <div class="wrapper container-fluid">
      <a class="navbar-brand" href="#">
        <img src="GP_Logo_new.png" id="logo-image" class="img-fluid" />
      </a>
      <ul class="list-container navbar-nav me-auto">
        <!-- <li class="nav-item">
          <a class="nav-link" aria-current="page" href="#/front">Front</a>
        </li> -->
        <li class="nav-item">
          <a
            class="nav-link active"
            href="#"
            @click.prevent="scrollToTarget('ex-article-page')"
            >Hvorfor Gode Investeringer?</a
          >
        </li>
        <li class="nav-item">
          <a
            class="nav-link active"
            href="#"
            @click.prevent="scrollToTarget('ex-podcast-page')"
            >Hvordan Laves Gode Investeringer?</a
          >
        </li>
        <li class="nav-item">
          <a
            class="nav-link"
            href="#"
            @click.prevent="scrollToTarget('ex-contact-page')"
            >Kontakt</a
          >
        </li>
      </ul>
    </div>
  </nav>
</template>

<script>
import { nextTick } from 'vue'

export default {
  setup() {
    const scrollToTarget = idTarget => {
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

    return { scrollToTarget }
  }
}
</script>

<style>
.navbar-styling {
  width: 100%;
  background-color: var(--color-red);
}

.nav-link.extra {
  color: var(--color-white);
  font-weight: 500;
  text-decoration: none;
  transition: color 0.3s ease;
}

.nav-link:hover {
  color: blue;
}

#logo-image {
  width: 60px;
  height: auto;
  position: relative;
  top: 20px;
  left: 20px;
  margin-right: 20px;
}

.wrapper {
  max-height: 40px;
}

.list.container {
  flex-direction: row;
}

@media (max-width: 768px) {
  .list-container {
    visibility: hidden;
  }
}
</style>
