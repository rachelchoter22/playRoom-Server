const con = require('../config/DB');
const functions = {
    IsAvailable: (req, res) => {
        try {
            var id = req.params.id;
            var sql = `select id
            from games
            where id=${id} and existingNumber>(select count(*)
                    from playroom.borrowedgame bg 
                    join playroom.games g
                    on bg.game_id=g.id
                    where g.id=${id} and bg.status=0)`
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
    AllGames: (req, res) => {
        try {
            var sql = `select * from playroom.Games`
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
    AllGamesAvailable: (req, res) => {
        try {
            var sql = `select g.* ,gt.id as'gtId', gt.name as 'gtName'
            from playroom.games g
            left join (select g.id ,count(*)
            from playroom.borrowedgame bg 
            join playroom.games g
            on bg.game_id=g.id
            where bg.status=0
            group by g.id) bgc
            on g.id=bgc.id
            join playroom.gametypes gt
            on g.id_Type= gt.id
            where g.existingNumber>0`;
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
    }
}
module.exports = functions;