var mysql = require('mysql')
const jwt = require('jsonwebtoken')
const {decode} = require("jsonwebtoken");
const nodemailer = require("nodemailer");
var pool = require('./mysqlConnector')
let today = new Date().toISOString().slice(0, 10)
const time = new Date().toISOString().slice(0, 19).replace('T', ' ')
const transporter = nodemailer.createTransport({ host: "smtpout.secureserver.net", port: 465, secure: true, auth: { user: 'contactus@thetrueloans.com', pass: 'contactus@123',  debug: true }, tls:{ rejectUnauthorized: false, secureProtocol: "TLSv1_method" } });
const fs = require('fs')
// const storage2 = './public/images'
const storage = '../../www/reales/public/images'

function printError(mesg){ console.log('mesg', mesg) }

function getMeta(id) {
    return new Promise((resolve, reject) => {
        let sql = `SELECT id, url, title, description, updated_at FROM metas WHERE id = ${id}`
        pool.query(sql, (err, results) => {
            try{
                if(err){ throw err }
                if(results){ resolve(results[0]) }
            }catch(e){ logError(e);return; }
        });
    });
}

function getBasic(id) {
    return new Promise((resolve, reject) => {
        let sql = `SELECT a.id, a.type, a.name, a.tab1, a.tab2, a.tab3, a.updated_at, b.name as tab1Name, c.name as tab2Name, d.name as tab3Name, e.id as mediaId, e.image as mediaImage
                FROM basics as a left join basics as b on b.id = a.tab1 left join basics as c on c.id = a.tab2 left join basics as d on d.id = a.tab3 left join media as e on e.id = a.tab1 WHERE a.id = ${id};`
        pool.query(sql, (err, results) => {
            try{
                if(err){ throw err }
                if(results){ resolve(results[0]) }
            }catch(e){ logError(e);return; }
        });
    });
}

function getBlog(id) {
    return new Promise((resolve, reject) => {
        let sql = `SELECT id, title, url, coverImg, category, tag, content, updated_at FROM blogs WHERE id = ${id}`
        pool.query(sql, (err, results) => {
            try{
                if(err){ throw err }
                if(results){ resolve(results[0]) }
            }catch(e){ logError(e);return; }
        });
    });
}

function uploadImage(file, folder, rename){
    return new Promise((resolve, reject) => {
        if(rename){
            var filename = Date.now() + '-' + file.name;
        }else{
            var filename = file.name
        }
        file.mv(storage+folder+filename, function(err){ if(err){ logError(err) } })
        let post= {
            'image' :                       filename,
            'fileURL' :                     folder+filename,
            "created_at":                   time,
            "updated_at":                   time,
        }
        let sql = `INSERT INTO media SET ?`
        pool.query(sql, post, (err, results) => {
            try{
                if(err){ throw err }
                if(results){ resolve( results.insertId ) }
            }catch(e){ logError(e); return; }
        })
    });
}

function uploadImageArray(array, folder, rename){
    return new Promise((resolve, reject) => {
        var values = [];
        for(var i=0; i< array.length; i++){
            var file = array[i]
            if(rename){
                var filename = Date.now() + '-' + file.name;
            }else{
                var filename = file.name
            }
            file.mv(storage+folder+filename, function(err){ if(err){ logError(err) } })
            values.push([ filename, folder+filename, time,  time ]);
            if(values.length == array.length){
                pool.query(`INSERT INTO media (image, fileURL, created_at, updated_at) VALUES ?`, [values], async(err, results) => {
                    try{
                        if(err){ throw err }
                        if(results){
                            let sql2 = `SELECT id, image FROM media ORDER BY id DESC LIMIT ${results.affectedRows};`
                            pool.query(sql2, async(err2, results2) => {
                                try{
                                    if(err2){ throw err2 }
                                    if(results2){ 
                                        var id = []
                                        for (let j = 0; j < results2.length; j++) { id.push( results2[j].id ) }
                                        resolve( id )
                                    }
                                }catch(e){ logError(e); res.status(500); return; }
                            })
                        }
                    }catch(e){ logError(e); res.status(500); return; }
                })
            }
        }
    })
}

function uploadDeleteImage(file, folder, id, image, rename){
    return new Promise((resolve, reject) => {
        if(rename){
            var filename = Date.now() + '-' + file.name;
        }else{
            var filename = file.name
        }
        file.mv(storage+folder+filename, function(err){ 
            if(err){ logError(err) } 
        })
        // file.mv(storage2+folder+filename, function(err){ 
        //     if(err){ logError(err) }  
        // })
        let post= {
            'image' :                       filename,
            'fileURL' :                     folder+filename,
            "updated_at":                   time,
        }
        let sql = `UPDATE media SET ? WHERE id = ${id}`;
        pool.query(sql, post, (err, results) => {
            try{
                if(err){ throw err }
                if(results){ 
                    if (fs.existsSync(storage+folder+image)) { fs.unlinkSync(storage+folder+image) }
                    resolve(results.insertId)
                }
            }catch(e){ logError(e); return; }
        })
    });
}

function getProperty(id) {
    return new Promise((resolve, reject) => {
        let sql = `SELECT id, name, url, price, discount, status, units, updated_at FROM property WHERE id = ${id}`
        pool.query(sql, (err, results) => {
            try{
                if(err){ throw err }
                if(results){ resolve(results[0]) }
            }catch(e){ logError(e);return; }
        });
    });
}

function getFullProperty(id) {
    return new Promise((resolve, reject) => {
        let sql = `SELECT a.*, b.* FROM property as a left join propDetails as b on b.propertyId = a.id WHERE a.id = '${id}'`
        pool.query(sql, async(err, results) => {
            try{
                if(err){ throw err }
                if(results){
                    const bannerPic = await getSingleImage(results[0].banner); results[0].bannerPic = bannerPic
                    const pics = await getArrayImage(JSON.parse(results[0].pics));
                    results[0].picsArray = pics
                    const brochureArray = await getArrayImage(JSON.parse(results[0].brochure)); results[0].brochureArray = brochureArray
                    var id = []; 
                    const blocks = JSON.parse(results[0].blocks)
                    for (let i = 0; i < blocks.length; i++) { id.push(blocks[i].pic) }
                    const blocksArray = await getArrayImage(id); results[0].blocksArray = blocksArray
                    resolve({ success: true, data: results[0] }); 
                }
            }catch(e){ logError(e);return; }
        });
    });
}

function getSingleImage(id) {
    return new Promise((resolve, reject) => {
        let sql = `SELECT id, image, fileURL FROM media WHERE id = ${id}`
        pool.query(sql, (err, results) => {
            try{
                if(err){ throw err }
                if(results){ resolve(results[0]) }
            }catch(e){ logError(e);return; }
        });
    });
}

function getArrayImage(id) {
    return new Promise((resolve, reject) => {
        let sql = `SELECT id, alt, image, fileURL FROM media WHERE id IN(${id})`
        pool.query(sql, (err, results) => {
            try{
                if(err){ throw err }
                if(results){ resolve(results) }
            }catch(e){ logError(e);return; }
        });
    });
}

function replaceMedia(file, folder, rename, mediaId){
    return new Promise((resolve, reject) => {
        if (fs.existsSync(storage+folder+mediaId.image)) { fs.unlinkSync(storage+folder+mediaId.image) }
        if(rename){
            var filename = Date.now() + '-' + file.name;
        }else{
            var filename = file.name
        }
        file.mv(storage+folder+filename, function(err){ if(err){ logError(err) } })
        let post= {
            'image' :                       filename,
            'fileURL' :                     folder+filename,
            "created_at":                   time,
            "updated_at":                   time,
        }
        let sql = `UPDATE media SET ? WHERE id = ${mediaId.id}`;
        pool.query(sql, post, (err, results) => {
            try{
                if(err){ throw err }
                if(results){ resolve( results.insertId ) }
            }catch(e){ logError(e); return; }
        })
    });
}

function replaceMediaArray(array, folder, rename, mediaId){
    return new Promise((resolve, reject) => {
        var values = [];
        for(var i=0; i< array.length; i++){
            var file = array[i]
            if(rename){
                var filename = Date.now() + '-' + file.name;
            }else{
                var filename = file.name
            }

            let sql = `UPDATE tablename
                        SET image = ${fileArray[i].image}, fileURL = ${folder+fileArray[i].image} WHEN id = ${fileArray[i].id},`

            file.mv(storage+folder+filename, function(err){ if(err){ logError(err) } })
            values.push([ filename, folder+filename, time,  time ]);
            if(values.length == array.length){
                pool.query(`INSERT INTO media (image, fileURL, created_at, updated_at) VALUES ?`, [values], async(err, results) => {
                    try{
                        if(err){ throw err }
                        if(results){
                            let sql2 = `SELECT id, image FROM media ORDER BY id DESC LIMIT ${results.affectedRows};`
                            pool.query(sql2, async(err2, results2) => {
                                try{
                                    if(err2){ throw err2 }
                                    if(results2){ 
                                        var id = []
                                        for (let j = 0; j < results2.length; j++) { id.push( results2[j].id ) }
                                        resolve( id )
                                    }
                                }catch(e){ logError(e); res.status(500); return; }
                            })
                        }
                    }catch(e){ logError(e); res.status(500); return; }
                })
            }
        }
    })
}

function updatePic(id, array) {
    return new Promise((resolve, reject) => {
        const post={
            "pics" :                JSON.stringify(array),
            "updated_at":           time,
        }
        let sql = `UPDATE property SET ? WHERE id = ${id}`;
        pool.query(sql, post, (err, results) => {
            try{
                if(err){ throw err }
                if(results){ resolve('Pics updated successfuly') }
            }catch(e){ logError(e);return; }
        });
    });
}

function updateBrochure(id, array) {
    return new Promise((resolve, reject) => {
        const post={
            "brochure" :                JSON.stringify(array),
            "updated_at":               time,
        }
        let sql = `UPDATE propdetails SET ? WHERE propertyId = ${id}`;
        pool.query(sql, post, (err, results) => {
            try{
                if(err){ throw err }
                if(results){ resolve('Brochure updated successfuly') }
            }catch(e){ logError(e);return; }
        });
    });
}

function getBuilder(id) {
    return new Promise((resolve, reject) => {
        let sql = `SELECT a.*, b.image as logoImage, b.fileURL as logofileURL, c.image as brochureImage, c.fileURL as brochurefileURL FROM builders as a left join media as b on b.id = a.logo left join media as c on c.id = a.brochure WHERE a.id = ${id}`
        pool.query(sql, (err, results) => {
            try{
                if(err){ throw err }
                if(results){ resolve(results[0]) }
            }catch(e){ logError(e);return; }
        });
    });
}

function getAmenitiesImages(array) {
    return new Promise((resolve, reject) => {
        let sql = `SELECT a.id, a.name, a.tab1, b.fileURL, b.alt FROM basics as a LEFT JOIN media as b on b.id = a.tab1 WHERE a.id IN(${array})`
        pool.query(sql, (err, results) => {
            try{
                if(err){ throw err }
                if(results){ resolve(results) }
            }catch(e){ logError(e);return; }
        });
    });
}

function getTags(array) {
    return new Promise((resolve, reject) => {
        let sql = `SELECT name FROM basics WHERE id IN(${array})`
        pool.query(sql, (err, results) => {
            try{
                if(err){ throw err }
                if(results){ resolve(results) }
            }catch(e){ logError(e);return; }
        });
    });
}

function blogMetaData(id) {
    return new Promise((resolve, reject) => {
        let sql =   `SELECT id, title, url FROM blogs ORDER by RAND() LIMIT 10;
                    SELECT type, name, tab1 FROM basics WHERE type = 'Category' OR type = 'Tag';
                    SELECT id, blogId, c_order, commentId, user, email, comment, updated_at FROM comments WHERE blogId = '${id}' AND status='1' ORDER BY id DESC;`
        pool.query(sql, [1, 2, 3], (err, results) => {
            try{
                if(err){ throw err }
                if(results){ resolve(results ) }
            }catch(e){ logError(e); return; }
        });
    });
}

function suggestBlogs() {
    return new Promise((resolve, reject) => {
        let sql = `SELECT a.id, a.title, a.url, a.coverImg, b.fileURL, b.alt FROM blogs as a left join media as b on b.id = a.coverImg ORDER by id Desc LIMIT 6;`
      pool.query(sql, (err, rows) => {
        try{
            if(err){ throw err }
            if(rows){ resolve(rows ) }
        }catch(e){ logError(e); return; }
      });
    });
}

function getMedia(id) {
    return new Promise((resolve, reject) => {
        let sql = `SELECT id, fileURL, alt, title, description, caption, updated_at FROM media WHERE id = ${id}`
        pool.query(sql, (err, results) => {
            try{
                if(err){ throw err }
                if(results){ resolve(results[0]) }
            }catch(e){ logError(e);return; }
        });
    });
}

function getLead(id) {
    return new Promise((resolve, reject) => {
        let sql = `SELECT id, name, email, phone, url, status, message, remarks, updated_at FROM leads WHERE id = ${id}`
        pool.query(sql, (err, results) => {
            try{
                if(err){ throw err }
                if(results){ resolve(results[0]) }
            }catch(e){ logError(e);return; }
        });
    });
}

function getComment(id) {
    return new Promise((resolve, reject) => {
        let sql = `SELECT a.id, a.blogId, a.c_order, a.commentId, a.user, a.email, a.comment, a.status, a.updated_at, b.url, b.title FROM comments as a left join blogs as b on b.id = a.blogId WHERE a.id = ${id}`
        pool.query(sql, (err, results) => {
            try{
                if(err){ throw err }
                if(results){ resolve(results[0]) }
            }catch(e){ logError(e);return; }
        });
    });
}




















function blogMetaName(type, data) {
    // var list = []
    // return new Promise((resolve, reject) => {
    //     if(data.length>0){
    //         for(var i = 0; i < data.length; i++){
    //             let sql = `SELECT name, id, url FROM blog_metas WHERE type = '${type}' AND id = '${data[i]}';`
    //             pool.query(sql, (err, results) => {
    //                 try{ 
    //                     if(err) throw err;
    //                     list.push(results[0])
    //                     if(i == data.length){ resolve(list) }
    //                 }catch(e){ logError(e); return; }
    //             });
    //         }
    //     }else{
    //         resolve(list)
    //     }
    // });
}

// School Functions

// Generic Functions

function sendMailOnError(e) {
    const mailBody =`
        <h2><strong>Hi</h2>
        <p>There has been error in India Enigma. Please check if website is running or not.</p>
        <p>Then check the log</p>
        ${e}<br/>
        // ${func}
        <p>Warm Regards</p>
        <p>Team AmitKK</p>
    `
    let mailOptions = { to: 'amit.khare588@gmail.com', from: 'amit@amitkk.com', subject: "Error on ✔ www.indiaenigma.com", html: mailBody }
    transporter.sendMail( mailOptions, (error, info)=>{
        res.send({ success: true, message: "Please check your mail" })
    })
}
  
function logError(e){
    // sendMailOnError(e)
    printError(e)
}

function verifyToken(req, res, next){
    const bearerHeader = req.headers['authorization'];
    if(bearerHeader) {
        const bearer = bearerHeader.split(' ');
        const bearerToken = bearer[1];
        const exp  = decode(bearerHeader)
        req.token = bearerToken;
        next();
    }else {
        res.redirect('/login?e=' + encodeURIComponent('LoggedOut'));
    }
}
    
function verifyAdmin(req, res, next){
    const bearerHeader = req.headers['authorization'];
    if(bearerHeader) {
        try{
            const bearer = bearerHeader.split(' ');
            const bearerToken = bearer[1];
            const user = jwt.verify(bearerToken,'secretkey')
            if (user.user.role=='Admin'){ next(); }
            else{ res.redirect('/blog'); res.end(); return; }
        } catch(e){ logError(e); res.redirect('/blog'); return; }
    }else {
        res.redirect('/blog');
    }
}

function getUserId(req, res, next){
    if(req.cookies.jwt){
    const bearerHeader = req.cookies.jwt
    try{
        const user = jwt.verify(bearerHeader,'secretkey')
        if (user.user.role!=='Admin'){
            res.redirect('/blog')
            res.end()
            return;
        }
        next();
        } catch(e){ logError(e, 'Function verifyAdmin in Index'); res.status(403); return; }
    }else{
        res.redirect('/login?e=' + encodeURIComponent('LoggedOut'));
    }
}

module.exports = {verifyToken, verifyAdmin, getMeta, getBasic, getBlog,  uploadImage, uploadDeleteImage, uploadImageArray, getProperty, getFullProperty, getSingleImage, getArrayImage, replaceMedia, replaceMediaArray, updatePic, updateBrochure, getBuilder, getAmenitiesImages, getTags, getMedia, getLead, getComment, 
    
    
    
    
    
    
    
    
    
    
    
    getUserId, printError, logError, blogMetaName, blogMetaData, suggestBlogs };