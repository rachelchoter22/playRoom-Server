const con = require('../config/DB');
const fanctions = {
    //Customer
    Login: (req, res) => {
        try {
            let userName = req.body.userName;
            let password = req.body.password;
            con.query(`select * from playroom.customers where userName='${userName}'and password='${password}'`, (err, result) => {
                if (err)
                    res.status(400).send("The data is incorrect")
                else {
                    if (result.length) {
                        res.status(200).send(result[0]);
                    }
                    else {
                        res.status(400).send("The data is incorrect")
                    }

                }
            })
        } catch (err) {

            res.status(500).send(err);
        }
    },
    Signin: (req, res) => {
        try {
            let { userName, password, name, city, PhoneNumber, gamesNumber } = req.body;
            var sql = `insert into playroom.customers values(null,'${password}','${name}','
            ${city}','${PhoneNumber}',${gamesNumber},0,1, '${userName}');`
            con.query(sql, (err, result) => {
                debugger;
                if (err)
                    res.status(400).send("We have a problem inserting this data");
                else
                    res.status(200).send(result);

            })
        } catch (err) {
            res.status(500).send("We have a problem connecting to database");
        }
    },
    GetBorrowedGames: (req, res) => {
        try {

            let id = req.params.id;
            var sql = `select bg.*,  g.name
            from playroom.borrowedgame bg 
            join playroom.customers c
            on bg.customerId=c.id
            join playroom.games g
            on bg.gameId=g.id
            where c.id='${id}' and bg.status=0`;
            con.query(sql, (err, result) => {
                if (err) {
                    res.status(400).send('wrong data');
                } else {

                    res.status(200).send(result);
                }
            })
        } catch (err) {
            res.status(500).send("We have a problem connecting to database");
        }

    },
    //updating the customer's deatils
    UpdateCustomer: (req, res) => {
        try {
            const { name, city, PhoneNumber, gamesNumber, id } = req.body;
            var sql = `update playroom.customers set name='${name}', city='${city}', PhoneNumber='${PhoneNumber}',gamesNumber=${gamesNumber}
            where id='${id}'`
            con.query(sql, (err, result) => {
                if (err)
                    res.status(400).send("We have a problem updating this data");
                else
                    res.status(200).send(result);
            })
        } catch (err) {
            res.status(500).send("We have a problem connecting to database");
        }
    },
    DisableCustomer: (req, res) => {
        try {
            const id  = req.body.Id;
            var sql = `update playroom.customers set status=1 where id='${id}'`;
            let sql2 = `select * from playroom.customers where id='${id}'`;
            con.query(sql, (err, result) => {
                if (err)
                    res.status(400).send("We have a problem disable this customer");
                else {
                    con.query(sql2, (err, resu) => {
                        if (err)
                            res.status(400).send("We have a problem return this data");
                        else
                            res.status(200).send(resu);
                    })
                }
            })
        } catch (err) {
            res.status(500).send("We have a problem connecting to database");
        }
    },
    AbleCustomer: (req, res) => {
        try {
            const { id } = req.body;
            var sql = `update playroom.customers set status=0
            where id='${id}'`;
            let sql2 = `select * from playroom.customers where id='${id}'`;
            con.query(sql, (err, result) => {
                if (err)
                    res.status(400).send("We have a problem disable this customer");
                else {
                    con.query(sql2, (err, resu) => {
                        if (err)
                            res.status(400).send("We have a problem return this data");
                        else
                            res.status(200).send(resu);
                    })
                }
            })
        } catch (err) {
            res.status(500).send("We have a problem connecting to database");
        }
    },
    KnowGame: (req, res) => {
        try {
            let gameid = req.params.id;
            let id = req.params.customerId;
            var sql = `select gameId
            from (select bg.*
            from playroom.customers c
            join playroom.borrowedgame bg
            on bg.customerId=c.id
            where customerId=${id}) as PastGames
            where gameId=${gameid}`
            con.query(sql, (err, result) => {
                if (err)
                    res.status(400).send("we have a problem with the data");
                else
                    res.status(200).send(result);
            })
        } catch (err) {
            res.status(500).send("We have a problem connecting to database");
        }
    },
    NonActive: (req, res) => {
        try {
            var sql = `select id
            from playroom.customers 
            where id not in (select distinct c.id
            from playroom.customers c
            join playroom.borrowedgame bg
            on c.id=bg.customerId) and CustomerTypeId=1`
            con.query(sql, (err, result) => {
                if (err)
                    res.status(400).send(err);
                else
                    res.status(200).send(result);
            })
        } catch (arr) {
            res.status(500).send("We have a problem connecting to database");
        }
    },
    AllCustomers: (req, res) => {
        try {
            var sql = `select * from playroom.customers where CustomerTypeId=1`
            con.query(sql, (err, result) => {
                if (err)
                    res.status(400).send(err);
                else
                    res.status(200).send(result);
            })
        } catch (arr) {
            res.status(500).send("We have a problem connecting to database");
        }
    },
    //מחזירה קוד סטטוס 1- לקוח 2- מנהל
    //מחזירה פרטי לקוח לפי מ.ז. שלו
    FindByID: (req, res) => {
        try {
            var id = req.params.id;
            var sql = `select * from playroom.customers
                where id='${id}'`;
            con.query(sql, (err, result) => {
                if (err)
                    res.status(400).send(err);
                else
                    res.status(200).send(result);
            })
        } catch (err) {
            res.status(500).send("We have a problem connecting to database");
        }
    },
    CanBorrow: (req, res) => {
        try {
            let id = req.params.id;
            var sql = `select c.* from playroom.customers c
            where c.gamesNumber> (select count(*)
            from playroom.customers c
            join playroom.borrowedgame bg
            on c.id=bg.customerId
            where c.id='${id}' and bg.status=0)
            and c.id='${id}'`
            con.query(sql, (err, result) => {
                if (err)
                    res.status(400).send("We have a problem inserting this data");
                else
                    res.status(200).send(result);
            })
        } catch (err) {
            res.status(500).send("We have a problem connecting to database");
        }
    }
}

module.exports = fanctions;