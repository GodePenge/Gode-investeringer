<template>
  <div class="container-pp">
    <div class="wrapper-pp">
      <h3 class="headline-a headline-pp">
        Ta’ viden om Gode Investeringer med på podcast
      </h3>
      <div class="right-holder">
        <div class="image-cropper">
          <img src="Images/building2-red-semi.png" class="image-semi" />
        </div>
        <p class="text-a small-headline">tmp headline</p>
        <p class="text-a text-pp">tmp text</p>
        <button class="button-a button-pp" @click="goToLink">
          Lyt på spotify
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
const goToLink = () => {
  window.open('https://www.google.com', '_blank')
}
</script>

<style scoped>
.container-pp {
  width: 100%;
  background-color: var(--color-white);
  display: flex;
  justify-content: center;
  align-items: center;
}

.wrapper-pp {
  height: 40rem;
  max-width: 1200px;
  width: 100%;
  box-sizing: border-box;
  padding: 3rem 2rem;
  padding-top: 5rem;
  padding-bottom: 0;
  background-color: var(--color-white);
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  flex-direction: row;
  gap: 80px;
}

.headline-pp {
  color: var(--color-dark-green);
  font-size: 3.5rem;
  width: 60%;
}

.small-headline {
  color: var(--color-dark-green);
  font-weight: 600;
  margin-bottom: 0;
  margin-left: 18px;
}

.text-pp {
  color: var(--color-dark-green);
  margin-bottom: 0;
  margin-left: 18px;
}

.right-holder {
  display: flex;
  justify-content: center;
  align-items: left;
  text-align: left;
  flex-direction: column;
  gap: 20px;
  margin-bottom: 60px;
}

.image-cropper {
  width: 560px;
  height: 300px;
  overflow: hidden;
  position: relative;
}

.image-semi {
  position: absolute;
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.button-pp {
  position: relative;
  background-color: var(--color-light-green);
  border-color: var(--color-light-green);
  color: var(--color-white);
  flex: 1 1 0;
  width: 200px;
  margin-left: 18px;
}

.button-pp:hover {
  background-color: var(--color-white);
  color: var(--color-light-green);
  border-color: var(--color-light-green);
}

@media (max-width: 1000px) {
  .headline-pp {
    font-size: 2.7rem;
  }

  .image-cropper {
    width: 400px;
    height: 200px;
    overflow: hidden;
    position: relative;
  }
}

@media (max-width: 768px) {
  .headline-pp {
    font-size: 2rem;
  }
  .wrapper-pp {
    flex-direction: column;
    gap: 0px;
  }
}

@media (max-width: 480px) {
  .image-cropper {
    width: 300px;
    height: 160px;
    overflow: hidden;
    position: relative;
  }
}
</style>
