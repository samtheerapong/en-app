<?php

use kartik\helpers\Html;
use yii\bootstrap5\Nav;
use yii\helpers\Url;

?>
<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">

    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <!-- <li class="nav-item d-none d-sm-inline-block">
            <a href="<?= \yii\helpers\Url::home() ?>" class="nav-link"><?= Yii::t('app', 'Home') ?></a>
        </li> -->
        <li class="nav-item d-none d-sm-inline-block">
            <a href="#" class="nav-link"> <?= Yii::t('app', 'Home') ?></a>
        </li>

        <!-- QC Menu Links -->
        <li class="nav-item dropdown">
            <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">
                <?= Yii::t('app', 'QC') ?>
            </a>

            <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">

                <!-- Koji -->
                <li class="dropdown-submenu dropdown-hover">
                    <a id="dropdowLevel1" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-item dropdown-toggle">
                        <?= Yii::t('app', 'Koji') ?></a>
                    <ul aria-labelledby="dropdowLevel1" class="dropdown-menu border-0 shadow">
                        <span class="dropdown-header"><?= Yii::t('app', 'Records') ?></span>
                        <li><a href="<?= Url::toRoute('/sauce/koji/index') ?>" class="dropdown-item"> <?= Yii::t('app', 'Koji Records Table') ?> </a></li>
                        <li><a href="<?= Url::toRoute('/sauce/koji/card') ?>" class="dropdown-item"> <?= Yii::t('app', 'Koji Record Card') ?> </a></li>

                        <div class="dropdown-divider"></div>
                        <span class="dropdown-header"><?= Yii::t('app', 'Reports') ?></span>
                        <li><a href="<?= Url::toRoute('/sauce/koji/report1') ?>" class="dropdown-item"> <?= Yii::t('app', 'Koji Report 1') ?></a></li>
                        <li><a href="<?= Url::toRoute('/sauce/koji/report2') ?>" class="dropdown-item"> <?= Yii::t('app', 'Koji Report 2') ?></a></li>

                        <div class="dropdown-divider"></div>
                        <span class="dropdown-header"><?= Yii::t('app', 'Configurations') ?></span>
                        <li><a href="<?= Url::toRoute('/sauce/koji/index') ?>" class="dropdown-item"> <?= Yii::t('app', 'Koji') ?></a></li>
                    </ul>
                </li>

                <!-- Moromi -->
                <li class="dropdown-submenu dropdown-hover">
                    <a id="dropdowLevel1" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-item dropdown-toggle">
                        <?= Yii::t('app', 'Moromi') ?></a>
                    <ul aria-labelledby="dropdowLevel1" class="dropdown-menu border-0 shadow">
                        <span class="dropdown-header"><?= Yii::t('app', 'Records') ?></span>
                        <li><a href="<?= Url::toRoute('/sauce/moromi/index') ?>" class="dropdown-item"> <?= Yii::t('app', 'Moromi Record Table') ?> </a></li>
                        <li><a href="<?= Url::toRoute('/sauce/moromi/card') ?>" class="dropdown-item"> <?= Yii::t('app', 'Moromi Record Card') ?> </a></li>
                        <li><a href="<?= Url::toRoute('/sauce/moromi-list/index') ?>" class="dropdown-item"> <?= Yii::t('app', 'Moromi List') ?></a></li>

                        <div class="dropdown-divider"></div>
                        <span class="dropdown-header"><?= Yii::t('app', 'Reports') ?></span>
                        <li><a href="<?= Url::toRoute('/sauce/moromi/report1') ?>" class="dropdown-item"> <?= Yii::t('app', 'Moromi Report 1') ?></a></li>
                        <li><a href="<?= Url::toRoute('/sauce/moromi/report2') ?>" class="dropdown-item"> <?= Yii::t('app', 'Moromi Report 2') ?></a></li>

                        <div class="dropdown-divider"></div>
                        <span class="dropdown-header"><?= Yii::t('app', 'Configurations') ?></span>
                        <li><a href="<?= Url::toRoute('/sauce/tank-source/index') ?>" class="dropdown-item"> <?= Yii::t('app', 'Tank Source') ?></a></li>
                        <li><a href="<?= Url::toRoute('/sauce/tank-destination/index') ?>" class="dropdown-item"> <?= Yii::t('app', 'Tank Destination') ?></a></li>
                        <li><a href="<?= Url::toRoute('/sauce/moromi-list-memo/index') ?>" class="dropdown-item"> <?= Yii::t('app', 'Moromi Memo List') ?></a></li>
                    </ul>
                </li>

                <!-- Raw Sauce -->
                <li class="dropdown-submenu dropdown-hover">
                    <a id="dropdowLevel1" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-item dropdown-toggle">
                        <?= Yii::t('app', 'Raw Sauce') ?></a>
                    <ul aria-labelledby="dropdowLevel1" class="dropdown-menu border-0 shadow">
                        <span class="dropdown-header"><?= Yii::t('app', 'Records') ?></span>
                        <li><a href="<?= Url::toRoute('/sauce/raw-sauce/index') ?>" class="dropdown-item"> <?= Yii::t('app', 'Raw Sauce Table') ?> </a></li>
                        <li><a href="<?= Url::toRoute('/sauce/raw-sauce/index2') ?>" class="dropdown-item"> <?= Yii::t('app', 'Raw Sauce Card') ?> </a></li>

                        <div class="dropdown-divider"></div>
                        <span class="dropdown-header"><?= Yii::t('app', 'Reports') ?></span>
                        <li><a href="<?= Url::toRoute('/sauce/raw-sauce/report1') ?>" class="dropdown-item"> <?= Yii::t('app', 'Report Select Type') ?></a></li>
                        <li><a href="<?= Url::toRoute('/sauce/raw-sauce/report2') ?>" class="dropdown-item"> <?= Yii::t('app', 'Report Select Tank') ?></a></li>

                        <div class="dropdown-divider"></div>
                        <span class="dropdown-header"><?= Yii::t('app', 'Configurations') ?></span>
                        <li><a href="<?= Url::toRoute('/sauce/tank/index') ?>" class="dropdown-item"> <?= Yii::t('app', 'Tank') ?></a></li>
                        <li><a href="<?= Url::toRoute('/sauce/type/index') ?>" class="dropdown-item"> <?= Yii::t('app', 'Type') ?></a></li>
                    </ul>
                </li>

            </ul>
        </li>

        <!-- Engineering Menu Links -->
        <li class="nav-item dropdown">
            <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">
                <?= Yii::t('app', 'EN') ?>
            </a>

            <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">
                <!-- Repair -->
                <li class="dropdown-submenu dropdown-hover">
                    <a id="dropdowLevel1" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-item dropdown-toggle">
                        <?= Yii::t('app', 'Request Repair') ?></a>
                    <ul aria-labelledby="dropdowLevel1" class="dropdown-menu border-0 shadow">
                        <span class="dropdown-header"><?= Yii::t('app', 'Request Repair') ?></span>
                        <li><a href="<?= Url::toRoute('/engineer/request-repair/index') ?>" class="dropdown-item"> <?= Yii::t('app', 'Request Repair') ?> </a></li>
                        <li><a href="<?= Url::toRoute('/engineer/request-repair/table') ?>" class="dropdown-item"> <?= Yii::t('app', 'Request Repair Table') ?> </a></li>
                        <div class="dropdown-divider"></div>
                        <span class="dropdown-header"><?= Yii::t('app', 'Reports') ?></span>
                        <li><a href="<?= Url::toRoute('/sauce/request-repair/report1') ?>" class="dropdown-item"> <?= Yii::t('app', 'Repair Report 1') ?></a></li>
                        <li><a href="<?= Url::toRoute('/sauce/request-repair/report2') ?>" class="dropdown-item"> <?= Yii::t('app', 'Repair Report 2') ?></a></li>
                        <div class="dropdown-divider"></div>
                        <span class="dropdown-header"><?= Yii::t('app', 'Configurations') ?></span>
                        <li><a href="<?= Url::toRoute('/engineer/job-status/index') ?>" class="dropdown-item"> <?= Yii::t('app', 'Job Status') ?></a></li>
                        <li><a href="<?= Url::toRoute('/general/urgency/index') ?>" class="dropdown-item"> <?= Yii::t('app', 'Urgency') ?></a></li>
                        <li><a href="<?= Url::toRoute('/general/priority/index') ?>" class="dropdown-item"> <?= Yii::t('app', 'Priority') ?></a></li>
                    </ul>
                </li>

            </ul>
        </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <?php
        if (Yii::$app->user->isGuest) {
            // echo Html::tag('li', Html::a(Yii::t('app', 'Register'), ['/site/signup'], ['class' => 'nav-link']));
            echo Html::tag('li', Html::a(Yii::t('app', 'Login'), ['/site/login'], ['class' => 'nav-link']));
        } else {
            $nameToDisplay = Yii::$app->user->identity->thai_name ?: Yii::$app->user->identity->username;
            $menuItems = [
                [
                    'label' => Yii::t('app', 'Configuration'),
                    'visible' => in_array(Yii::$app->user->identity->username, ['admin', 'theerapong']),
                    'items' => [
                        [
                            'label' => Yii::t('app', 'Auto Number'),
                            'visible' => in_array(Yii::$app->user->identity->username, ['admin']),
                            'url' => ['/auto-number/index'],
                        ],
                        [
                            'label' => Yii::t('app', 'Profile'),
                            'url' => ['/user/view', 'id' => Yii::$app->user->identity->id],
                        ],
                        [
                            'label' => Yii::t('app', 'Users'),
                            'url' => ['/user/index'],
                        ],
                    ],
                ],
                [
                    'label' => Yii::$app->language == 'th-TH' ? 'TH' : 'EN',
                    'url' => Url::current(['language' => Yii::$app->language == 'th-TH' ? 'en-US' : 'th-TH']),
                    'linkOptions' => ['class' => 'active'],
                ],
                [
                    'label' => "( $nameToDisplay )",
                    'items' => [
                        ['label' => Yii::t('app', 'Logout'), 'url' => ['/site/logout'], 'linkOptions' => ['class' => 'logout-link', 'data-method' => 'post']],
                    ],
                ],
            ];
            echo Nav::widget([
                'options' => ['class' => 'navbar-nav ml-auto'],
                'items' => $menuItems,
            ]);
        }
        ?>

        </li>
        <li class="nav-item">
            <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                <i class="fas fa-expand-arrows-alt"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
                <i class="fas fa-th-large"></i>
            </a>
        </li>
    </ul>

</nav>