<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('discounts', function (Blueprint $table) {
            $table->string('code', 50)->primary();
            $table->decimal('price_reduction', 10, 0)->nullable();
            $table->integer('percentage_discount')->nullable();
            $table->decimal('minimum_order_amount', 10, 0)->nullable();
            $table->integer('quantity');
            $table->dateTime('start_at', precision: 0)->nullable();
            $table->dateTime('end_at', precision: 0)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('discounts');
    }
};
