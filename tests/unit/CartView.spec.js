import { shallowMount } from '@vue/test-utils';
import CartView from '@/views/User/CartView.vue';
import { createStore } from 'vuex';
import { createRouter, createWebHistory } from 'vue-router';

describe('CartView.vue', () => {
  let store;
  let router;

  beforeEach(() => {
    store = createStore({
      state() {
        return {
          cart: [],
          user: { id: 1, name: "Test User" },
        };
      },
      getters: {
        getCart: (state) => state.cart,
        getUser: (state) => state.user,
      }
    });

    router = createRouter({
      history: createWebHistory(),
      routes: [],
    });
  });

  it('renders without crashing', async () => {
    router.push('/');
    await router.isReady();

    const wrapper = shallowMount(CartView, {
      global: {
        plugins: [store, router],
        stubs: ['router-link', 'router-view'], // Ignore unresolved components
      },
    });

    expect(wrapper.exists()).toBe(true);
  });
});
