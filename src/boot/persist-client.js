import { Cookies } from 'quasar'
import createPersistedState from 'vuex-persistedstate'

// var cookiesx = Cookies.all()

// console.log(`cookiesx`, cookiesx)

export default async ({ app, router, store, Vue }) => {
  const cookies = process.env.SERVER
    ? Cookies.parseSSR(ssrContext)
    : Cookies

  createPersistedState({
      paths: [],
      storage: {
        getItem: key => JSON.stringify(cookies.get(key)),
        setItem: (key, value) => cookies.set(key, value),
        removeItem: key => cookies.remove(key)
      }
  })(store)
}