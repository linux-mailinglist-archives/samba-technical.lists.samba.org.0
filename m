Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 050B183BE0D
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jan 2024 10:54:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Date:Subject:cc;
	bh=XyVftmfC9lYW6cPSgMBGPzeiI+6OS5QumO8QIbwHqSY=; b=DjzzgQ3G3R7jvpm+WbPQzsWRzS
	Bh7oWxBpBokcSew15zVvjudJDUrA3aO8X9M2ltux2zH+CiufB0NcmkFGFygl6huJaelNQfUqMX0+s
	vwbGcomIFpmvcr4KHg7M5Xe8uHAS36IhpYxLB4QCrsau3MJSfDpu86lC7l6iHavzLTOvtQI5cpxsm
	AW1D+/SGL0ci0/DNojTP85lywYR/ZqbKJ7cvwblCykM9I3V4rl8gAo1LxwKJBrSZ+4VIY3nvBsjdM
	msbbzMC5xdr1mPjuUvyaMbVV+7xGo8Az4wXx6J8XOnkPCsrHTxINcycHAv5uso63AL05fzZQbQATA
	foVG2qQQ==;
Received: from ip6-localhost ([::1]:38754 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rSwR5-004OSD-B8; Thu, 25 Jan 2024 09:54:15 +0000
Received: from mail.lysator.liu.se ([2001:6b0:17:f0a0::3]:59651) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rSwR1-004OS6-00
 for samba-technical@lists.samba.org; Thu, 25 Jan 2024 09:54:13 +0000
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
 by mail.lysator.liu.se (Postfix) with ESMTP id C5E8922569
 for <samba-technical@lists.samba.org>; Thu, 25 Jan 2024 10:38:24 +0100 (CET)
Received: by mail.lysator.liu.se (Postfix, from userid 1004)
 id B90F4226A4; Thu, 25 Jan 2024 10:38:24 +0100 (CET)
X-Spam-Score: -1.0
Received: from smtpclient.apple (unknown [IPv6:2001:6b0:17:f002:1000::897])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.lysator.liu.se (Postfix) with ESMTPSA id 99EAC226A2
 for <samba-technical@lists.samba.org>; Thu, 25 Jan 2024 10:38:22 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: What is needed to get the patch in bug 15376 into the tree?
Message-Id: <C73B7A27-134A-4BA5-B7B4-AC88D98202C5@lysator.liu.se>
Date: Thu, 25 Jan 2024 10:38:12 +0100
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
X-Mailer: Apple Mail (2.3774.300.61.1.2)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Peter Eriksson via samba-technical <samba-technical@lists.samba.org>
Reply-To: Peter Eriksson <pen@lysator.liu.se>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

It would be nice to get the stuff in the patch in bug 15376 into the =
tree somehow=E2=80=A6=20
Without it modern Samba versions is of limited use as a fileserver on =
FreeBSD >=3D13 with ZFS using ZFS ACLs and/or extattrs.


https://bugzilla.samba.org/show_bug.cgi?id=3D15376=EF=BF=BC


- Peter=
