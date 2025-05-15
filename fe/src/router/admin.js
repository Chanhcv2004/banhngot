import { layouts } from "chart.js";

const admin = [
    {
        path: "/admin",
        component: () => import("../layouts/admin.vue"),
        children: [
            {
                path: "dashboard",
                name: "admin-dashboard",
                component: () => import("../pages/admin/dashboard/index.vue")
            },
            {
                path: "order",
                name: "admin-order",
                component: () => import("../pages/admin/order/index.vue")
            },
            {
                path: "category",
                name: "admin-category",
                component: () => import("../pages/admin/category/index.vue")
            },
            {
                path: "addcategory",
                name: "admin-addcategory",
                component: () => import("../pages/admin/category/addcategory.vue")
            },
            {
                path: "updatecategory/:id",
                name: "admin-updatecategory",
                component: () => import("../pages/admin/category/updatecategory.vue")
            },
            {
                path: "product",
                name: "admin-product",
                component: () => import("../pages/admin/product/index.vue")
            },
            {
                path: "discount",
                name: "admin-discount",
                component: () => import("../pages/admin/discount/index.vue")
            },
            {
                path: "custumer",
                name: "admin-custumer",
                component: () => import("../pages/admin/custumer/index.vue")
            },
            {
                path: "setting",
                name: "admin-setting",
                component: () => import("../pages/admin/setting/index.vue")
            },
        ]
    },
    {
        path: "/user",
        component: () => import('../layouts/user.vue'),
        children: [
            {
                path: "home",
                name: "user-home",
                component: () => import('../pages/user/home/index.vue')
            },
            {
                path: "product",
                name: "user-product",
                component: () => import('../pages/user/product/index.vue')
            },
            {
                path: "about",
                name: "user-about",
                component: () => import('../pages/user/about/index.vue')
            },
            {
                path: "contact",
                name: "user-contact",
                component: () => import('../pages/user/contact/index.vue')
            },
            {
                path: "cart",
                name: "user-cart",
                component: () => import('../pages/user/cart/index.vue')
            },
            {
                path: "login",
                name: "user-login",
                component: () => import('../pages/user/login/index.vue')
            },
            {
                path: "info",
                name: "user-info",
                component: () => import('../pages/user/info/index.vue')
            },
            {
                path: "history",
                name: "user-history",
                component: () => import('../pages/user/history/index.vue')
            },
            {
                path: "register",
                name: "user-register",
                component: () => import('../pages/user/register/index.vue')
            }
        ]
    },
    {
        path: "/product",
        component: () => import('../layouts/user.vue'),
        children: [
            {
                path: "detail/:id",
                name: "product-detail",
                component: () => import('../pages/user/detail/index.vue'),
            }
        ]
    },
    {
        path: "/cart",
        component: () => import('../layouts/user.vue'),
        children: [
            {
                path: "pay",
                name: "cart-pay",
                component: () => import('../pages/user/pay/index.vue')
            }
        ]
    }
];
export default admin;