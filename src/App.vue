<template>
  <navbarNew></navbarNew>
  <RouterView></RouterView>
  <ContactPage id="ex-contact-page-1"></ContactPage>
</template>

<script>
import NavbarNew from './components/NavbarNew.vue'
import ContactPage from './views/ContactPage.vue'

export default {
  name: 'App',
  components: {
    NavbarNew,
    ContactPage
  }
}
</script>

<style>
body {
  overflow-x: hidden;
}
</style>
