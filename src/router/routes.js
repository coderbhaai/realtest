const routes = [
  // Regular Pages
    {
      path: '/',
      component: () => import('layouts/MainLayout.vue'),
      children: [
        { path: '/', component: () => import('pages/index/Index.vue') },
        { path: '/property', component: () => import('pages/index/Property.vue') },
        { path: '/property/:url', component: () => import('pages/index/PropertySingle.vue') },
        { path: '/contact', component: () => import('pages/index/Contact.vue') },
        { path: '/blog', component: () => import('pages/blog/Blog.vue') },
        { path: '/blog/:url', component: () => import('pages/blog/Single.vue') },
      ],
    },

  // No Auth Pages
    {
      path: '/',
      component: () => import('layouts/MainLayout.vue'),
      children: [
        { path: '/register', component: () => import('pages/auth/Register.vue') },
        { path: '/login', component: () => import('pages/auth/Login.vue') },
      ],
      meta: { noAuth: true },
    },

  // Admin Pages
    {
      path: '/',
      component: () => import('layouts/MainLayout.vue'),
      children: [
        { path: '/admin/meta', component: () => import('pages/admin/Meta.vue') },
        { path: '/admin/blogs', component: () => import('pages/admin/Blogs.vue') },
        { path: '/admin/addBlog', component: () => import('pages/admin/AddBlog.vue') },
        { path: '/admin/updateBlog/:id', component: () => import('pages/admin/UpdateBlog.vue') },
        { path: '/admin/basics', component: () => import('pages/admin/Basics.vue') },
        { path: '/admin/property', component: () => import('pages/admin/Property.vue') },
        { path: '/admin/addProperty', component: () => import('pages/admin/AddProperty.vue') },
        { path: '/admin/updateProperty/:id', component: () => import('pages/admin/UpdateProperty.vue') },
        { path: '/admin/builders', component: () => import('pages/admin/Builders.vue') },
        { path: '/admin/media', component: () => import('pages/admin/Media.vue') },
        { path: '/admin/leads', component: () => import('pages/admin/Leads.vue') },
        { path: '/admin/comments', component: () => import('pages/admin/Comments.vue') },
      ],
      meta: { auth: true, admin: true },
    },

  // Always leave this as last one,
  // but you can also remove it
  {
    // path: '*',
    path: "/:pathMatch(.*)*",
    component: () => import('src/pages/index/Index.vue')
  }
]

export default routes
