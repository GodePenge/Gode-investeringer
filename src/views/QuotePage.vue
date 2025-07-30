<template>
  <div class="qp-container">
    <div class="qp-wrapper">
      <div class="qp-text-holder">
        <h1 class="headline-a qp-headline">
          “We must transform our economic system to invest in what we value –
          people, nature, and the future.”
        </h1>
        <p class="qp-text">FN’s generalsekretær António Guterres</p>
      </div>
      <div class="qp-img-wrapper">
        <div class="qp-img-bg"></div>
        <!-- Purple semicircle -->
        <img src="Images/antonio.png" class="qp-img" />
      </div>
    </div>
  </div>
</template>

<style scoped>
.qp-container {
  width: 100%;
  background-color: var(--color-white);
  display: flex;
  justify-content: center;
  align-items: center;
}

.qp-wrapper {
  max-width: 1200px;
  box-sizing: border-box;
  padding: 3rem 2rem;
  padding-bottom: 0;
  background-color: var(--color-white);
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: visible;
  flex-direction: row;
  gap: 80px;
}

.qp-text-holder {
  display: flex;
  justify-content: center;
  align-items: flex-start;
  flex-direction: column;
  width: 60vw;
  gap: 10px;
}

.qp-headline {
  text-align: left;
  position: relative;
  color: var(--color-dark-green);
  white-space: wrap;
  overflow: visible;
  font-size: 3.7rem;
  margin-bottom: 1rem;
}

.qp-text {
  flex-shrink: 1;
  color: var(--color-dark-green);
  font-family: Arial;
}

.qp-img-wrapper {
  overflow: hidden;
  position: relative;
  width: auto;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.qp-img-bg {
  position: absolute;
  width: 500px;
  height: 300px;
  background-color: var(--color-light-purple);
  border-top-left-radius: 400px;
  border-top-right-radius: 400px;
  top: 100px;
  left: -60px;
  z-index: 0;
  transform: rotate(-90deg);
  transform-origin: center;
}

.qp-img {
  position: relative;
  width: 300px;
  z-index: 1;
}

@media (max-width: 992px) {
  .qp-wrapper {
    gap: 20px;
  }

  .qp-headline {
    font-size: 3rem;
  }

  .qp-img {
    width: 250px;
  }
}

@media (max-width: 768px) {
  .qp-text-holder {
    width: 100%;
  }

  .qp-text {
    width: 160px;
  }

  .qp-headline {
    width: 70%;
    font-size: 2.8rem;
  }

  .qp-wrapper {
    flex-direction: column;
    gap: 0px;
    padding-bottom: 0;
  }

  .qp-img-wrapper {
    position: relative;
    top: -120px;
    right: -120px;
    width: 200px;
    height: 300px;
    margin-bottom: -100px;
  }

  .qp-img-bg {
    width: 300px;
    height: 280px;
    left: 40px;
    top: 10px;
    border-top-left-radius: 160px;
    border-top-right-radius: 160px;
  }

  .qp-img {
    width: 200px;
  }
}

@media (max-width: 480px) {
  .qp-headline {
    width: 80%;
    font-size: 2rem;
  }

  .qp-text {
    width: 120px;
    font-size: 14px;
  }

  .qp-img-wrapper {
    top: -120px;
    right: -20px;
    margin-bottom: -100px;
  }
}
</style>
