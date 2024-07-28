<?php require('partials/head.php') ?>
<?php require('partials/nav.php') ?>
<?php require('partials/banner.php') ?>

<main>
    <div class="mx-auto max-w-7xl px-4 py-6 sm:px-6 lg:px-8"> 
        <div class="relative flex flex-col mt-6 text-gray-700 bg-white shadow-md bg-clip-border rounded-md w-full">
            <div class="p-6">
                <div class="flex items-center gap-4 mb-8">
                    <img class="w-10 h-10 rounded-full" src="<?= $post['user_profile_pic'] ?>" alt="">
                    <div class="font-medium text-black">
                        <div><?= $post['poster_username'] ?></div>
                        <div class="text-sm text-gray-500 dark:text-gray-400"><?= $post['date'] ?></div>
                    </div>
                </div>
                <pre> <?= htmlspecialchars($post['body']) ?> </pre>
            </div>
        </div>

        <h5 class="block mb-1 font-sans text-xl antialiased font-semibold leading-snug tracking-normal text-blue-gray-900 mt-10">
            Comments
        </h5>

        <?php foreach ($comments as $comment) : ?>
            <div class="relative flex flex-col mt-6 text-gray-700 bg-white shadow-md bg-clip-border rounded-md w-full">
                <div class="p-6">
                    
                    <div class="flex items-center gap-4 mb-8">
                        <img class="w-10 h-10 rounded-full" src="<?= $comment['user_profile_pic'] ?>" alt="">
                        <div class="font-medium text-black">
                            <div><?= $comment['poster_username'] ?></div>
                            <div class="text-sm text-gray-500 dark:text-gray-400"><?= $comment['date'] ?></div>
                        </div>
                    </div>

                    <p class="block font-sans text-base antialiased font-light leading-relaxed text-inherit post-content">
                        <?= htmlspecialchars($comment['content']) ?> 
                    </p>
                </div>
            </div>
        <?php endforeach; ?>

        <?php if (isset($_SESSION['user'])) : ?>
            <form method="POST">
                <div class="space-y-12">
                    <div class="border-b border-gray-900/10 pb-12">
                        <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                            <div class="col-span-full">
                            <label for="content" class="block text-sm font-medium leading-6 text-gray-900">Comment</label>
                            <div class="mt-2">
                                <textarea 
                                    id="content" 
                                    name="content" 
                                    rows="3" 
                                    class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" 
                                    placeholder="Enter your comment here" 
                                    required><?= $_POST['body'] ?? '' ?></textarea>

                                <?php if (isset($errors['content'])) : ?>
                                    <p class="text-red-500 text-xs mt-2"> <?= $errors['content'] ?></p>
                                <?php endif; ?>
                            </div>
                    </div>
                </div>

                <div class="mt-6 flex items-center justify-end gap-x-6">
                    <button type="submit" class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Save Comment</button>
                </div>
            </form>
        <?php else : ?>
            <p class="text-red-500 text-m mt-10"> You need to login first before you can comment to any post</p>
        <?php endif; ?>
    </div>
</main>

<?php require('partials/footer.php') ?>