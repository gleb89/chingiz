export default () => {
    const script = document.createElement('script')
    script.src = 'https://www.googletagmanager.com/gtag/js?id=AW-836709512'
    script.async = true
    document.getElementsByTagName('head')[0].appendChild(script)
    window.dataLayer = window.dataLayer || [];
    function gtag() {
      dataLayer.push(arguments);
    }
    gtag('js', new Date());
    gtag('config', 'AW-836709512');
  };

  AW-836709512