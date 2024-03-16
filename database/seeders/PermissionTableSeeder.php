<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;

class PermissionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $permissions = [
            ['staff_list', 'staffs'],
            ['staff_create', 'staffs'],
            ['staff_edit', 'staffs'],
            ['staff_delete', 'staffs'],
            ['role_list', 'role_permissions'],
            ['role_create', 'role_permissions'],
            ['role_edit', 'role_permissions'],
            ['role_delete', 'role_permissions'],
            ['blog_category_list', 'blog_category'],
            ['blog_category_create', 'blog_category'],
            ['blog_category_edit', 'blog_category'],
            ['blog_category_delete', 'blog_category'],
            ['blog_list', 'blog'],
            ['blog_create', 'blog'],
            ['blog_edit', 'blog'],
            ['blog_delete', 'blog'],
         ];
      
         foreach ($permissions as $permission) {
              Permission::create([
                'name' => $permission[0],
                'type' => $permission[1],
            ]);
         }
    }
}
