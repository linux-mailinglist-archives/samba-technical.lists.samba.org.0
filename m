Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A588137A61
	for <lists+samba-technical@lfdr.de>; Sat, 11 Jan 2020 00:51:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=/QVAq4NxbKvvZ6F26QiNLeWWm8jTKpp3xaHhzvT3cgM=; b=b5eikRzIE5Vle+zQ8YSJ7ScJqD
	+OWQeqPyMTQsD574Tg8t0k7JAkhN0MmxYTvBo8aYS12Q1ABQjNPbwj6zJk5qiBEuLDUJa9TCTLrvp
	LbVr1GCUODP/k92vgFkyzeSjXgimBRAeitVIxauzuX6tI84mXeQ6IsShGIOTjCO1HaJ0JOSrGP7j3
	EKIdJCYvZdXMKz1BAxSAiTNdmnmcuUr2WwXnNtmncay+qlqTHPnoQecoDe773N8+f/TEp/Bdd55n7
	dTsMyi9hz9U1wROhVVIfLcUON9qRVGafzEL7CuavITNp6JbRXYWGF9wrF2RPBGMZtJxfE1hulY1mq
	82iaVELg==;
Received: from localhost ([::1]:34786 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iq43g-0033xd-Ln; Fri, 10 Jan 2020 23:51:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12676) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iq43c-0033xW-GC
 for samba-technical@lists.samba.org; Fri, 10 Jan 2020 23:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=/QVAq4NxbKvvZ6F26QiNLeWWm8jTKpp3xaHhzvT3cgM=; b=wvYMA20mtgMTieOwBLIm8E1s9s
 lrwPncPFUJYkxzFcf3jJsQXrkyJvIaDgq+e6ARFIk+R3eIBkSnOW/WqX5Z2IDli6LZoVd03GdXOMb
 Q+APS5jf4aV3rDBkmWvbdaz5S39nmQ21zGWf4B6R45g7eIbv+FZB27+lUDQ+GOuXRN05MP9W8XCfh
 6N4/2W5pSkxb880m3mvhC2/N4P9gpM9mSeqg4llxrcZhKaJEdnXG/ryhqWqpC6QhtYO/9ipx3oS02
 clxYrGnUmB61c/AYNr47m5H257DVFzkzAjJwBlQrGy6MQ/BxCwnZM7H8RHDoJeoUCWHNaT+Yu469a
 +v0izByJA+549PTS4sNB0treGKwsLvmubBOCdoxezEDDvhkulkVIlMNmnxj82Vs/JwNKwJYIE2YeJ
 O06WbKFWA2zYntJzr+iSovRuaTb7NRYV2HAcJ/+TlOYEQNhZtsr26X88leynojm3TH00+8tEVvse9
 OHOMVLvBLUvojWFUc+uDbKsJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iq43b-0006pp-AW; Fri, 10 Jan 2020 23:51:11 +0000
Date: Fri, 10 Jan 2020 15:51:08 -0800
To: "Christopher O Cowan - Christopher.O.Cowan@ibm.com"
 <Christopher.O.Cowan@ibm.com>
Subject: Re: Still some loose ends after commit ba53e284e68
Message-ID: <20200110235108.GB5904@jra4>
References: <41568b840d704235b639b4c6044fc3fb@ibm.com>
 <20200110233410.GA5904@jra4>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
In-Reply-To: <20200110233410.GA5904@jra4>
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
Cc: vl@samba.org,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 10, 2020 at 03:34:10PM -0800, Jeremy Allison wrote:
> On Fri, Jan 10, 2020 at 10:46:54PM +0000, Christopher O Cowan - Christopher.O.Cowan--- via samba-technical wrote:
> > I still getting some assertions pointing to rec->value_valid after compiling with the patch.   Seems to be when I'm attempting to start smbd.
> > 
> > I've attached the log from running smbd -i -d10, and a dbx stack trace.
> > It appears that there additional callbacks that need to be cleaned up.
> ..
> > Type 'help' for help.
> > [using memory image in /tmp/core.6488334.10223352]
> > reading symbolic information ...
> > 
> > IOT/Abort trap in pthread_kill at 0xd054bb94 ($t1)
> > 0xd054bb94 (pthread_kill+0xb4) 80410014            lwz   r2,0x14(r1)
> > pthread_kill(??, ??) at 0xd054bb94
> > _p_raise(??) at 0xd054afe4
> > raise.raise(??) at 0xd0121020
> > abort() at 0xd017cae4
> > dump_core(), line 338 in "dumpcore.c"
> > smb_panic_s3(why = "assert failed: rec->value_valid"), line 853 in "util.c"
> > smb_panic(why = "assert failed: rec->value_valid"), line 174 in "fault.c"
> > dbwrap_record_get_value(rec = 0x2016e5f8), line 82 in "dbwrap.c"
> > regdb_upgrade_v2_to_v3_fn(rec = 0x2016e5f8, private_data = 0x2016de28), line 617 in "reg_backend_db.c"
> > traverse_persistent_callback(tdb = 0x2016e1f8, kbuf = (...), dbuf = (...), private_data = 0x2ff21fd8), line 1581 in "dbwrap_ctdb.c"
> > unnamed block in tdb_traverse_internal(tdb = 0x2016e1f8, fn = 0xf0570044, private_data = 0x2ff21fd8, tl = 0x2ff21f70), line 222 in "traverse.c"
> > tdb_traverse_internal(tdb = 0x2016e1f8, fn = 0xf0570044, private_data = 0x2ff21fd8, tl = 0x2ff21f70), line 222 in "traverse.c"
> > tdb_traverse(tdb = 0x2016e1f8, fn = 0xf0570044, private_data = 0x2ff21fd8), line 295 in "traverse.c"
> > unnamed block in db_ctdb_traverse(db = 0x2016de28, fn = 0x2004d1f8, private_data = 0x2016de28), line 1647 in "dbwrap_ctdb.c"
> > db_ctdb_traverse(db = 0x2016de28, fn = 0x2004d1f8, private_data = 0x2016de28), line 1647 in "dbwrap_ctdb.c"
> > dbwrap_traverse(db = 0x2016de28, f = 0x2004d1f8, private_data = 0x2016de28, count = (nil)), line 377 in "dbwrap.c"
> > regdb_upgrade_v2_to_v3(db = 0x2016de28), line 706 in "reg_backend_db.c"
> > regdb_init(), line 829 in "reg_backend_db.c"
> > registry_init_common(), line 33 in "reg_init_basic.c"
> > registry_init_full(), line 81 in "reg_init_full.c"
> > main(argc = 3, argv = 0x2ff2255c), line 2020 in "server.c"
> 
> This backtrace is an interesting one.

Never mind - found it :-).

db_ctdb_fetch_locked_transaction() has an early return if
pull_newest_from_marshall_buffer() returns true, and we
weren't setting result->value_valid = true there.

Can you try this patch ? I think it'll fix it.

Cheers,

	Jeremy.

--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=look

diff --git a/source3/lib/dbwrap/dbwrap_ctdb.c b/source3/lib/dbwrap/dbwrap_ctdb.c
index ef667261359..11710603a5e 100644
--- a/source3/lib/dbwrap/dbwrap_ctdb.c
+++ b/source3/lib/dbwrap/dbwrap_ctdb.c
@@ -534,6 +534,7 @@ static struct db_record *db_ctdb_fetch_locked_transaction(struct db_ctdb_ctx *ct
 	}
 	if (pull_newest_from_marshall_buffer(ctx->transaction->m_write, key,
 					     NULL, result, &result->value)) {
+		result->value_valid = true;
 		return result;
 	}
 

--gBBFr7Ir9EOA20Yy--

