import { nextTick } from 'vue'
import { useRouter } from 'vue-router'

export function helperFunctions() {
  const router = useRouter()

  function scrollToTarget(idTarget) {
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

  return {
    scrollToTarget
  }
}
