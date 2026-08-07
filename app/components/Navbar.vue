<template>
    <nav class="navbar">
        <div class="logo">
            Nuxt SPA
        </div>

        <div class="menu">
            <NuxtLink to="/" class="link">
                Home
            </NuxtLink>

            <NuxtLink to="/about" class="link">
                About
            </NuxtLink>

            <NuxtLink to="/course" class="link">
                Course
            </NuxtLink>
        </div>
    </nav>
</template>

<style scoped>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    background:#1e293b;
    padding:15px 40px;
}

.logo{
    color:#fff;
    font-size:24px;
    font-weight:bold;
}

.menu{
    display:flex;
    gap:20px;
}

.link{
    color:#fff;
    text-decoration:none;
    padding:8px 15px;
    border-radius:5px;
    transition:.3s;
}

.link:hover{
    background:#334155;
}

.router-link-active{
    background:#2563eb;
}
</style>