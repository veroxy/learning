# CREER UN THEME WORDPRESS

---

## CREER LE mon_dossier
CRÉER CES DIFFERENTS FICHIERS
  - head.php
  - footer.php
  - index.php
  - css/style.php avec à l'intérieur:

-- WP-ADMIN
- WP-INCLUDES
les snippet qui font fonctionner wordpress


dans le dossier 
**wp_content > themes > nom_theme** créer les fichiers:
- index.php
    ```php
        <?php
        /**
         * The main template file
         *
         * This is the most generic template file in a WordPress theme
         * and one of the two required files for a theme (the other being style.css).
         * It is used to display a page when nothing more specific matches a query.
         * E.g., it puts together the home page when no home.php file exists.
         *
         * @link https://codex.wordpress.org/Template_Hierarchy
         *
         * @package WordPress
         * @subpackage Twenty_Seventeen
         * @since 1.0
         * @version 1.0
         */
        
        <?php get_header(); ?>
        
        <div class="wrap">
            <?php if ( is_home() && ! is_front_page() ) : ?>
                <header class="page-header">
                    <h1 class="page-title"><?php single_post_title(); ?></h1>
                </header>
            <?php else : ?>
            <header class="page-header">
                <h2 class="page-title"><?php _e( 'Posts', 'twentyseventeen' ); ?></h2>
            </header>
            <?php endif; ?>
        
            <div id="primary" class="content-area">
                <main id="main" class="site-main" role="main">
        
        
        
                </main><!-- #main -->
            </div><!-- #primary -->
            <?php get_sidebar(); ?>
        </div><!-- .wrap -->
        
        <?php get_footer();
        
    ```
- header.php
- footer.php
    ```php
    <?php wp_footer(); ?>
    </body>
    </html>
    ```
- functions.php
    ```php
    <?php
    /**
     * Twenty Seventeen functions and definitions
     *
     * @link https://developer.wordpress.org/themes/basics/theme-functions/
     *
     * @package WordPress
     * @subpackage Twenty_Seventeen
     * @since 1.0
     */
    ```
- style.css
    ```css
    /*
    Theme Name: Twenty Seventeen
    Theme URI: https://wordpress.org/themes/twentyseventeen/
    Author: the WordPress team
    Author URI: https://wordpress.org/
    Description: Twenty Seventeen brings your site to life with header video and immersive featured images. With a focus on business sites, it features multiple sections on the front page as well as widgets, navigation and social menus, a logo, and more. Personalize its asymmetrical grid with a custom color scheme and showcase your multimedia content with post formats. Our default theme for 2017 works great in many languages, for any abilities, and on any device.
    Version: 1.6
    License: GNU General Public License v2 or later
    License URI: http://www.gnu.org/licenses/gpl-2.0.html
    Text Domain: twentyseventeen
    Tags: one-column, two-columns, right-sidebar, flexible-header, accessibility-ready, custom-colors, custom-header, custom-menu, custom-logo, editor-style, featured-images, footer-widgets, post-formats, rtl-language-support, sticky-post, theme-options, threaded-comments, translation-ready
    
    This theme, like WordPress, is licensed under the GPL.
    Use it to make something cool, have fun, and share what you've learned with others.
    */
    ```
- front-page.php





### hook
- ` wp_header()`
- `wp_footer()`
    > port d'attache afin d'integrer des feuilles css / javascript des plugin 
    
### PLUGINS
- [ACF Advanced Custom Fields ](Advanced Custom Fields )
- regenerate thumbnail (régénration de miniature)
- contact form 7 + flamingo (formulaire + sauvegarde mails)
- polylang / wpml
- CPI UI (type de contenu perso)
- Wp Rocket (syteme de cache)
- Wordence (sécurité admin)