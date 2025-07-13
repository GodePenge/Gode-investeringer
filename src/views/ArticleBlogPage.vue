<template>
  <div id="ex-articleBlogPage" class="container-fluid m-0 p-0 abp-container">
    <div class="abp-wrapper">
      <div class="abp-text-wrapper">
        <h1 class="abp-headline headline-a">Gode investerings nyheder</h1>
        <p class="abp-text text-a">
          Læs dybdegående analyser om vores investeringer i dag.
        </p>
      </div>
      <div class="carousel-container">
        <span class="abp-arrow-button" @click="prev">‹</span>

        <div class="carousel-wrapper">
          <div
            class="carousel-track"
            :style="{
              transform: `translateX(-${currentIndex * (itemWidth + gap)}px)`,
              '--items-to-show': itemsToShow
            }"
          >
            <div
              v-for="(item, index) in combinedItems"
              :key="item.title + index"
              class="abp-carousel-item"
              @click="handleClick(item)"
            >
              <div class="image-wrapper">
                <img :src="item.image" :alt="item.title" />
              </div>
              <div class="text-a abp-overlay-text">
                <small>{{ item.type }}</small>
                <h3 class="headline-a abp-small-title">{{ item.title }}</h3>
              </div>
            </div>
          </div>
        </div>

        <span class="abp-arrow-button" @click="next">›</span>
      </div>
    </div>
  </div>
</template>

<script>
import articles from '@/assets/Data/Articles.json'
import blogPosts from '@/assets/Data/BlogPosts.json'
import { useRouter } from 'vue-router'

export default {
  data() {
    return {
      router: useRouter(),
      currentIndex: 0,
      itemsToShow: 3,
      itemWidth: 250,
      gap: 32
    }
  },
  mounted() {
    this.updateItemsToShow()
    window.addEventListener('resize', this.updateItemsToShow)
  },
  beforeUnmount() {
    window.removeEventListener('resize', this.updateItemsToShow)
  },
  computed: {
    combinedItems() {
      const articlesCopy = [...articles]
      const blogPostsCopy = [...blogPosts]
      const result = []

      const maxLength = Math.max(articlesCopy.length, blogPostsCopy.length)
      for (let i = 0; i < maxLength; i++) {
        if (articlesCopy[i])
          result.push({ ...articlesCopy[i], originalIndex: i })
        if (blogPostsCopy[i])
          result.push({ ...blogPostsCopy[i], originalIndex: i })
      }

      return result
    }
  },
  methods: {
    updateItemsToShow() {
      const width = window.innerWidth
      if (width >= 1024) {
        this.itemsToShow = 3
      } else if (width >= 768) {
        this.itemsToShow = 2
      } else {
        this.itemsToShow = 1
      }

      // Optional: keep currentIndex in bounds
      if (this.currentIndex + this.itemsToShow > this.combinedItems.length) {
        this.currentIndex = Math.max(
          0,
          this.combinedItems.length - this.itemsToShow
        )
      }
    },
    next() {
      if (this.currentIndex < this.combinedItems.length - this.itemsToShow) {
        this.currentIndex++
      }
    },
    prev() {
      if (this.currentIndex > 0) {
        this.currentIndex--
      }
    },
    handleClick(item) {
      if (item.type === 'Artikel' && item.link) {
        window.open(item.link, '_blank')
      } else if (item.type === 'Blogindlæg') {
        this.handleBlogClick(item.originalIndex)
      }
    },
    handleBlogClick(originalIndex) {
      this.router
        .push({
          name: 'ArticlePage',
          params: { index: originalIndex },
          state: { cards: blogPosts }
        })
        .then(() => {
          window.scrollTo({
            top: 0,
            behavior: 'smooth'
          })
        })
    }
  }
}
</script>

<style>
.abp-container {
  width: 100%;
  background-color: var(--color-dark-green);
  display: flex;
  justify-content: center;
  align-items: center;
}

.abp-wrapper {
  height: 40rem;
  max-width: 1200px;
  width: 100%;
  box-sizing: border-box;
  padding: 3rem 2rem;
  padding-top: 5rem;
  padding-bottom: 0;
  background-color: var(--color-dark-green);
  display: flex;
  justify-content: center;
  align-items: left;
  text-align: left;
  flex-direction: column;
  gap: 20px;
}

.abp-text-wrapper {
  width: 60%;
}

.abp-headline {
  font-size: 3.7rem;
  color: var(--color-white);
  margin-bottom: 0;
}

.abp-text {
  font-size: 1rem;
  color: var(--color-white) !important;
}

.abp-overlay-text {
  display: flex;
  align-items: left;
  text-align: left;
  position: relative;
  flex-direction: column;
  gap: 20px;
  bottom: 80px;
  color: white !important;
  padding: 0.5rem;
  box-sizing: border-box;
}

.abp-arrow-button {
  color: var(--color-white);
  cursor: pointer;
  font-size: 6rem;
  transition: color 0.3s;
  margin: 10px;
  padding-bottom: 140px;
  margin-top: 0;
}

.abp-arrow-button:hover {
  color: grey;
}

.carousel-container {
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  flex-direction: row;
  gap: 20px;
  background-color: var(--color-dark-green);
  padding: 2rem;
}

.abp-small-title {
  font-size: 1.8rem;
  color: var(--color-white);
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.abp-carousel-item {
  cursor: pointer;
  flex-shrink: 0;
  width: 250px;
}

.arrow {
  font-size: 2rem;
  background: none;
  color: white;
  border: none;
  cursor: pointer;
}

.carousel {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 2rem;
  position: relative;
  overflow: hidden;
}

.carousel-wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 2rem;
  position: relative;
  overflow: hidden;
  width: 80%;
}

.carousel-track {
  display: flex;
  transition: transform 0.5s ease;
  gap: 2rem;
  will-change: transform;
  padding-left: 560px;
}

.image-wrapper {
  width: 250px;
  height: 250px;
}

.image-wrapper img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.text-content small {
  display: block;
  margin-bottom: 0.2rem;
}

.text-content h3 {
  font-weight: bold;
}

.slide-enter-active,
.slide-leave-active {
  transition: all 0.5s ease;
  position: absolute;
}

.slide-enter-from {
  transform: translateX(100%);
  opacity: 0;
}

.slide-leave-to {
  transform: translateX(-100%);
  opacity: 0;
}

@media (max-width: 1140px) {
  .carousel-wrapper {
    width: 540px;
  }

  .carousel-track {
    padding-left: 860px;
  }
}

@media (max-width: 768px) {
  .carousel-wrapper {
    width: 260px;
  }

  .carousel-track {
    padding-left: 1130px;
  }

  .abp-text-wrapper {
    width: 100%;
  }

  .abp-wrapper {
    gap: 0px;
  }
}

@media (max-width: 480px) {
  .abp-headline {
    font-size: 2.5rem;
  }
  .carousel-container {
    gap: 10px;
    padding: 0;
  }
  .abp-overlay-text {
    padding: 10px;
  }
}
</style>
