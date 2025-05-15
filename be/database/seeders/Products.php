<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;

class Products extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('products')->insert([
            'name' => 'Bánh Kem Nhân Bắp',
            'price' => '229000',
            'image' => 'Banh-Kem-Bap-Kieu-5.jpg',
            'quantity' => '3',
            'description' => 'Hương vị thơm béo của bắp non quyện cùng lớp kem mềm mịn, mang đến cảm giác ngọt ngào, tươi mới và đầy hấp dẫn.',
            'created_at' => now(),
            'updated_at' => now(),
            "category_code" => '1'
        ]);
        DB::table('products')->insert([
            'name' => 'Bánh Kem Bắp Kiểu 4',
            'price' => '229000',
            'image' => 'Banh-Kem-Bap-Kieu-4.jpg',
            'quantity' => '3',
            'description' => 'Hương vị thơm béo của bắp non quyện cùng lớp kem mềm mịn, mang đến cảm giác ngọt ngào, tươi mới và đầy hấp dẫn.',
            'created_at' => now(),
            'updated_at' => now(),
            "category_code" => '1'
        ]);
        DB::table('products')->insert([
            'name' => 'Bánh Kem Bắp Kiểu 3',
            'price' => '229000',
            'image' => 'Banh-Kem-Bap-Kieu-3.jpg',
            'quantity' => '3',
            'description' => 'Hương vị thơm béo của bắp non quyện cùng lớp kem mềm mịn, mang đến cảm giác ngọt ngào, tươi mới và đầy hấp dẫn.',
            'created_at' => now(),
            'updated_at' => now(),
            "category_code" => '1'
        ]);
        DB::table('products')->insert([
            'name' => 'Bánh Kem Bắp kiểu 2',
            'price' => '229000',
            'image' => 'Banh-Kem-Bap-Kieu-2.jpg',
            'quantity' => '3',
            'description' => 'Hương vị thơm béo của bắp non quyện cùng lớp kem mềm mịn, mang đến cảm giác ngọt ngào, tươi mới và đầy hấp dẫn.',
            'created_at' => now(),
            'updated_at' => now(),
            "category_code" => '1'
        ]);
        DB::table('products')->insert([
            'name' => 'Bánh Kem Nhân Thơm ',
            'price' => '329000',
            'image' => 'Bk-Thom.jpg',
            'quantity' => '3',
            'description' => 'Bánh kem thơm mềm mịn, hòa quyện lớp kem béo nhẹ cùng vị ngọt thanh từ thơm tươi. Từng muỗng bánh tan chảy, mang đến cảm giác dịu dàng, tươi mát và đầy hấp dẫn như một ngày hè ngọt ngào.',
            'created_at' => now(),
            'updated_at' => now(),
            "category_code" => '1'
        ]);
        DB::table('products')->insert([
            'name' => 'Bánh Kem Nhân Cam',
            'price' => '329000',
            'image' => 'Banh-Kem-Cam-20-1.jpg',
            'quantity' => '3',
            'description' => 'Bánh kem thơm mềm mịn, hòa quyện lớp kem béo nhẹ cùng vị ngọt thanh từ thơm tươi. Từng muỗng bánh tan chảy, mang đến cảm giác dịu dàng, tươi mát và đầy hấp dẫn như một ngày hè ngọt ngào.',
            'created_at' => now(),
            'updated_at' => now(),
            "category_code" => '1'
        ]);
        DB::table('products')->insert([
            'name' => 'Bánh Kem Nhân Thơm',
            'price' => '329000',
            'image' => 'Banh-Kem-Thom-10-1.jpg',
            'quantity' => '3',
            'description' => 'Bánh kem thơm mềm mịn, hòa quyện lớp kem béo nhẹ cùng vị ngọt thanh từ thơm tươi. Từng muỗng bánh tan chảy, mang đến cảm giác dịu dàng, tươi mát và đầy hấp dẫn như một ngày hè ngọt ngào.',
            'created_at' => now(),
            'updated_at' => now(),
            "category_code" => '1'
        ]);
        DB::table('products')->insert([
            'name' => 'Bánh Kem Nhân Thơm',
            'price' => '229000',
            'image' => 'Banh-Kem-Thom-1.jpg',
            'quantity' => '3',
            'description' => 'Bánh kem thơm mềm mịn, hòa quyện lớp kem béo nhẹ cùng vị ngọt thanh từ thơm tươi. Từng muỗng bánh tan chảy, mang đến cảm giác dịu dàng, tươi mát và đầy hấp dẫn như một ngày hè ngọt ngào.',
            'created_at' => now(),
            'updated_at' => now(),
            "category_code" => '1'
        ]);
        DB::table('products')->insert([
            'name' => 'Bánh Kem Nhân Dâu',
            'price' => '229000',
            'image' => 'Bk-Dau.jpg',
            'quantity' => '3',
            'description' => 'Bánh kem dâu mang hương vị ngọt ngào, tươi mát từ những quả dâu chín mọng. Lớp kem mịn hoà quyện cùng cốt bánh mềm xốp, điểm xuyết với những lát dâu tươi mọng nước, mang đến cảm giác nhẹ nhàng và đầy hấp dẫn.',
            'created_at' => now(),
            'updated_at' => now(),
            "category_code" => '1'
        ]);
        DB::table('products')->insert([
            'name' => 'Bánh Kem Tiramisu',
            'price' => '359000',
            'image' => 'Banh-Kem-Tira-2.jpg',
            'quantity' => '3',
            'description' => 'Bánh Tiramisu là sự kết hợp tinh tế giữa lớp bánh mềm thấm cà phê đậm đà và kem mascarpone béo mịn, phủ trên cùng là lớp bột cacao thơm lừng. Vị ngọt nhẹ hòa quyện cùng chút đắng nhẹ tạo nên trải nghiệm tuyệt vời cho vị giác.',
            'created_at' => now(),
            'updated_at' => now(),
            "category_code" => '1'
        ]);
        DB::table('products')->insert([
            'name' => 'Bánh Kem Tiramisu',
            'price' => '359000',
            'image' => 'Banh-Kem-Tira-Kieu-2.jpg',
            'quantity' => '3',
            'description' => 'Bánh Tiramisu là sự kết hợp tinh tế giữa lớp bánh mềm thấm cà phê đậm đà và kem mascarpone béo mịn, phủ trên cùng là lớp bột cacao thơm lừng. Vị ngọt nhẹ hòa quyện cùng chút đắng nhẹ tạo nên trải nghiệm tuyệt vời cho vị giác.',
            'created_at' => now(),
            'updated_at' => now(),
            "category_code" => '1'
        ]);
        DB::table('products')->insert([
            'name' => 'Bánh Kem Tiramisu',
            'price' => '229000',
            'image' => 'Banh-Kem-Tira-Kieu-3.jpg',
            'quantity' => '3',
            'description' => 'Bánh Tiramisu là sự kết hợp tinh tế giữa lớp bánh mềm thấm cà phê đậm đà và kem mascarpone béo mịn, phủ trên cùng là lớp bột cacao thơm lừng. Vị ngọt nhẹ hòa quyện cùng chút đắng nhẹ tạo nên trải nghiệm tuyệt vời cho vị giác.',
            'created_at' => now(),
            'updated_at' => now(),
            "category_code" => '1'
        ]);
        DB::table('products')->insert([
            'name' => 'Bánh Quy Hạnh Nhân Savoure',
            'price' => '49000',
            'image' => '4-Version1.jpg',
            'quantity' => '50',
            'description' => 'Bánh quy hạnh nhân Savouse giòn tan, thơm lừng với hạnh nhân rang bùi béo, ngọt nhẹ. Mỗi chiếc bánh mang đến hương vị tinh tế, dễ chịu, là sự kết hợp hoàn hảo giữa vị ngọt và độ giòn, thích hợp cho những buổi trà chiều thư giãn.',
            'created_at' => now(),
            'updated_at' => now(),
            "category_code" => '6'
        ]);
        DB::table('products')->insert([
            'name' => 'Bánh Macaron Mini',
            'price' => '59000',
            'image' => '3-Version1.jpg',
            'quantity' => '50',
            'description' => 'Bánh quy Macaron mềm mịn, xốp nhẹ với lớp vỏ giòn tan, bên trong là lớp nhân kem bơ ngọt ngào. Sự kết hợp hoàn hảo giữa các hương vị trái cây, socola hoặc vani mang đến trải nghiệm tuyệt vời cho mọi tín đồ yêu thích sự thanh nhẹ và tinh tế.',
            'created_at' => now(),
            'updated_at' => now(),
            "category_code" => '6'
        ]);
        DB::table('products')->insert([
            'name' => 'Bánh Quy Trái Cây',
            'price' => '69000',
            'image' => '5.jpg',
            'quantity' => '50',
            'description' => 'Bánh quy trái cây có hương vị ngọt ngào, tươi mát từ các loại trái cây như dâu, cam, chanh, hay nho khô, kết hợp với lớp vỏ giòn tan. Sự kết hợp giữa trái cây tự nhiên và vị ngọt nhẹ tạo nên một món ăn thú vị, thơm ngon',
            'created_at' => now(),
            'updated_at' => now(),
            "category_code" => '6'
        ]);
        DB::table('products')->insert([
            'name' => 'Bánh Quy Cà Phê',
            'price' => '49000',
            'image' => '1.jpg',
            'quantity' => '50',
            'description' => 'Bánh quy cà phê là sự kết hợp hoàn hảo giữa hương vị cà phê đậm đà và lớp bánh quy giòn tan. Vị cà phê thơm lừng hòa quyện với độ ngọt nhẹ, tạo nên một món ăn vặt lý tưởng cho những ai yêu thích hương vị đặc trưng của cà phê.',
            'created_at' => now(),
            'updated_at' => now(),
            "category_code" => '6'
        ]);
        DB::table('products')->insert([
            'name' => 'Bánh Quy Socola Hạnh Nhân',
            'price' => '79000',
            'image' => '6-Version1.jpg',
            'quantity' => '50',
            'description' => 'Bánh quy socola hạnh nhân là sự kết hợp hoàn hảo giữa vị ngọt dịu của socola và hương thơm đặc trưng của hạnh nhân. Lớp vỏ giòn tan, bên trong mềm mịn, khiến mỗi miếng bánh đều đậm đà và hấp dẫn. Đây là món ăn lý tưởng cho những ai yêu thích sự hòa quyện giữa socola và hạnh nhân trong từng hương vị.',
            'created_at' => now(),
            'updated_at' => now(),
            "category_code" => '6'
        ]);
        DB::table('products')->insert([
            'name' => 'Bánh Quy Dừa',
            'price' => '49000',
            'image' => '2-Version2.jpg',
            'quantity' => '50',
            'description' => 'Bánh quy dừa mang đến hương vị ngọt ngào và thơm mát từ dừa tươi, với lớp vỏ giòn rụm và mùi thơm đặc trưng. Mỗi miếng bánh là sự kết hợp hoàn hảo giữa độ giòn của bánh và vị béo ngậy của dừa, làm hài lòng những tín đồ yêu thích hương vị tự nhiên và thanh nhẹ.',
            'created_at' => now(),
            'updated_at' => now(),
            "category_code" => '6'
        ]);
        DB::table('products')->insert([
            'name' => 'Kem Vani',
            'price' => '19000',
            'image' => 'Kem-Vani.jpg',
            'quantity' => '50',
            'description' => 'Kem vani mềm mịn, ngọt ngào với hương vị tự nhiên từ vani. Mỗi muỗng kem mang lại cảm giác mát lạnh, thơm ngon và dễ chịu, hòa quyện hoàn hảo giữa sự béo ngậy và vị ngọt dịu dàng. Đây là món tráng miệng lý tưởng cho mọi lứa tuổi, mang đến sự thư giãn và hài lòng cho những tín đồ yêu thích sự đơn giản nhưng tinh tế.',
            'created_at' => now(),
            'updated_at' => now(),
            "category_code" => '5'
        ]);
        DB::table('products')->insert([
            'name' => 'Kem Dâu',
            'price' => '19000',
            'image' => 'Kem-Dau.jpg',
            'quantity' => '50',
            'description' => 'Kem dâu ngọt ngào và tươi mát, với hương vị thơm lừng của dâu tươi. Mỗi muỗng kem là sự kết hợp hoàn hảo giữa vị ngọt nhẹ và chua thanh, mang đến cảm giác sảng khoái, dễ chịu. Kem dâu mềm mịn, phù hợp với mọi dịp, là sự lựa chọn tuyệt vời cho những ai yêu thích sự tươi mới và ngọt ngào từ trái dâu tự nhiên.',
            'created_at' => now(),
            'updated_at' => now(),
            "category_code" => '5'
        ]);
    }
}
