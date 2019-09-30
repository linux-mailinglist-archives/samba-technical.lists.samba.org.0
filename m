Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 08840C1B20
	for <lists+samba-technical@lfdr.de>; Mon, 30 Sep 2019 07:49:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=/5ZplNo9cQLHzCFo4NJ22CC14ahD5BuEQImk54ogFDg=; b=ebwU8EyPZvIdNr3CyRPctP6fNa
	qo+GJRZiuxqmD/Fp8dgBiFyKPL+izrozsPfD12/AB3SJonGlgK2KqOzh7bZmBfUp6OVioiPXD2tdf
	3FemcTYfdvi9V29Y5+lV8Kl9TbQhb+T5xuJOjoej9v+sYKQyqdDbReiIXqkNZqgkaIaTx/fyYswur
	Nsl0gDheMybapC1sYvlL+Kf9z2OaQsgdXRd6216PdMX5OSHA+jspBqmDf7iwGNkS7/4dDFrow9P+C
	XwXNPEhV783JuRpSO/PhVY/9lSnfiNHYZ10OQMat8ZDWN7Pi1AxBn7ZFV2HmYw2U34azcQUumE92B
	3Wxve3hw==;
Received: from localhost ([::1]:18418 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iEoY8-009mLm-Kp; Mon, 30 Sep 2019 05:48:44 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:50137 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iEoY2-009mLf-UQ
 for samba-technical@lists.samba.org; Mon, 30 Sep 2019 05:48:41 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46hWfN4Mnmz9s7T;
 Mon, 30 Sep 2019 15:48:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1569822510; bh=xx78/74J2nb6niirTe05U8A1RMZd72DCgTGA6LHR8Vw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A/ZguNTbESjtv1SM4IE2BT+v2f7FoXx1JhxDMmFzrwgLwAsAUYynnMioBJWfQ/APh
 4o9TnWONR9T3duaA86ZPH+xsxEZ9IhYRmwbKz/mo9IexWYq3KjKWiA3Dcnkwq6aLYE
 fo1QDpKT4DybrG3mi/rBGzrwRH++HwSRXPV4h6SOSwZP5+iPXxXI7X6gRY2aWrpRlJ
 on0njfjmHuFRPy0ErZre0IUIW8kWA0BuFSpo1evqH9LExXy5egAlJBxnIQZJm9ZwIb
 Ru1v1zubyrqf4+w3/Aj1axjfmxjilbmiyuKHrIf78YFzCTfxW0yAjv+l1AOsaCvtKT
 GTizla0a2rVUQ==
Date: Mon, 30 Sep 2019 15:48:27 +1000
To: Heinrich Mislik <Heinrich.Mislik@univie.ac.at>
Subject: Re: CTDB Assigned IP not on an interface
Message-ID: <20190930154827.52b782c4@martins.ozlabs.org>
In-Reply-To: <557c4a52-b8a4-c320-155e-4333890fffd8@univie.ac.at>
References: <848DA573-7DDC-4B8B-BECE-A0C5B15E704F@ieeeglobalspec.com>
 <557c4a52-b8a4-c320-155e-4333890fffd8@univie.ac.at>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Heinrich,

On Fri, 27 Sep 2019 12:12:37 +0200, Heinrich Mislik via samba-technical
<samba-technical@lists.samba.org> wrote:

> I think, the package ctdb-4.9.1-6.el7.x86_64 is somehow broken. After
> a fresh install I had to do several things, to get it working:

> Create missing directories:
>=20
> /etc/ctdb/events/legacy
> /var/lib/ctdb/state
> /var/lib/ctdb/persistent
> /var/lib/ctdb/volatile

Please report this as a bug to the distribution (CentOS?).

> Create missiong symlinks in /etc/ctdb/events/legacy/

> ls -l /etc/ctdb/events/legacy/
> total 0
> lrwxrwxrwx 1 root root 44 Sep 20 17:06 00.ctdb.script -> /usr/share/ctdb/=
events/legacy/00.ctdb.script
> lrwxrwxrwx 1 root root 47 Sep 20 17:06 01.reclock.script -> /usr/share/ct=
db/events/legacy/01.reclock.script
> lrwxrwxrwx 1 root root 46 Sep 20 17:06 05.system.script -> /usr/share/ctd=
b/events/legacy/05.system.script
> lrwxrwxrwx 1 root root 49 Sep 20 17:06 10.interface.script -> /usr/share/=
ctdb/events/legacy/10.interface.script
> lrwxrwxrwx 1 root root 47 Sep 19 17:40 49.winbind.script -> /usr/share/ct=
db/events/legacy/49.winbind.script
> lrwxrwxrwx 1 root root 45 Sep 19 18:27 50.samba.script -> /usr/share/ctdb=
/events/legacy/50.samba.script

> The SPEC file in samba source handles the symlinks in a post install
> script, thats where I got that list.

Yeah, the distribution package should try to enable at least the basic
scripts.=C2=A0 However, this can be quite difficult to get right.  You'll
notice that the sample CTDB packaging that you refer to only creates
the 1st 4 of these if the 1st one does not exist.  It doesn't enable
49.winbind and 50.samba.

peace & happiness,
martin

