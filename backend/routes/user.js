const express = require('express')
const router = express.Router();
var pool = require('./mysqlConnector')
const asyncMiddleware = require('./asyncMiddleware')
const nodemailer = require("nodemailer");
const func = require('./functions')

var bodyParser = require('body-parser')
router.use(bodyParser.urlencoded({ extended: true }))
router.use(bodyParser.json())
const upload = require('express-fileupload')
const fs = require('fs')
router.use(upload())

let today = new Date().toISOString().slice(0, 10)
const time = new Date().toISOString().slice(0, 19).replace('T', ' ')
const transporter = nodemailer.createTransport({ host: "smtpout.secureserver.net", port: 465, secure: true, auth: { user: 'contactus@thetrueloans.com', pass: 'contactus@123',  debug: true }, tls:{ rejectUnauthorized: false, secureProtocol: "TLSv1_method" } });

router.get('/property',  asyncMiddleware( async(req, res) => {
    let sql = `SELECT a.id, a.name, a.url, a.type, a.tags, a.amenities, a.bedroom, a.status, a.banner, a.builder, a.price, a.discount, a.area, a.updated_at, b.fileURL, b.alt, c.name as builderName, c.url as builderUrl FROM property as a left JOIN media as b on b.id = a.banner left JOIN builders as c on c.id = a.builder ORDER BY id DESC`
    pool.query(sql, (err, results) => {
        try{
            if(err){ throw err }
            if(results){ res.send({ data: results }); }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.get('/propertyFilters',  asyncMiddleware( async(req, res) => {
    let sql =   `SELECT id as value, type, name as text FROM basics WHERE type = 'Property Type' OR type = 'Property Tags' OR type = 'Amenities';
    SELECT id as value, name as text FROM builders WHERE status = 1;
    SELECT DISTINCT bedroom, price, bathroom, area FROM property;
    SELECT MIN(price) as minPrice FROM property;
    SELECT MAX(price) as maxPrice FROM property;`
    pool.query(sql, [1,2,3,4,5], (err, results) => {
        try{
            if(err){ throw err }
            if(results){ res.send({ 
                basic: results[0],
                builders: results[1],
                dist: results[2],
                minPrice: results[3][0].minPrice,
                maxPrice: results[4][0].maxPrice,
            });
        }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.get('/singleProperty/:url',  asyncMiddleware( async(req, res) => {
    let sql = `SELECT a.*, b.*, m.fileURL as bannerImage, m.alt as bannerAlt, c.name as builderName, c.url as builderUrl FROM property as a left JOIN propdetails as b on b.propertyId = a.id left JOIN media as m on m.id = a.banner left JOIN builders as c on c.id = a.builder WHERE a.url = '${req.params.url}';
    SELECT a.name, a.banner, a.url, a.price, a.discount, m.fileURL as bannerImage, m.alt as bannerAlt from property as a left JOIN media as m on m.id = a.banner ORDER BY RAND () LIMIT 10;`
    pool.query(sql, [1,2], async(err, results) => {
        try{
            if(err){ throw err }
            if(results && results[0][0]){
                const amenitiesImageArray= await func.getAmenitiesImages(JSON.parse(results[0][0].amenities))
                results[0][0].amenitiesImageArray = JSON.stringify(amenitiesImageArray)
                const tagsArray= await func.getTags(JSON.parse(results[0][0].tags))
                results[0][0].tagsArray = JSON.stringify(tagsArray)
                const brochureImageArray= await func.getArrayImage(JSON.parse(results[0][0].brochure))
                results[0][0].brochureImageArray = brochureImageArray
                const picsImageArray= await func.getArrayImage(JSON.parse(results[0][0].pics))
                results[0][0].picsImageArray = picsImageArray
                var xx = JSON.parse(results[0][0].blocks)
                var blocksPic = []
                for (let i = 0; i < xx.length; i++) {
                    blocksPic.push(xx[i].pic)
                }
                const blocksImageArray= await func.getArrayImage(blocksPic)
                for (let i = 0; i < xx.length; i++) {
                    xx[i]['image'] = blocksImageArray.filter(el=>el.id == xx[i].pic )[0].fileURL;
                    xx[i]['alt'] = blocksImageArray.filter(el=>el.id == xx[i].pic )[0].alt
                }
                results[0][0].blocks = JSON.stringify(xx)
                res.send({ 
                    data: results[0][0],
                    suggestProp: results[1]
                }); 
            }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.get('/suggestBlogs',  asyncMiddleware( async(req, res) => {
    let sql = `SELECT a.id, a.title, a.url, a.coverImg, b.fileURL FROM blogs as a left join media as b on b.id = a.coverImg ORDER BY id DESC LIMIT 8`
    pool.query(sql, (err, results) => {
        try{
            if(err){ throw err }
            if(results){ res.send({ data: results }); }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.post('/subscribe', asyncMiddleware( async(req, res) => {
    let post= {
        'name':                 req.body.name,
        'email':                req.body.email,
        "created_at":           time,
        "updated_at":           time,
    }
    let sql = `INSERT INTO subscribe SET ?`
    pool.query(sql, post, async(err, results) => {
        try{
            if(err.code =='ER_DUP_ENTRY'){
                res.send({ success: false, message: "Email id already subscribed" })
            }
            if(results){
                res.send({ success: true, message: 'Subscription successfuly' });
            }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.get('/getHomeBlogs',  asyncMiddleware( async(req, res) => {
    let sql = `SELECT a.id, a.name, a.url, a.type, a.banner, a.price, a.discount, a.shortdesc, b.fileURL, b.alt FROM property as a 
    left JOIN media as b on b.id = a.banner ORDER BY id DESC;
    SELECT id, name from basics WHERE type= 'Property Type';`
    pool.query(sql, [1,2], (err, results) => {
        try{
            if(err){ throw err }
            if(results){ res.send({ property: results[0], propTypeOptions: results[1] }); }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.post('/addLeads', asyncMiddleware( async(req, res) => {
    let post= {
        'name':                 req.body.name,
        'email':                req.body.email,
        'phone':                req.body.phone,
        'message':              req.body.message,
        'url':                  req.body.url,
        'status':               1,
        "created_at":           time,
        "updated_at":           time,
    }
    let sql = `INSERT INTO leads SET ?`
    pool.query(sql, post, async(err, results) => {
        try{
            if(err){ throw err }
            if(results){ res.send({ success: true, message: 'Thanks for showing interest' }); }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))


module.exports = router;