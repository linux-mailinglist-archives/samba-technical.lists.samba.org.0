Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 238ED210272
	for <lists+samba-technical@lfdr.de>; Wed,  1 Jul 2020 05:20:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=7xkKwAhwmLMheulcAlNGlTPEX0KstswAxPkMPGoVuPw=; b=IS15VcR7458pg6iENszwOpYs/8
	4NqBMaIykjwUW0YuCpNWLxwktQAW68p30UVgG/f8m1bQMDWIJ8VL5vO1j0r+i0me3l5RRX9bT6G1e
	TxBKX3JZ7BsaH5J337dinSiTiK6NiYW0d330fi+je+J4exgj7KfAVJMyzk0mltBhTNX3Cqqr5bH/b
	VMifFDIasWQZ1Xm7Xlp+POzNhhKDne93yb9kHCEmV5la+cz3nNTCNVIrztUarMVznnmn3JVuonY9g
	IanIjTxaHbd/DYXaqPh/xT1xMotG45fj8oR9ciqXWsDvcGF6ltr5jIH3n3qREHmwZb8gn2hrGgFpU
	mtJFc9wQ==;
Received: from localhost ([::1]:44186 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jqTHa-004c9H-M0; Wed, 01 Jul 2020 03:19:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52116) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jqTHT-004c9A-VQ
 for samba-technical@lists.samba.org; Wed, 01 Jul 2020 03:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=7xkKwAhwmLMheulcAlNGlTPEX0KstswAxPkMPGoVuPw=; b=VCm9D9Nw/YWRAKCQ8t4+K7P8/z
 KA01KOP6KVlKJowY5E1Go+SqI4ZY1KBCQY7a2FGgQ1hAEy/no/o8GyRz7b4u5DpxcSHauEDavxmer
 Vbg55/wt7Afc8MpVMXZ35mnzxpnIBfXP837YotiZLlRvkukR4KawAjMLYIFdHqmGgXc9DzL9rF7oB
 D6YSTsWY3fsitjQk2v4f4zIzlBcR2DkZi2fmmKpeFhv4YDGwiTnFUYanjYlCCcLtisIQqwVGChPtx
 +1QZfslXebljtouqXhiocUMRHft8Ww+qAhu3J1HIMMiHeQ13JDD8U3oABUCfsp0mOz4KKNBitWE9X
 6JROfZ7WoOd3SCOVLXPCaFzzu0SFEZ1wGVoF97i8XQE6q5AWBt0iUW2k5yCMjIVDaSL4QlWcauuqw
 3Ak4HsdoeTe30h9kevgxiQixc5nRZKY+rFi2CQ0H2uCZApcUb1dRKMJq7KYvfRHi8dpLXodIqtcws
 5lQw70Lmu5iHnmO9ZDV7Gpoa;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jqTHR-00067k-70
 for samba-technical@lists.samba.org; Wed, 01 Jul 2020 03:19:25 +0000
Message-ID: <efd53968d989fa5b909d5b23df58b171410970db.camel@samba.org>
Subject: Deprecate SMBv1 options and NT4-like domains for Samba 4.13?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 01 Jul 2020 15:19:19 +1200
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Samba 4.13 freezes soon, so I wanted to again propose adding things to
the deprecated list.

Yes, we add things to this list far faster then we remove the options,
but the job for anyone wishing to remove features starts with this
point, marking and announcing to our users that we are not going to
keep every Samba option and feature forever.

So I present to you this MR:

https://gitlab.com/samba-team/samba/-/merge_requests/1398

No code is removed of course, and of course we are not going to remove
code that FreeIPA needs, but even in between all that I think this is
worth doing.

(pdb_ldap is not impacted, I've dropped those references compared to my
earlier MR)

Parameter Name                     Description                Default
--------------                     -----------                ------
domain logons                      Deprecated                 no
raw NTLMv2 auth                    Deprecated                 no
client plaintext auth              Deprecated                 no
client NTLMv2 auth                 Deprecated                 yes
client lanman auth                 Deprecated                 no
client use spnego                  Deprecated                 yes

If I get time I also hope to fold the only-used-by-attackers LMv2 into
"raw NTLMv2 auth", so we can remove both in 4.14.

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




