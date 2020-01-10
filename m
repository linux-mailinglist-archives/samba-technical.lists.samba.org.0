Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F96137A43
	for <lists+samba-technical@lfdr.de>; Sat, 11 Jan 2020 00:34:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=lGUoWbNGuIlWTWf8hdpc3PZ/9xo8axPmUTwZ5JQhalg=; b=ONWsMbzbSRqfkJSP9c17d88DSH
	HjHQT/A+CGTgNNozQBf3fKWeFjhSOUPDvizWc8tsYhEp+u/1BM3OEKIg/doMQIRuWbAdgvzEhEj3W
	ZIfMEfEqNDg5ei62T07WANkSCyymDb7KfRJvNPsJ5f1bHqJp4NJgP7HdbdFkgE9HgzqnisL5vkZaT
	GE3Fe/Yq2R1BHKfulNylTEpAgdWYkzZWfJK+97PRD2WzARNC2L84mKiqA5SeYDLazNgKs+CGmHUcB
	e5cf/OX8By08F8x9JGTQ+WeSRj4HTLdUfVfcKqQNel/eZ8tXSEVd6HN1GRK9S/xW8ZJKa/U+u1wAu
	mzJb02xA==;
Received: from localhost ([::1]:34008 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iq3nK-0033qB-NV; Fri, 10 Jan 2020 23:34:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65014) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iq3nG-0033q4-Nv
 for samba-technical@lists.samba.org; Fri, 10 Jan 2020 23:34:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=lGUoWbNGuIlWTWf8hdpc3PZ/9xo8axPmUTwZ5JQhalg=; b=JJtz8+g8QNPmdHmquofN2l+lVd
 gMaBTJW2v3l87E0O56U7plKnJbcWCNbVRIhzsO0opUwLdSYOsi/rqQHQYW/GK/sRjARHau9PvX5y8
 BbF45xef9Way1YJrKU+KMp7rahJwZ8jFpyK5l4jE2+b+9cf8aZ1+2Vsns7STuspfXnxEDdaYOU713
 SBcj1S3sWjEJ0qcnRWVtuhIODI9V44R84jKJVgfiaprKCYZ1HbIjymtTC5q4RWCUUcsMvX0PiQt6v
 V7MWIvkXYT6yIWztOn7CcuLjVovqRatBKmgDhz91LKhwu3JMY31pG/ZrAT/iLBlAkXMii1Ygg2EdJ
 ccHOuC9KDTqlitNL8dpbauGwfimlBagIJaChXxLFtuJIHCh2XlJdXzWcfSSlPXB31gt2iyg3G53Zm
 eHIkaWAk+q+awwHJRdZgzHrTgKeYcaqKFnooGMViH+s7W8DruWydcYidCxolx8uPU3fsupK2XQI+R
 ENrwDfEtK/iUs5FG5vl7BGwT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iq3nB-0006j9-M7; Fri, 10 Jan 2020 23:34:14 +0000
Date: Fri, 10 Jan 2020 15:34:10 -0800
To: "Christopher O Cowan - Christopher.O.Cowan@ibm.com"
 <Christopher.O.Cowan@ibm.com>
Subject: Re: Still some loose ends after commit ba53e284e68
Message-ID: <20200110233410.GA5904@jra4>
References: <41568b840d704235b639b4c6044fc3fb@ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <41568b840d704235b639b4c6044fc3fb@ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jan 10, 2020 at 10:46:54PM +0000, Christopher O Cowan - Christopher=
=2EO.Cowan--- via samba-technical wrote:
> I still getting some assertions pointing to rec->value_valid after compil=
ing with the patch.   Seems to be when I'm attempting to start smbd.
>=20
> I've attached the log from running smbd -i -d10, and a dbx stack trace.
> It appears that there additional callbacks that need to be cleaned up.
=2E.
> Type 'help' for help.
> [using memory image in /tmp/core.6488334.10223352]
> reading symbolic information ...
>=20
> IOT/Abort trap in pthread_kill at 0xd054bb94 ($t1)
> 0xd054bb94 (pthread_kill+0xb4) 80410014            lwz   r2,0x14(r1)
> pthread_kill(??, ??) at 0xd054bb94
> _p_raise(??) at 0xd054afe4
> raise.raise(??) at 0xd0121020
> abort() at 0xd017cae4
> dump_core(), line 338 in "dumpcore.c"
> smb_panic_s3(why =3D "assert failed: rec->value_valid"), line 853 in "uti=
l.c"
> smb_panic(why =3D "assert failed: rec->value_valid"), line 174 in "fault.=
c"
> dbwrap_record_get_value(rec =3D 0x2016e5f8), line 82 in "dbwrap.c"
> regdb_upgrade_v2_to_v3_fn(rec =3D 0x2016e5f8, private_data =3D 0x2016de28=
), line 617 in "reg_backend_db.c"
> traverse_persistent_callback(tdb =3D 0x2016e1f8, kbuf =3D (...), dbuf =3D=
 (...), private_data =3D 0x2ff21fd8), line 1581 in "dbwrap_ctdb.c"
> unnamed block in tdb_traverse_internal(tdb =3D 0x2016e1f8, fn =3D 0xf0570=
044, private_data =3D 0x2ff21fd8, tl =3D 0x2ff21f70), line 222 in "traverse=
=2Ec"
> tdb_traverse_internal(tdb =3D 0x2016e1f8, fn =3D 0xf0570044, private_data=
 =3D 0x2ff21fd8, tl =3D 0x2ff21f70), line 222 in "traverse.c"
> tdb_traverse(tdb =3D 0x2016e1f8, fn =3D 0xf0570044, private_data =3D 0x2f=
f21fd8), line 295 in "traverse.c"
> unnamed block in db_ctdb_traverse(db =3D 0x2016de28, fn =3D 0x2004d1f8, p=
rivate_data =3D 0x2016de28), line 1647 in "dbwrap_ctdb.c"
> db_ctdb_traverse(db =3D 0x2016de28, fn =3D 0x2004d1f8, private_data =3D 0=
x2016de28), line 1647 in "dbwrap_ctdb.c"
> dbwrap_traverse(db =3D 0x2016de28, f =3D 0x2004d1f8, private_data =3D 0x2=
016de28, count =3D (nil)), line 377 in "dbwrap.c"
> regdb_upgrade_v2_to_v3(db =3D 0x2016de28), line 706 in "reg_backend_db.c"
> regdb_init(), line 829 in "reg_backend_db.c"
> registry_init_common(), line 33 in "reg_init_basic.c"
> registry_init_full(), line 81 in "reg_init_full.c"
> main(argc =3D 3, argv =3D 0x2ff2255c), line 2020 in "server.c"

This backtrace is an interesting one.

It's going through traverse_persistent_callback(), which looks like:

1560 static int traverse_persistent_callback(TDB_CONTEXT *tdb, TDB_DATA kbu=
f, TDB_DATA dbuf,
1561                                         void *private_data)
1562 {
1563         struct traverse_state *state =3D (struct traverse_state *)priv=
ate_data;
1564         struct db_record *rec;
1565         TALLOC_CTX *tmp_ctx =3D talloc_new(state->db);
1566         int ret =3D 0;
1567=20
1568         /*
1569          * Skip the __db_sequence_number__ key:
1570          * This is used for persistent transactions internally.
1571          */
1572         if (kbuf.dsize =3D=3D strlen(CTDB_DB_SEQNUM_KEY) + 1 &&
1573             strcmp((const char*)kbuf.dptr, CTDB_DB_SEQNUM_KEY) =3D=3D =
0)
1574         {
1575                 goto done;
1576         }
1577=20
1578         /* we have to give them a locked record to prevent races */
1579         rec =3D db_ctdb_fetch_locked(state->db, tmp_ctx, kbuf);
1580         if (rec && rec->value.dsize > 0) {
1581                 ret =3D state->fn(rec, state->private_data);

                           ^^^^^^^^^
                           Dies here.

rec comes from db_ctdb_fetch_locked(). If we look at this we see:

1257 static struct db_record *db_ctdb_fetch_locked(struct db_context *db,
1258                                               TALLOC_CTX *mem_ctx,
1259                                               TDB_DATA key)
1260 {
1261         struct db_ctdb_ctx *ctx =3D talloc_get_type_abort(db->private_=
data,
1262                                                         struct db_ctdb=
_ctx);
1263=20

Case #1

1264         if (ctx->transaction !=3D NULL) {
1265                 return db_ctdb_fetch_locked_transaction(ctx, mem_ctx, =
key);
1266         }
1267=20

Case #2

1268         if (db->persistent) {
1269                 return db_ctdb_fetch_locked_persistent(ctx, mem_ctx, k=
ey);
1270         }
1271=20

Case #3

1272         return fetch_locked_internal(ctx, mem_ctx, key, false);
1273 }

So rec can come from the returns of

case #1 db_ctdb_fetch_locked_transaction()
case #2 db_ctdb_fetch_locked_persistent()
case #3 fetch_locked_internal().

Examining each in turn:

Case #1
--------------------------------------------------
db_ctdb_fetch_locked_transaction() has:

 557         result->value_valid =3D true;
 558=20
 559         SAFE_FREE(ctdb_data.dptr);
 560=20
 561         return result;

the only other return is:

 542                 /* create the record */
 543                 result->value =3D tdb_null;
 544                 return result;

which would return a rec with rec->value.dsize =3D=3D 0
and thus not call state->fn() due to:

 1580         if (rec && rec->value.dsize > 0) {
 1581                 ret =3D state->fn(rec, state->private_data);


Case #2
--------------------------------------------------

db_ctdb_fetch_locked_persistent() has:

 591         rec =3D db_ctdb_fetch_locked_transaction(ctx, mem_ctx, key);
=2E..
 606         return rec;

so should have the same 'result->value_valid =3D true' set as it comes
=66rom db_ctdb_fetch_locked_transaction() (case #1 above).

Case #3
--------------------------------------------------

fetch_locked_internal() is the most complex, but tries
to migrate the record and once it's fetched does:

1241         if (result->value.dsize !=3D 0) {
1242                 result->value.dptr =3D talloc_memdup(
1243                         result, ctdb_data.dptr + sizeof(crec->header),
1244                         result->value.dsize);
1245                 if (result->value.dptr =3D=3D NULL) {
1246                         DBG_ERR("talloc failed\n");
1247                         TALLOC_FREE(result);
1248                 }
1249         }
1250         result->value_valid =3D true;
1251=20
1252         SAFE_FREE(ctdb_data.dptr);
1253=20
1254         return result;

which again ends up with the only way to get
a returned record with rec->value.dsize > 0
going through a code path that sets 'result->value_valid =3D true'.

So currently I don't see how you can get there
=66rom here (if you see what I mean :-) ?

Is this crash reproducible ? If so, can you
try adding some debug level 0 statements to the different
cases in #1, #2, #3 above so I can see which path
it went through and in that how it ended up returning
a rec value with value_valid =3D false ?

There must be a way this is happening but currently
I can't see it :-(.

Cheers,

Jeremy.

