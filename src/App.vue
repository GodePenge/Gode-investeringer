<template>
  <navbarNew></navbarNew>
  <RouterView></RouterView>
</template>

<script>
// import Navbar from './components/Navbar.vue'
import NavbarNew from './components/NavbarNew.vue'

export default {
  name: 'App',
  components: {
    NavbarNew
  }
}
</script>

<style>
body {
  overflow-x: hidden;
}
</style>
