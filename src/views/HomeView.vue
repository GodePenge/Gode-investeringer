<template>
  <div class="container-fluid m-0 p-0" style="width: 100%">
    <HeaderPage></HeaderPage>

    <ArticlePageNew></ArticlePageNew>

    <InvestCreation></InvestCreation>

    <OurInvestmentsPage></OurInvestmentsPage>

    <InvestmentMythsPage></InvestmentMythsPage>

    <QuotePage></QuotePage>

    <ClimateCrisisPage></ClimateCrisisPage>

    <!-- <PodcastPage></PodcastPage> -->

    <!-- <ArticleBlogPage></ArticleBlogPage> -->

    <UtopiaPage></UtopiaPage>
  </div>
</template>

<script>
import HeaderPage from './HeaderPage.vue'
import ArticlePageNew from './ArticlePageNew.vue'
import InvestCreation from './InvestCreation.vue'
import OurInvestmentsPage from './OurInvestmentsPage.vue'
import InvestmentMythsPage from './InvestmentMythsPage.vue'
import QuotePage from './QuotePage.vue'
import ClimateCrisisPage from './ClimateCrisisPage.vue'
// import PodcastPage from './PodcastPage.vue'
// import ArticleBlogPage from './ArticleBlogPage.vue'
import UtopiaPage from './UtopiaPage.vue'

export default {
  components: {
    HeaderPage,
    ArticlePageNew,
    InvestCreation,
    OurInvestmentsPage,
    InvestmentMythsPage,
    QuotePage,
    ClimateCrisisPage,
    // PodcastPage,
    // ArticleBlogPage,
    UtopiaPage
  }
}
</script>
