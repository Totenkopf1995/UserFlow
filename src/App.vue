<template>
  <div class="bg-[url('@/assets/images/bg.jpg')] bg-cover bg-center h-screen flex flex-col">
    <div class="flex-grow">
      <div id="app" class="bg-gray-500">
        <nav class="container px-6 py-8 mx-auto md:flex md:justify-between md:items-center">
          <div class="flex items-center justify-between space-x-6">
            <!--Vue Router-->
            <RouterLink to="/" class="text-xl font-bold text-gray-800 md:text-2xl hover:text-blue-400">
              <button class="bg-blue-500 hover:bg-blue-400 text-white font-bold py-2 px-4 border-b-4 border-blue-700 hover:border-blue-500 rounded">
                List
              </button>
            </RouterLink>
            <RouterLink to="/register" class="text-xl font-bold text-gray-800 md:text-2xl hover:text-blue-400">
              <button class="bg-blue-500 hover:bg-blue-400 text-white font-bold py-2 px-4 border-b-4 border-blue-700 hover:border-blue-500 rounded">
                Registration
              </button>
            </RouterLink>
          </div>
          <div class="flex items-center justify-between">
            <a href="https://github.com/Totenkopf1995" target="_blank" rel="noopener noreferrer">
              <button type="button" class="text-white bg-[#24292F] hover:bg-[#24292F]/90 focus:ring-4 focus:outline-none focus:ring-[#24292F]/50 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center dark:focus:ring-gray-500 dark:hover:bg-[#050708]/30 me-2 mb-2">
                <svg class="w-4 h-4 me-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M10 .333A9.911 9.911 0 0 0 6.866 19.65c.5.092.678-.215.678-.477 0-.237-.01-1.017-.014-1.845-2.757.6-3.338-1.169-3.338-1.169a2.627 2.627 0 0 0-1.1-1.451c-.9-.615.07-.6.07-.6a2.084 2.084 0 0 1 1.518 1.021 2.11 2.11 0 0 0 2.884.823c.044-.503.268-.973.63-1.325-2.2-.25-4.516-1.1-4.516-4.9A3.832 3.832 0 0 1 4.7 7.068a3.56 3.56 0 0 1 .095-2.623s.832-.266 2.726 1.016a9.409 9.409 0 0 1 4.962 0c1.89-1.282 2.717-1.016 2.717-1.016.366.83.402 1.768.1 2.623a3.827 3.827 0 0 1 1.02 2.659c0 3.807-2.319 4.644-4.525 4.889a2.366 2.366 0 0 1 .673 1.834c0 1.326-.012 2.394-.012 2.72 0 .263-.18 .572 .681 .475A9 .911,9 .911,0,0,0,10,.333Z"
                        clip-rule="evenodd"/>
                </svg>
                Find me on Github <!--Button to github-->
              </button>
            </a>
          </div>
        </nav>
      </div>
      <!--Vue Router-->
      <RouterView />
    </div>
    <footer class="bg-white rounded-lg shadow m-4 dark:bg-gray-800">
      <div class="w-full mx-auto max-w-screen-xl p-4 md:flex md:items-center md:justify-between">
        <span class="text-sm text-gray-500 sm:text-center dark:text-gray-400">©2023 - {{new Date().getFullYear()}} <!--Print the Year-->
          <!--Linkedin-->
          <a href="https://www.linkedin.com/in/andrestorresdeveloper/" target="_blank" rel="noopener noreferrer" class="hover:underline">t0t3nk0pf™</a>. All Rights Reserved.</span>
      </div>
    </footer>
  </div>
</template>

<script setup lang="ts">
</script>