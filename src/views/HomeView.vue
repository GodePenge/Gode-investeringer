<template>
  <div class="container-fluid m-0 p-0" style="width: 100%">
    <HeaderPage></HeaderPage>

    <ArticlePageNew></ArticlePageNew>

    <InvestCreation></InvestCreation>

    <QuotePage></QuotePage>

    <ClimateCrisisPage></ClimateCrisisPage>

    <UtopiaPage></UtopiaPage>
  </div>
</template>

<script>
import HeaderPage from './HeaderPage.vue'
import ArticlePageNew from './ArticlePageNew.vue'
import InvestCreation from './InvestCreation.vue'
import QuotePage from './QuotePage.vue'
import ClimateCrisisPage from './ClimateCrisisPage.vue'
import UtopiaPage from './UtopiaPage.vue'

export default {
  components: {
    HeaderPage,
    ArticlePageNew,
    InvestCreation,
    QuotePage,
    ClimateCrisisPage,
    UtopiaPage
  }
}
</script>
