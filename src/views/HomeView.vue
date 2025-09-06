<template>
  <div class="container-fluid m-0 p-0" style="width: 100%">
    <title>Gode Investeringer - Invest Smart</title>
    <meta
      name="description"
      content="Find tips til gode investeringer, aktier, og finansiel vækst."
    />

    <HeaderPage></HeaderPage>

    <ArticlePageNew></ArticlePageNew>

    <InvestCreation></InvestCreation>

    <OurInvestmentsPage></OurInvestmentsPage>

    <InvestmentMythsPage></InvestmentMythsPage>

    <QuotePage></QuotePage>

    <ClimateCrisisPage></ClimateCrisisPage>

    <!-- <PodcastPage></PodcastPage> -->

    <ArticleBlogPage></ArticleBlogPage>

    <UtopiaPage></UtopiaPage>

    <PrinciplesInvestPage></PrinciplesInvestPage>

    <SendEmailPage></SendEmailPage>
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
import ArticleBlogPage from './ArticleBlogPage.vue'
import UtopiaPage from './UtopiaPage.vue'
import PrinciplesInvestPage from './PrinciplesInvestPage.vue'
import SendEmailPage from './SendEmailPage.vue'

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
    ArticleBlogPage,
    UtopiaPage,
    PrinciplesInvestPage,
    SendEmailPage
  }
}
</script>
