// import { boot } from 'quasar/wrappers'

// // "async" is optional;
// // more info on params: https://v2.quasar.dev/quasar-cli/boot-files
// export default boot(async (/* { app, router, ... } */) => {
//   // something to do
// })

import { Cookies } from 'quasar'
import createPersistedState from 'vuex-persistedstate'

// console.log(`$q.cookies`, $q.cookies)

export default async ({ app, router, store, Vue, ssrContext }) => {
  
  const cookies = process.env.SERVER
    ? Cookies.parseSSR(ssrContext)
    : Cookies
    
    // const cookies = process.env.SERVER
    //   ? 1
    //   : 2
    
    // var cookiesx = Cookies.all()
    
    // console.log(`cookiesx`, cookiesx)
    // // console.log(`process`, process)

// console.log(`cookies in persist auth`, cookies)

  createPersistedState({
      paths: [],
      storage: {
        getItem: key => JSON.stringify(cookies.get(key)),
        setItem: (key, value) => cookies.set(key, value),
        removeItem: key => cookies.remove(key)
      }
  })(store)
}