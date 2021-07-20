<template>
    <div>
        <h1 class="heading">Connect With us</h1>
        <div class="q-pa-md row">
            <div class="col-sm-6">
                <div class="col-sm-6">
                    <p><strong>Address:</strong> 1172, Sector- 45, Gurgaon, Haryana</p>
                    <p><strong>Phone: </strong><a class="noBorder" href="tel:8424003840"> +91 -8424 003 840</a> / <a class="noBorder" href="tel:+91-9354811331"> +91-9354 811 331</a> / <a href="tel:+91-9695871040"> +91-9695871040</a></p>
                    <p><strong>Email: </strong><a class="noBorder" href="mailto:amit@amitkk.com">amit@amitkk.com</a> / <a class="noBorder" href="mailto:amit.khare588@gmail.com">amit.khare588@gmail.com</a></p>

                    <h3>Follow Us</h3>
                    <ul class="social">
                        <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href=""><i class="fab fa-linkedin-in"></i></a></li>
                        <li><a href=""><i class="fab fa-twitter"></i></a></li>
                        <li><a href=""><i class="fab fa-instagram"></i></a></li>
                        <li><a href=""><i class="fab fa-instagram"></i></a></li>
                    </ul>
                    <div class="map mt-3">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14032.3748910899!2d77.0659528!3d28.446591!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xc614510fd1f3895!2sAmitkk%20-%20Web%20Design%20%26%20Development%2C%20Digital%20Marketing!5e0!3m2!1sen!2sin!4v1598466072979!5m2!1sen!2sin"></iframe>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <ContactForm title="Connect with us" para="We keep your details safe and secure with us." />
            </div>
        </div>
    </div>
</template>
<script>
import ContactForm from 'components/ContactForm'

export default {
    components: { ContactForm },
};
</script>
<style>
    .map iframe {
        width: 100%;
        height: 100%;
        min-height: 300px;
        border: none;
    }
</style>
