Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A533739D
	for <lists+samba-technical@lfdr.de>; Thu,  6 Jun 2019 13:57:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=9XS/OOgimJwtZkrO2HRbakNwMuAMenGyL/v1bqu9J6E=; b=Kw257rlDsvS1DoXPb2dSZ4I3V+
	vSy5JaAoUBRgGACIP4ePgy2YXDlXEcV65XgUpL616js+wG9X5d5fgRtsZqZJ2zb1yKQRSBs77oSVe
	toDcj2Kw+nERgB6U/qJMkJelDKAcbON2C3Q5wjlhRDw7EK5tMqxynT9dhiiFKkWf4HC3PTiP1JEMK
	SNuHAmSc5CbgItmdPhKR0mZph+urq4seMJMsLSWKiBpgusdL2TEj+HDM2dCFsHb7X73ltarTnS8KU
	xtCumKk843CizVFHZK4Zzkta+iLzhPmsfudk2Zrg7cvKOKhmKk9ritC33e0QEP5wvsVwx4FZ/l4Cj
	PJEz6OXA==;
Received: from localhost ([::1]:59832 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hYr0S-000E4G-P1; Thu, 06 Jun 2019 11:56:32 +0000
Received: from [46.229.238.185] (port=48185 helo=moya.mistotebe.net) 
 by hr1.samba.org with esmtp (Exim) id 1hYr0O-000E49-0N
 for samba-technical@lists.samba.org; Thu, 06 Jun 2019 11:56:30 +0000
Received: from mistotebe.net (215.15.broadband5.iol.cz [88.100.15.215])
 by moya.mistotebe.net (Postfix) with ESMTPA id B8A472A04BD
 for <samba-technical@lists.samba.org>; Thu,  6 Jun 2019 11:39:22 +0000 (UTC)
Received: by mistotebe.net (Postfix, from userid 1000)
 id 4E63BE216; Thu,  6 Jun 2019 13:39:08 +0200 (CEST)
Date: Thu, 6 Jun 2019 13:39:08 +0200
To: samba-technical@lists.samba.org
Subject: Test failure in 4.10.4+Debian sid?
Message-ID: <20190606113908.dzmuky72fyqk52y7@mistotebe.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: NeoMutt/20170113 (1.7.2)
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
From: =?utf-8?q?Ond=C5=99ej_Kuzn=C3=ADk_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?B?T25kxZllaiBLdXpuw61r?= <ondra@mistotebe.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,
I'm trying to get a dev enviroment set up to get into Samba, so I
followed the wiki (I think) to build it and make sure I can run the
selftest. The selftest is when things don't go all that smoothly, I get
samba3.base.delete.deltest20(nt4_dc) and samba3.base.delete(ad_dc), see
output of the make quicktest output[1].

The following are the steps I used to get there:
```
debootstrap sid target
chroot target
mount -t proc proc /proc
# (equivalent of git clone samba, cd samba)
apt install (packages from bootstrap/generated-dists/debian9/bootstrap.sh) python3-testscenarios
git checkout samba-4.10.4
./configure --enable-developer
make -j8
make quicktest
```

I've also done this on master with the same result.

Are the two tests known to fail (on Debian)? Am I doing something wrong
above? Is there more information I should provide that might be helpful?

[1]. https://paste.ubuntu.com/p/sGH4DGkDqz/

Thanks,

-- 
Ondřej Kuzník
Senior Software Engineer
Symas Corporation                       http://www.symas.com
Packaged, certified, and supported LDAP solutions powered by OpenLDAP

