const express = require('express')
const router = express.Router();
var pool = require('./mysqlConnector')
const asyncMiddleware = require('./asyncMiddleware')
const jwt = require('jsonwebtoken')
const bcrypt = require('bcryptjs')
const nodemailer = require("nodemailer");
const func = require('./functions')

var bodyParser = require('body-parser')
router.use(bodyParser.urlencoded({ extended: true }))
router.use(bodyParser.json())
const upload = require('express-fileupload')
const fs = require('fs')
router.use(upload())

const time = new Date().toISOString().slice(0, 19).replace('T', ' ')
const transporter = nodemailer.createTransport({ host: "smtpout.secureserver.net", port: 465, secure: true, auth: { user: 'contactus@thetrueloans.com', pass: 'contactus@123',  debug: true }, tls:{ rejectUnauthorized: false, secureProtocol: "TLSv1_method" } });

router.get('/adminMetas',  asyncMiddleware( async(req, res) => {
    let sql = `SELECT id, url, title, description, updated_at FROM metas ORDER BY id DESC`
    pool.query(sql, (err, results) => {
        try{
            if(err){ throw err }
            if(results){ res.send({ data: results }); }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.post('/addMeta', asyncMiddleware( async(req, res) => {
    let post= {
        'url':                  req.body.url,
        'title':                req.body.title,
        'description':          req.body.description,
        "created_at":           time,
        "updated_at":           time,
    }
    let sql = `INSERT INTO metas SET ?`
    pool.query(sql, post, async(err, results) => {
        try{
            if(err){ throw err }
            if(results){
                const data = await func.getMeta(results.insertId)
                res.send({ success: true, data, message: 'Meta added successfuly' });
            }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.post('/updateMeta', asyncMiddleware( async(req, res) => {
    let post= {
        'url':                  req.body.url,
        'title':                req.body.title,
        'description':          req.body.description,
        "updated_at":           time,
    }
    let sql = `UPDATE metas SET ? WHERE id = ${req.body.id}`;
    pool.query(sql, post, async(err, results) => {
        try{
            if(err){ throw err }
            if(results){
                const data = await func.getMeta(req.body.id)
                res.send({ success: true, data, message: 'Meta updated successfuly' })
            }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.get('/adminBasics', asyncMiddleware( async(req, res) => {
    let sql = `SELECT a.id, a.type, a.name, a.tab1, a.tab2, a.tab3, a.updated_at, b.name as tab1Name, c.name as tab2Name, d.name as tab3Name, e.id as mediaId, e.image as mediaImage
    FROM basics as a left join basics as b on b.id = a.tab1 left join basics as c on c.id = a.tab2 left join basics as d on d.id = a.tab3 left join media as e on e.id = a.tab1;`
    pool.query(sql, (err, results) => {
        try{
            if(err){ throw err }
            if(results){ res.send({ data: results }); }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.post('/addBasic', asyncMiddleware( async(req, res) => {
    let post= {
        'type':                 req.body.type,
        'name':                 req.body.name,
        'tab2':                 req.body.tab2,
        'tab3':                 req.body.tab3,
        "created_at":           time,
        "updated_at":           time,
    }
    if(req.body.type == 'Amenities'){
        if(req.files){
            const id = await func.uploadImage(req.files.file, '/amenities/', false)
            post.tab1 = id
        }else{
            post.tab1 = req.body.tab1
        }
    }else{
        post.tab1 = req.body.tab1
    }
    let sql = `INSERT INTO basics SET ?`
    pool.query(sql, post, async(err, results) => {
        try{
            if(err){ throw err }
            if(results){
                const data = await func.getBasic(results.insertId)
                res.send({ success: true, data, message: 'Basic added successfuly' });
            }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.post('/updateBasic', asyncMiddleware( async(req, res) => {
    let post= {
        'type':                 req.body.type,
        'name':                 req.body.name,
        "updated_at":           time,
    }
    if(req.body.type == 'Amenities'){
        if(req.files){ await func.uploadDeleteImage(req.files.file, '/amenities/', req.body.mediaId, req.body.mediaImage, true) }
    }else{
        post.tab1 = req.body.tab1
        post.tab2 = req.body.tab2
        post.tab3 = req.body.tab3
    }

    let sql = `UPDATE basics SET ? WHERE id = '${req.body.id}'`;
    pool.query(sql, post, async(err, results) => {
        try{
            if(err){ throw err }
            if(results){
                const data = await func.getBasic(req.body.id)
                res.send({ success: true, data, message: 'Basic updated successfuly' })
            }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.get('/adminBlogs',  asyncMiddleware( async(req, res) => {
    let sql = `SELECT a.id, a.title, a.url, a.coverImg, a.updated_at, b.image FROM blogs as a left join media as b on b.id = a.coverImg ORDER BY id DESC`
    pool.query(sql, (err, results) => {
        try{
            if(err){ throw err }
            if(results){ res.send({ data: results }); }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.get('/blogMetaOptions', asyncMiddleware( async(req, res) => {
    let sql =   `SELECT id as value, type, name as text FROM basics WHERE type = 'Category' OR type = 'Tag';`
    pool.query(sql, (err, results) => {
        try{
            if(err){ throw err }
            if(results){ res.send({ data: results }); }
        }catch(e){ func.logError(e); res.status(500); return; }
    });
}))

router.post('/addBlog', asyncMiddleware( async(req, res) => {
    let post= {
        'title':                req.body.title,
        'url':                  req.body.url,
        'content':              req.body.content,
        'category':             req.body.category,
        'tag':                  req.body.tag,
        "created_at":           time,
        "updated_at":           time,
    }
    if(req.files){
        const id = await func.uploadImage(req.files.file, '/blog/', true) 
        post.coverImg = id
    }
    let sql = `INSERT INTO blogs SET ?`
    pool.query(sql, post, async(err, results) => {
        try{
            if(err){ throw err }
            if(results){ 
                const data = await func.getBlog(results.insertId)
                res.send({ success: true, data, message: 'Blog added successfuly' }); 
            }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.get('/getBlog/:id', asyncMiddleware( async(req, res) => {
    let sql = `SELECT a.id, a.title, a.url, a.coverImg, a.content, a.category, a.tag, a.updated_at, b.image, b.id as mediaId FROM blogs as a left join media as b on b.id = a.coverImg WHERE a.id = '${req.params.id}'`
    pool.query(sql, async(err, results) => {
        try{
            if(err){ throw err }
            if(results){ res.send({ success: true, data: results[0] }); }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.post('/updateBlog', asyncMiddleware( async(req, res) => {
    let post= {
        'title':                req.body.title,
        'url':                  req.body.url,
        'content':              req.body.content,
        'category':             req.body.category,
        'tag':                  req.body.tag,
        "updated_at":           time,
    }
    if(req.files){
        await func.uploadDeleteImage(req.files.file, '/blog/', req.body.mediaId, req.body.oldImage, true)
    }
    let sql = `UPDATE blogs SET ? WHERE id = ${req.body.id}`;
    pool.query(sql, post, async(err, results) => {
        try{
            if(err){ throw err }
            if(results){ 
                const data = await func.getBlog(req.body.id)
                res.send({ success: true, data, message: 'Blog updated successfuly' }); 
            }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.get('/addPropInputs', asyncMiddleware( async(req, res) => {
    let sql =   `SELECT id as value, type, name as text FROM basics WHERE type = 'Property Type' OR type = 'Amenities' OR type = 'Property Tags' OR type = 'Why';
                SELECT id as value, name as text FROM builders;`
    pool.query(sql, [1,2], (err, results) => {
        try{
            if(err){ throw err }
            if(results){ res.send({ 
                basic:          results[0],
                builder:        results[1]
            });
        }
        }catch(e){ func.logError(e); res.status(500); return; }
    });
}))

router.get('/adminProperty',  asyncMiddleware( async(req, res) => {
    let sql = `SELECT id, name, url, price, discount, status, units, updated_at FROM property ORDER BY id DESC`
    pool.query(sql, (err, results) => {
        try{
            if(err){ throw err }
            if(results){ res.send({ data: results }); }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.post('/changePropertyStatus', asyncMiddleware( async(req, res, next) => {
    let post= {
        "status":                   req.body.status,
        "updated_at":               time,
    }
    let sql = `UPDATE property SET ? WHERE id = ${req.body.id}`
    pool.query(sql, post, async(err, results) => {
        try{
            if(err){ throw err }
            if(results){
                const data = await func.getProperty(req.body.id)
                res.send({ success: true, data, message: 'Property status changed successfully' }); 
            }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.post('/addProperty', asyncMiddleware( async(req, res) => {
    let post= {
        'name':                 req.body.name,
        'url':                  req.body.url,
        'type':                 req.body.type,
        'status':               1,
        'shortdesc':            req.body.shortdesc,
        'longdesc':             req.body.longdesc,
        'amenities':            req.body.amenities,
        'tags':                 req.body.tags,
        'price':                req.body.price,
        'discount':             req.body.discount,
        'bedroom':              req.body.bedroom,
        'bathroom':             req.body.bathroom,
        'units':                req.body.units,
        'address':              req.body.address,
        'area':                 req.body.area,
        'builder':              req.body.builder,
        "created_at":           time,
        "updated_at":           time,
    }
    let post2= {
        'faq':                  req.body.faq,
        'video':                req.body.video,
        'finance':              req.body.finance,
        'possession':           req.body.possession,
        'why':                  req.body.why,
        'landmark':             req.body.landmark,
        "created_at":           time,
        "updated_at":           time,
    }
    if(req.files){
        const bannerId = await func.uploadImage(req.files.banner, '/property/banner/', true)
        post.banner = bannerId
        const picId = await func.uploadImageArray(req.files.pics, '/property/pics/', true)
        post.pics = JSON.stringify(picId)
        if(req.files.blocksPic){
            const blockId = await func.uploadImageArray(req.files.blocksPic, '/property/blocks/', true)
            var blocks = JSON.parse(req.body.blocks)
            for (let i = 0; i < blockId.length; i++) { blocks[i]['pic'] = blockId[i] }
            post2.blocks = JSON.stringify(blocks)
        }
        if(req.files.brochure){
            const brochureId = await func.uploadImageArray(req.files.brochure, '/property/brochure/', true)
            post2.brochure = JSON.stringify(brochureId)
        }
    }
    let sql = `INSERT INTO property SET ?`
    pool.query(sql, post, async(err, results) => {
        try{
            if(err){ throw err }
            if(results){
                post2.propertyId = results.insertId
                let sql2 = `INSERT INTO propdetails SET ?`
                pool.query(sql2, post2, async(err2, results2) => {
                    try{
                        if(err2){ throw err2 }
                        if(results2){
                            const data = await func.getProperty(results.insertId)
                            res.send({ success: true, data, message: 'Property added successfuly' }); 
                        }
                    }catch(e){ func.logError(e); res.status(500); return; }
                })
            }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.get('/getProperty/:id', asyncMiddleware( async(req, res) => {
    let sql = `SELECT a.*, b.* FROM property as a left join propDetails as b on b.propertyId = a.id WHERE a.id = '${req.params.id}'`
    pool.query(sql, async(err, results) => {
        try{
            if(err){ throw err }
            if(results){
                const bannerPic = await func.getSingleImage(results[0].banner); results[0].bannerPic = bannerPic
                const pics = await func.getArrayImage(JSON.parse(results[0].pics));
                results[0].picsArray = pics
                const brochureArray = await func.getArrayImage(JSON.parse(results[0].brochure)); results[0].brochureArray = brochureArray
                var id = []; 
                const blocks = JSON.parse(results[0].blocks)
                for (let i = 0; i < blocks.length; i++) { id.push(blocks[i].pic) }
                const blocksArray = await func.getArrayImage(id); results[0].blocksArray = blocksArray
                res.send({ success: true, data: results[0] }); 
            }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.post('/updateProperty', asyncMiddleware( async(req, res) => {
    let post= {
        'name':                 req.body.name,
        'url':                  req.body.url,
        'type':                 req.body.type,
        'shortdesc':            req.body.shortdesc,
        'longdesc':             req.body.longdesc,
        'amenities':            req.body.amenities,
        'tags':                 req.body.tags,
        'price':                req.body.price,
        'discount':             req.body.discount,
        'bedroom':              req.body.bedroom,
        'bathroom':             req.body.bathroom,
        'units':                req.body.units,
        'address':              req.body.address,
        'area':                 req.body.area,
        'builder':              req.body.builder,
        "updated_at":           time,
    }
    let post2= {
        'faq':                  req.body.faq,
        'video':                req.body.video,
        'finance':              req.body.finance,
        'possession':           req.body.possession,
        'why':                  req.body.why,
        'landmark':             req.body.landmark,
        "updated_at":           time,
    }
    if(req.files){
        var blocks = JSON.parse(req.body.blocks)
        var extraBlocks = JSON.parse(req.body.extraBlocks)
        if(req.files.extraBlocksPic){
            if(req.files.extraBlocksPic.length){
                const id =  await func.uploadImageArray(req.files.extraBlocksPic, '/property/blocks/', true)
                for (let i = 0; i < id.length; i++) { extraBlocks[i].pic= id[i] }
            }else{
                const id =  await func.uploadImage(req.files.extraBlocksPic, '/property/blocks/', true)
                extraBlocks[0].pic= id
            }
            const finalBlock = blocks.concat(extraBlocks)
            post2.blocks  = JSON.stringify(finalBlock)
        }
    }
    let sql = `UPDATE property SET ? WHERE id = ${req.body.id}`;
    pool.query(sql, post, async(err, results) => {
        try{
            if(err){ throw err }
            if(results){
                let sql2 = `UPDATE propdetails SET ? WHERE propertyId = ${req.body.id}`;
                pool.query(sql2, post2, async(err2, results2) => {
                    try{
                        if(err2){ throw err2 }
                        if(results2){
                            const data = await func.getProperty(req.body.id)
                            res.send({ success: true, data, message: 'Property updated successfuly' }); 
                        }
                    }catch(e){ func.logError(e); res.status(500); return; }
                })
            }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.post('/replacePropertyMedia', asyncMiddleware( async(req, res) => {
    await func.uploadDeleteImage(req.files.newMedia, req.body.mediaPath, JSON.parse(req.body.changeMedia).id, JSON.parse(req.body.changeMedia).image, true)
    const data = await func.getFullProperty(req.body.id)
    res.send({ success: true, data, message: 'Media updated successfuly' }); 
}))

router.post('/addMediaInProperty', asyncMiddleware( async(req, res) => {
    const id = await func.uploadImage(req.files.image, req.body.mediaPath, true)
    if(req.body.field == 'Pics'){
        var array = JSON.parse(req.body.pics)
        array.push(id)
        var message = await func.updatePic(req.body.id, array)
    }
    if(req.body.field=='Brochure'){
        var array = JSON.parse(req.body.brochure)
        array.push(id)
        var message = await func.updateBrochure(req.body.id, array)
    }
    const data = await func.getFullProperty(req.body.id)
    res.send({ success: true, data, message })
}))

router.get('/adminBuilders',  asyncMiddleware( async(req, res) => {
    let sql = `SELECT a.*, b.image as logoImage, b.fileURL as logofileURL, c.image as brochureImage, c.fileURL as brochurefileURL FROM builders as a 
    left join media as b on b.id = a.logo left join media as c on c.id = a.brochure ORDER BY a.id DESC`
    pool.query(sql, (err, results) => {
        try{
            if(err){ throw err }
            if(results){ res.send({ data: results }); }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.post('/addBuilder', asyncMiddleware( async(req, res) => {
    let post= {
        'name':                 req.body.name,
        'url':                  req.body.url,
        'email':                req.body.email,
        'phone':                req.body.phone,
        'shortdesc':            req.body.shortdesc,
        'longdesc':             req.body.longdesc,
        'address':              req.body.address,
        'status':               1,
        "created_at":           time,
        "updated_at":           time,
    }
    if(req.files){
        if(req.files.logo){
            const logoId = await func.uploadImage(req.files.logo, '/builder/logo/', true)
            post.logo = logoId
        }
        if(req.files.brochure){
            const brochureId = await func.uploadImage(req.files.brochure, '/builder/brochure/', true)
            post.brochure = brochureId
        }
    }
    let sql = `INSERT INTO builders SET ?`
    pool.query(sql, post, async(err, results) => {
        try{
            if(err){ throw err }
            if(results){ 
                const data = await func.getBuilder(results.insertId)
                res.send({ success: true, data, message: 'Builder added successfuly' }); 
            }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.post('/updateBuilder', asyncMiddleware( async(req, res) => {
    let post= {
        'name':                 req.body.name,
        'url':                  req.body.url,
        'email':                req.body.email,
        'phone':                req.body.phone,
        'shortdesc':            req.body.shortdesc,
        'longdesc':             req.body.longdesc,
        'address':              req.body.address,
        "updated_at":           time,
    }
    if(req.files){
        if(req.files.logo){
            await func.uploadDeleteImage(req.files.logo, '/builder/logo/', req.body.oldLogoId, req.body.oldLogo, true)
        }
        if(req.files.brochure){
            await func.uploadDeleteImage(req.files.brochure, '/builder/brochure/', req.body.oldBrochureId, req.body.oldBrochure, true)
        }
    }
    let sql = `UPDATE builders SET ? WHERE id = ${req.body.id}`;
    pool.query(sql, post, async(err, results) => {
        try{
            if(err){ throw err }
            if(results){ 
                const data = await func.getBuilder(req.body.id)
                res.send({ success: true, data, message: 'Builder updated successfuly' }); 
            }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.get('/adminMedia',  asyncMiddleware( async(req, res) => {
    let sql = `SELECT id, fileURL, alt, title, description, caption, updated_at FROM media ORDER BY id DESC`
    pool.query(sql, (err, results) => {
        try{
            if(err){ throw err }
            if(results){ res.send({ data: results }); }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.post('/updateMedia', asyncMiddleware( async(req, res) => {
    let post= {
        'alt':                 req.body.alt,
        'title':               req.body.title,
        'description':         req.body.description,
        'caption':             req.body.caption,
        "updated_at":           time,
    }
    let sql = `UPDATE media SET ? WHERE id = ${req.body.id}`;
    pool.query(sql, post, async(err, results) => {
        try{
            if(err){ throw err }
            if(results){ 
                const data = await func.getMedia(req.body.id)
                res.send({ success: true, data, message: 'Media updated successfuly' }); 
            }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.get('/adminLeads',  asyncMiddleware( async(req, res) => {
    let sql = `SELECT id, name, email, phone, url, status, message, remarks, updated_at FROM leads ORDER BY id DESC`
    pool.query(sql, (err, results) => {
        try{
            if(err){ throw err }
            if(results){ res.send({ data: results }); }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.post('/updateLeads', asyncMiddleware( async(req, res) => {
    let post= {
        'status':               req.body.status,
        'remarks':              req.body.remarks,
        "updated_at":           time,
    }
    let sql = `UPDATE leads SET ? WHERE id = ${req.body.id}`;
    pool.query(sql, post, async(err, results) => {
        try{
            if(err){ throw err }
            if(results){ 
                const data = await func.getLead(req.body.id)
                res.send({ success: true, data, message: 'Lead updated successfuly' }); 
            }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.post('/changeLeadStatus', asyncMiddleware( async(req, res, next) => {
    let post= {
        "status":                   req.body.status,
        "updated_at":               time,
    }
    let sql = `UPDATE leads SET ? WHERE id = ${req.body.id}`
    pool.query(sql, post, async(err, results) => {
        try{
            if(err){ throw err }
            if(results){
                const data = await func.getLead(req.body.id)
                res.send({ success: true, data, message: 'Lead status changed successfully' }); 
            }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.post('/addComment', asyncMiddleware( async(req, res, next) => {
    let post= {
        "user":                     req.body.name,
        "email":                    req.body.email,
        "comment":                  req.body.comment,
        "commentId":                req.body.commentId,
        "c_order":                  req.body.order,
        "blogId":                   req.body.blogId,
        "status":                   0,
        "created_at":               time,
        "updated_at":               time,
    }
    let sql = 'INSERT INTO comments SET ?'
    pool.query(sql, post, (err, results) => {
        try{
            if(err){ throw err }
            if(results){ res.send({ success: true, message: 'Comment submitted for approval' }); }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.post('/updateComment', asyncMiddleware( async(req, res) => {
    let post= {
        'comment':              req.body.comment,
        "updated_at":           time,
    }
    let sql = `UPDATE comments SET ? WHERE id = ${req.body.id}`;
    pool.query(sql, post, async(err, results) => {
        try{
            if(err){ throw err }
            if(results){
                const data = await func.getComment(req.body.id)
                res.send({ success: true, data, message: 'Comment updated successfuly' });
            }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.get('/adminComments', asyncMiddleware( async(req, res) => {
    let sql =   `SELECT a.id, a.blogId, a.c_order, a.commentId, a.user, a.email, a.comment, a.status, a.updated_at, b.url, b.title FROM comments as a
                left join blogs as b on b.id = a.blogId ORDER BY a.id DESC`
    pool.query(sql, (err, results) => {
        try{
            if(err){ throw err }
            if(results){ res.send({ data: results }); }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))

router.post('/changeCommentStatus', asyncMiddleware( async(req, res, next) => {
    let post= {
        "status":                   req.body.status,
        "updated_at":               time,
    }
    let sql = `UPDATE comments SET ? WHERE id = ${req.body.id}`
    pool.query(sql, post, async(err, results) => {
        try{
            if(err){ throw err }
            if(results){
                const data = await func.getComment(req.body.id)
                res.send({ success: true, data, message: 'Comment status changed successfully' }); 
            }
        }catch(e){ func.logError(e); res.status(500); return; }
    })
}))


module.exports = router;