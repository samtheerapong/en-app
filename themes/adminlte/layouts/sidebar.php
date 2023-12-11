<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
    <img src="<?= Yii::getAlias('@web/') ?>images/nfc-logo.png" alt="Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light"><?= Yii::$app->name ?></span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">


        <!-- SidebarSearch Form -->
        <!-- href be escaped -->
        <div class="form-inline  mt-2 pb-1 d-flex">
            <div class="input-group" data-widget="sidebar-search">
                <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-sidebar">
                        <i class="fas fa-search fa-fw"></i>
                    </button>
                </div>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <?php
            echo \hail812\adminlte\widgets\Menu::widget([
                'items' => [

                    // QC
                    [
                        'label' => Yii::t('app', 'Quality Control'),
                        'header' => true
                    ],
                    [
                        'label' => Yii::t('app', 'QC'),
                        'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-q text-red',
                        'items' => [
                            // [
                            //     'label' => Yii::t('app', 'Koji'),
                            //     'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-angles-right text-yellow',
                            //     'items' => [
                            //         ['label' => Yii::t('app', 'Create'), 'url' => ['/sauce/koji/create'], 'iconStyle' => 'fa', 'icon' => 'fa-regular fa-plus'],
                            //         ['label' => Yii::t('app', 'koji Record'), 'url' => ['/sauce/koji/index'], 'iconStyle' => 'fa', 'icon' => 'fa-regular fa-rectangle-list'],
                            //         ['label' => Yii::t('app', 'Koji Report'), 'url' => ['/sauce/koji/report'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-pie-chart'],
                            //         [
                            //             'label' => Yii::t('app', 'Configuration'),
                            //             'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cogs',
                            //             'items' => [
                            //                 ['label' => Yii::t('app', 'Tank'), 'url' => ['/sauce/koji/index'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-boxes-stacked'],
                            //                 ['label' => Yii::t('app', 'Type'), 'url' => ['/sauce/koji/index'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-hashtag'],
                            //             ]
                            //         ],
                            //     ]
                            // ],

                            [
                                'label' => Yii::t('app', 'Moromi'),
                                'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-angles-right text-yellow',
                                'items' => [
                                    ['label' => Yii::t('app', 'Moromi Record Table'), 'url' => ['/sauce/moromi/index'], 'iconStyle' => 'fa', 'icon' => 'fa-regular fa-list'],
                                    // ['label' => Yii::t('app', 'Moromi Record Card'), 'url' => ['/sauce/moromi/card'], 'iconStyle' => 'fa', 'icon' => 'fa-regular fa-rectangle-list'],
                                    ['label' => Yii::t('app', 'Report Moromi'), 'url' => ['/sauce/moromi/report'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-chart-simple'],
                                    [
                                        'label' => Yii::t('app', 'Configuration'),
                                        'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-angles-right text-blue',
                                        'items' => [
                                            ['label' => Yii::t('app', 'Tank Source'), 'url' => ['/sauce/tank-source/index'], 'iconStyle' => 'fa', 'icon' => 'fa-brands fa-glass-water'],
                                            ['label' => Yii::t('app', 'Tank Destination'), 'url' => ['/sauce/tank-destination/index'], 'iconStyle' => 'fa', 'icon' => 'fa-brands fa-glass-water'],
                                            ['label' => Yii::t('app', 'Moromi Memo List'), 'url' => ['/sauce/moromi-list-memo/index'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-list'],
                                        ]
                                    ],
                                ]
                            ],

                            [
                                'label' => Yii::t('app', 'Raw Sauce'),
                                'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-angles-right text-yellow',
                                'items' => [
                                    // ['label' => Yii::t('app', 'Raw Sauce Card'), 'url' => ['/sauce/raw-sauce/index2'], 'iconStyle' => 'fa', 'icon' => 'fa-regular fa-table-cells-large'],
                                    ['label' => Yii::t('app', 'Raw Sauce Table'), 'url' => ['/sauce/raw-sauce/index'], 'iconStyle' => 'fa', 'icon' => 'fa-regular fa-list'],
                                    ['label' => Yii::t('app', 'Report Select Type'), 'url' => ['/sauce/raw-sauce/report1'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-chart-simple'],
                                    ['label' => Yii::t('app', 'Report Select Tank'), 'url' => ['/sauce/raw-sauce/report2'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-chart-simple'],
                                    [
                                        'label' => Yii::t('app', 'Configuration'),
                                        'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-gears text-green',
                                        'items' => [
                                            ['label' => Yii::t('app', 'Tank'), 'url' => ['/sauce/tank/index'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-boxes-stacked'],
                                            ['label' => Yii::t('app', 'Type'), 'url' => ['/sauce/type/index'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-hashtag'],
                                        ]
                                    ],
                                ]
                            ],
                        ]
                    ],

                  
                    // EN
                    [
                        'label' => Yii::t('app', 'Engineering'),
                        'header' => true
                    ],
                    [
                        'label' => Yii::t('app', 'Request Repair'),
                        'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-angles-right text-yellow',
                        'items' => [
                            ['label' => Yii::t('app', 'Request Repair'), 'url' => ['/engineer/request-repair/index'], 'iconStyle' => 'fa', 'icon' => 'fa-regular fa-plus'],
                            [
                                'label' => Yii::t('app', 'Configuration'),
                                'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cogs',
                                'items' => [
                                    ['label' => Yii::t('app', 'Job Status'), 'url' => ['/engineer/job-status/index'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cog'],
                                    ['label' => Yii::t('app', 'Urgency'), 'url' => ['/general/urgency/index'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cog'],
                                    ['label' => Yii::t('app', 'Priority'), 'url' => ['/general/priority/index'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cog'],
                                ]
                            ],
                        ]
                    ],

                    [
                        'label' => Yii::t('app', 'Salers'),
                        'header' => true
                    ],
                    [
                        'label' => Yii::t('app', 'Sale Order System'),
                        'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-angles-right text-yellow',
                        'items' => [
                            ['label' => Yii::t('app', 'Sale Orders'), 'url' => ['/salers/saleorder/index'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-handshake-simple text-red'],
                            ['label' => Yii::t('app', 'Sales details'), 'url' => ['/salers/saleorder-item/index'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-list text-red'],
                            // ['label' => Yii::t('app', 'Report'), 'url' => ['/salers/sale-report/index'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-chart-column text-red'],
                            [
                                'label' => Yii::t('app', 'Configuration'),
                                'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cogs text-blue',
                                'items' => [
                                    ['label' => Yii::t('app', 'Sale Status'), 'url' => ['/salers/sale-status/index'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-chevron-right text-blue'],
                                    ['label' => Yii::t('app', 'Unit'), 'url' => ['/salers/sale-product-unit/index'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-chevron-right text-blue'],
                                    ['label' => Yii::t('app', 'Salers'), 'url' => ['/salers/salers/index'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-chevron-right text-blue'],
                                    ['label' => Yii::t('app', 'Product'), 'url' => ['/salers/sale-product/index'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-chevron-right text-blue'],
                                    ['label' => Yii::t('app', 'Payment'), 'url' => ['/salers/sale-payment/index'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-chevron-right text-blue'],
                                    ['label' => Yii::t('app', 'Customer'), 'url' => ['/salers/sale-customer/index'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-chevron-right text-blue'],
                                ]
                            ],
                        ]
                    ],
                    // [
                    //     'label' => Yii::t('app', 'Machine history'),
                    //     'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-angles-right text-yellow',
                    //     'items' => [
                    //         ['label' => Yii::t('app', 'Demo'), 'url' => ['/demo'], 'iconStyle' => 'fa', 'icon' => 'fa-regular fa-plus'],
                    //         [
                    //             'label' => Yii::t('app', 'Configuration'),
                    //             'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cogs',
                    //             'items' => [
                    //                 ['label' => Yii::t('app', 'Demo'), 'url' => ['/demo'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cog'],
                    //             ]
                    //         ],
                    //     ]
                    // ],

                    // AC
                    // [
                    //     'label' => Yii::t('app', 'Accounting'),
                    //     'header' => true
                    // ],
                    // [
                    //     'label' => Yii::t('app', 'Fixed Assets'),
                    //     'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-angles-right text-yellow',
                    //     'items' => [
                    //         ['label' => Yii::t('app', 'Demo'), 'url' => ['/demo'], 'iconStyle' => 'fa', 'icon' => 'fa-regular fa-plus'],
                    //         [
                    //             'label' => Yii::t('app', 'Configuration'),
                    //             'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cogs',
                    //             'items' => [
                    //                 ['label' => Yii::t('app', 'Demo'), 'url' => ['/demo'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cog'],
                    //             ]
                    //         ],
                    //     ]
                    // ],

                    // HR
                    // [
                    //     'label' => Yii::t('app', 'Human Resource'),
                    //     'header' => true
                    // ],
                    // [
                    //     'label' => Yii::t('app', 'Leave Online'),
                    //     'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-angles-right text-yellow',
                    //     'items' => [
                    //         ['label' => Yii::t('app', 'Demo'), 'url' => ['/demo'], 'iconStyle' => 'fa', 'icon' => 'fa-regular fa-plus'],
                    //         [
                    //             'label' => Yii::t('app', 'Configuration'),
                    //             'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cogs',
                    //             'items' => [
                    //                 ['label' => Yii::t('app', 'Demo'), 'url' => ['/demo'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cog'],
                    //             ]
                    //         ],
                    //     ]
                    // ],

                    // IT
                    // [
                    //     'label' => Yii::t('app', 'Information Technology'),
                    //     'header' => true
                    // ],
                    // [
                    //     'label' => Yii::t('app', 'Job Online'),
                    //     'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-angles-right text-yellow',
                    //     'items' => [
                    //         ['label' => Yii::t('app', 'Demo'), 'url' => ['/demo'], 'iconStyle' => 'fa', 'icon' => 'fa-regular fa-plus'],
                    //         [
                    //             'label' => Yii::t('app', 'Configuration'),
                    //             'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cogs',
                    //             'items' => [
                    //                 ['label' => Yii::t('app', 'Demo'), 'url' => ['/demo'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cog'],
                    //             ]
                    //         ],
                    //     ]
                    // ],
                    // [
                    //     'label' => Yii::t('app', 'IT Assets'),
                    //     'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-angles-right text-yellow',
                    //     'items' => [
                    //         ['label' => Yii::t('app', 'Demo'), 'url' => ['/demo'], 'iconStyle' => 'fa', 'icon' => 'fa-regular fa-plus'],
                    //         [
                    //             'label' => Yii::t('app', 'Configuration'),
                    //             'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cogs',
                    //             'items' => [
                    //                 ['label' => Yii::t('app', 'Demo'), 'url' => ['/demo'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cog'],
                    //             ]
                    //         ],
                    //     ]
                    // ],
                    // [
                    //     'label' => Yii::t('app', 'IT Store'),
                    //     'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-angles-right text-yellow',
                    //     'items' => [
                    //         ['label' => Yii::t('app', 'Demo'), 'url' => ['/demo'], 'iconStyle' => 'fa', 'icon' => 'fa-regular fa-plus'],
                    //         [
                    //             'label' => Yii::t('app', 'Configuration'),
                    //             'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cogs',
                    //             'items' => [
                    //                 ['label' => Yii::t('app', 'Demo'), 'url' => ['/demo'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cog'],
                    //             ]
                    //         ],
                    //     ]
                    // ],

                    // PD
                    // [
                    //     'label' => Yii::t('app', 'Production'),
                    //     'header' => true
                    // ],
                    // [
                    //     'label' => Yii::t('app', 'Check Sheet'),
                    //     'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-angles-right text-yellow',
                    //     'items' => [
                    //         ['label' => Yii::t('app', 'Demo'), 'url' => ['/demo'], 'iconStyle' => 'fa', 'icon' => 'fa-regular fa-plus'],
                    //         [
                    //             'label' => Yii::t('app', 'Configuration'),
                    //             'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cogs',
                    //             'items' => [
                    //                 ['label' => Yii::t('app', 'Demo'), 'url' => ['/demo'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cog'],
                    //             ]
                    //         ],
                    //     ]
                    // ],

                    // Systems
                    [
                        'label' => Yii::t('app', 'System'),
                        'header' => true
                    ],
                    [
                        'label' => Yii::t('app', 'Setings'),
                        'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cogs text-red',
                        'items' => [
                            ['label' => Yii::t('app', 'User'), 'url' => ['/user/index'], 'iconStyle' => 'fa', 'icon' => 'fa-regular fa-user-plus'],
                            ['label' => Yii::t('app', 'Profile'), 'url' => ['/user/profile'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-user-edit'],
                            ['label' => Yii::t('app', 'Auto Number'), 'url' => ['/auto-number/index'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-code'],
                            // [
                            //     'label' => Yii::t('app', 'Configuration'),
                            //     'iconStyle' => 'fa', 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-cogs',
                            //     'items' => [
                            //         ['label' => Yii::t('app', 'Profile'), 'url' => ['/user/profile'], 'iconStyle' => 'fa', 'icon' => 'fa-solid fa-user-edit'],
                            //     ]
                            // ],
                        ]
                    ],

                ],
            ]);
            ?>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>