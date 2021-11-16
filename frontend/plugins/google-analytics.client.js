export default () => {
    const script = document.createElement('script')
    script.src = 'https://www.googletagmanager.com/gtag/js?id=GTM-5FQRDZB'
    script.async = true
    document.getElementsByTagName('head')[0].appendChild(script)
    window.dataLayer = window.dataLayer || [];
    function gtag() {
      dataLayer.push(arguments);
    }
    gtag('js', new Date());
    gtag('config', 'GTM-5FQRDZB');
  };
