<template>
  <div class="container">
    <div class="left">
      <h1>Hvordan balanceres en god investering?</h1>
      <p>
        Justér på parametrene og se hvordan du kan lave investeringer i bedst
        mulig balance.
      </p>
    </div>

    <div class="right">
      <div v-for="(label, key) in labels" :key="key" class="slider-group">
        <label>{{ label }}</label>
        <input
          type="range"
          :value="sliders[key]"
          min="0"
          max="100"
          @input="onSliderChange(key, $event.target.value)"
        />
      </div>
    </div>
  </div>
</template>

<script setup>
import { reactive } from 'vue'

const labels = {
  economic: 'Økonomisk afkast',
  social: 'Samfundsgevinst',
  nature: 'Natur'
}

const sliders = reactive({
  economic: 33,
  social: 33,
  nature: 34
})

function onSliderChange(changedKey, newValue) {
  newValue = parseInt(newValue)
  const others = Object.keys(sliders).filter(k => k !== changedKey)
  let remaining = 100 - newValue

  if (remaining <= 0) {
    others.forEach(k => (sliders[k] = 0))
  } else {
    const totalOthers = sliders[others[0]] + sliders[others[1]]
    if (totalOthers === 0) {
      sliders[others[0]] = Math.floor(remaining / 2)
      sliders[others[1]] = remaining - sliders[others[0]]
    } else {
      sliders[others[0]] = Math.round(
        (sliders[others[0]] / totalOthers) * remaining
      )
      sliders[others[1]] = 100 - newValue - sliders[others[0]]
    }
  }

  sliders[changedKey] = newValue
}
</script>

<style scoped>
.container {
  background: #a77fd4;
  color: white;
  padding: 2rem;
  font-family: sans-serif;
  min-height: 100vh;
}

.left {
  flex: 1;
  padding-right: 2rem;
}

.left h1 {
  font-size: 2rem;
  margin-bottom: 1rem;
}

.right {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
}

.slider-group {
  margin-bottom: 1.5rem;
}

label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
}

input[type='range'] {
  width: 100%;
  accent-color: #57c48e;
}
</style>
