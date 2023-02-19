// const con = require('../config/DB');
// const fanctions = {
//     Login: (req, res) => {
//         try {
//             let id = req.body.id;
//             let password = req.body.password;
//             con.query(`select * from playroom.customers where id='${id}'and password='${password}'`, (err, result) => {
//                 if (err)
//                     res.status(400).send("The data is incorrect")
//                 else {
//                     const token = jwt.sign({ user_id: result.code, id, password, status },
//                         process.env.TOKEN_KEY, {
//                             expiresIn: "2h",
//                         }
//                     );
//                     result.token = token;
//                     res.status(200).send(result);
//                 }
//             })
//         } catch (err) {

//             res.status(500).send(err);
//         }
//     }
// }

// module.exports = fanctions;