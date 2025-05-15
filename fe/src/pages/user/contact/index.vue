<template>
    <main class="contact-section">
        <h1>Liên Hệ Với Chúng Tôi</h1>
    
        <div class="contact-container">
            <!-- Form liên hệ -->
            <form class="contact-form">
                <label for="name">Họ và tên:</label>
                <input type="text" id="name" name="name" required>
    
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
    
                <label for="message">Nội dung:</label>
                <textarea id="message" name="message" rows="5" required></textarea>
    
                <button type="submit">Gửi liên hệ</button>
            </form>
    
            <!-- Thông tin hỗ trợ -->
            <div class="contact-info">
                <h2>Thông Tin Hỗ Trợ</h2>
                <p><strong>Địa chỉ:</strong> 123 Đường ABC, Quận 12, TP.HCM</p>
                <p><strong>Hotline:</strong> 0123 456 789</p>
                <p><strong>Email:</strong> support@gmail.com</p>
                <p><strong>Thời gian làm việc:</strong> 8h00 - 20h00 (T2 - CN)</p>
                <div class="map-container">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.734812709657!2d106.62965901526012!3d10.830692792286254!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752963f0e65d63%3A0x7b6eaef6c2a3cbb7!2zUXVhbiAxMiwgSOG7kyBCw6xuaCwgVMOibiBUaOG6pXAgQ2jDrSBNaW5oLCBI4buTIENow60gTWluaCwgVFAuIEhD!5e0!3m2!1svi!2s!4v1618033988749"
                        width="100%" height="250" style="border:0; border-radius: 8px; margin-top: 15px;"
                        allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
                    </iframe>
                </div>
            </div>
        </div>
    </main>
</template>