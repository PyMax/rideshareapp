<template>
    <div class="pt-16">
        <h1 class="text-3xl font-semibold mb-4">Waiting for ride request...</h1>
        <div class="mt-8 flex justify-center">
            <Loader />
        </div>
        <div >
            <!-- <div class="overflow-hidden shadow sm:rounded-md max-w-sm mx-auto text-left">
                <div class="bg-white px-4 py-5 sm:p-6">
                    <div>
                        <GMapMap :zoom="14" center="" ref="gMap"
                            style="width:100%; height: 256px;"></GMapMap>
                    </div>
                    <div class="mt-2">
                        <p class="text-xl">Going to <strong></strong></p>
                    </div>
                </div>
                <div class="flex justify-between bg-gray-50 px-4 py-3 text-right sm:px-6">
                    <button
                        @click="handleDeclineTrip"
                        class="inline-flex justify-center rounded-md border border-transparent bg-black py-2 px-4 text-sm font-medium text-white shadow-sm hover:bg-gray-600 focus:outline-none">Decline</button>
                    <button
                        @click="handleAcceptTrip"
                        class="inline-flex justify-center rounded-md border border-transparent bg-black py-2 px-4 text-sm font-medium text-white shadow-sm hover:bg-gray-600 focus:outline-none">Accept</button>
                </div>
            </div> -->
        </div>
    </div>
</template>
<script setup>
import Loader from '@/components/Loader.vue'
import { onMounted } from 'vue';
import Echo from 'laravel-echo'
import Pusher  from 'pusher-js'


onMounted(() => {
    let echo = new Echo({
        broadcaster : 'pusher',
        key: 'mykey',
        cluster: 'mt1',
        wsHost: window.location.hostname,
        wsPort: 6001,
        forceTLS: false,
        disableStats: true,
        enabledTransports: ['ws', 'wss']
    })

    echo.channel('drivers').listen('TripCreated', (e) => {
        console.log('TripCreated', e)
    });
})
</script>