const con = require('../config/DB');
const functions = {
    MostPopular: (req, res) => {
        try {
            var sql = `select g.name ,count(g.id) as count
            from playroom.games g
            join playroom.borrowedgame bg
            on g.id=bg.game_id
            group by g.id
            order by count desc
            limit 3`
            con.query(sql, (err, result) => {
                if (err)
                    res.status(400).send("We have a problem getting to wanted data");
                else {
                    res.status(200).send(result);
                }
            })
        } catch (err) {
            res.status(500).send("We have a problem connecting to database");
        }
    },
    //פונקציה שמוסיפה ללקוח משחק מושאל
    BorrowGame: (req, res) => {
        try {
            let { customer_code, game_id} = req.body;
            var sql = `insert into playroom.borrowedgame values(null,'${customer_code}','${game_id}',0,
            current_date(),null);`;
            var sql2=`update playroom.games set existingNumber=existingNumber-1 where id=${game_id};`
            con.query(sql, (err, result) => {
                if (err)
                    res.status(400).send("We have a problem inserting this data");
                else
                    con.query(sql2, (err, newResult) => {
                        console.log(err, newResult)
                        if (err)
                           res.status(400).send("We have a problem return this data");
                       else
                            res.status(200).send(newResult);
                    })

            })
        } catch (err) {
            res.status(500).send("We have a problem connecting to database");
        }
    },
    ReturnGame: (req, res) => {
        try {
            let { id, game_id } = req.body;
            var sql = `update playroom.borrowedGame  set status=1, returnDate=current_date() where id=${id};`
            var sql2 = `update playroom.games set existingNumber=existingNumber+1 where id=${game_id};`;
            con.query(sql, (err, result) => {
                
                if (err)
                    res.status(400).send("We have a problem return this data");
                else
                    con.query(sql2, (err, result) => {

                        if (err)
                            res.status(400).send("We have a problem return this data");
                        else
                            res.status(200).send(result);
                    })
            })
        }
        catch (err) {
            res.status(500).send("We have a problem connecting to database");
        }
    }
}
module.exports = functions;