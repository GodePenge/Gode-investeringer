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
        <p class="text-a small-headline">Den sorte finanssektor</p>
        <p class="text-a text-pp">
          Hvilken rolle spiller finanssektoren i den grønne omstilling? Vi
          spørger, hvorfor banker og pensionskasser investerer så mange
          millioner i den fossile industri. Lyt med på din favorit platform.
        </p>

        <div class="pp-button-holder">
          <button class="button-a button-pp" @click="goToLinkSpotify">
            Lyt på spotify
          </button>
          <button class="button-a button-pp" @click="goToLinkSpreaker">
            Lyt på spreaker
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
const goToLinkSpotify = () => {
  window.open(
    'https://open.spotify.com/show/4FrtBLrO6dEWxOsELdyEa1?si=c36f81df9de54cf6',
    '_blank'
  )
}

const goToLinkSpreaker = () => {
  window.open(
    'https://www.spreaker.com/podcast/den-sorte-finanssektor--6866880',
    '_blank'
  )
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
  height: 44rem;
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
  font-size: 1.5rem;
  margin-bottom: 0;
  margin-left: 18px;
}

.text-pp {
  color: var(--color-dark-green);
  margin-bottom: 0;
  margin-left: 18px;
}

.pp-button-holder {
  margin-top: 60px;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: row;
  flex-wrap: wrap;
  white-space: nowrap;
  gap: 16px;
}

.right-holder {
  display: flex;
  justify-content: center;
  align-items: left;
  text-align: left;
  flex-direction: column;
  gap: 20px;
  margin-bottom: 60px;
  width: 560px;
  max-width: 100%;
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
  .right-holder {
    align-items: center;
    gap: 20px;
    margin-bottom: 60px;
  }

  .image-cropper {
    position: relative;
  }

  .image-semi {
    position: relative;
  }

  .button-pp {
    margin-left: 10px;
    margin-right: 10px;
  }
}

@media (max-width: 480px) {
  .headline-pp {
    width: 90%;
  }

  .image-cropper {
    width: 300px;
    height: 160px;
    overflow: hidden;
    position: relative;
  }

  .pp-button-holder {
    margin-top: 10px;
  }
}
</style>
