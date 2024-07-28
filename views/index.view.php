<?php require('partials/head.php') ?>
<?php require('partials/nav.php') ?>
<?php require('partials/banner.php') ?>

<main>
    <div class="mx-auto max-w-7xl px-4 py-6 sm:px-6 lg:px-8">
        <?php foreach ($posts as $post) : ?>
            <div class="relative flex flex-col mt-6 text-gray-700 bg-white shadow-md bg-clip-border rounded-md w-4/5">
                <div class="p-6">
                    
                <div class="flex items-center gap-4 mb-8">
                    <img class="w-10 h-10 rounded-full" src="<?= $post['user_profile_pic'] ?>" alt="">
                    <div class="font-medium text-black">
                        <div><?= $post['poster_username'] ?></div>
                        <div class="text-sm text-gray-500 dark:text-gray-400"><?= $post['date'] ?></div>
                    </div>
                </div>

                    <p class="block font-sans text-base antialiased font-light leading-relaxed text-inherit post-content">
                        <?= htmlspecialchars($post['body']) ?> 
                    </p>
                </div>
                <div class="p-6 pt-0">
                    <a href="/post?id= <?= $post['id'] ?>" class="align-middle select-none font-sans font-bold text-center uppercase transition-all disabled:opacity-50 disabled:shadow-none disabled:pointer-events-none text-xs py-3 px-6 rounded-lg bg-gray-900 text-white shadow-md shadow-gray-900/10 hover:shadow-lg hover:shadow-gray-900/20 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none">
                        Read More
                    </a>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</main>

<?php require('partials/footer.php') ?>