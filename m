Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E85A61ECC18
	for <lists+samba-technical@lfdr.de>; Wed,  3 Jun 2020 11:01:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=jzHeTgi94GiNuKjuWGQP7CFG6E32jMx9u2S/K9DL3hA=; b=2IA/jPs6mTO3QDN1hUPknn+5FK
	ybLI77f89GIQHsNCFVViSlpOwphNCOYWw4L6XeqS50ZziuixxIXmS1/XwQ2YHdvU5n9CoXCK2X6uw
	7unoPWMw7yy/qquvw3l088YzGdo4cWQt+TUUlgXiy6/k+QJV9O7VdavoutWgvWpzHcPeFC9qNE065
	scvLXSDRoIR8ZkYAemx954hfNIkMk5cnaYjI2MFAYq+osfg4WUh/iqPvprctJMDGNTXpI+vJpxu+F
	kO77M0RGv1UPXIpjklI7Waw9yM2NVr5hqrFsBC7RB9pRN7SkTobTmmFKqrd1Od9OAfzBv9RgzWxwA
	6vMq6Htw==;
Received: from localhost ([::1]:52222 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jgPGX-008aMj-E8; Wed, 03 Jun 2020 09:00:53 +0000
Received: from mx2.suse.de ([195.135.220.15]:35640) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jgPGR-008aMb-5k
 for samba-technical@lists.samba.org; Wed, 03 Jun 2020 09:00:49 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1BBEFAC24;
 Wed,  3 Jun 2020 09:00:47 +0000 (UTC)
To: Andrew Bartlett <abartlet@samba.org>, Karolin Seeger
 <kseeger@samba.org>, Jeremy Allison <jra@samba.org>, Richard Sharpe
 <realrichardsharpe@gmail.com>, =?utf-8?Q?Bj=C3=B6rn?= Jacke <bj@sernet.de>
Subject: Re: Samba Developers Guide
In-Reply-To: <c5c46e71b5093b5ba3450d089541a8d431792247.camel@samba.org>
References: <c5c46e71b5093b5ba3450d089541a8d431792247.camel@samba.org>
Date: Wed, 03 Jun 2020 11:00:42 +0200
Message-ID: <87y2p4ikw5.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
From: =?utf-8?q?Aur=C3=A9lien_Aptel_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


(re-sending from my subscribed addresse, sorry for duplicates)

Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
writes:
> Can anybody say some words in support of this, or should this now also
> be removed?

As samba grows more and more complex I think a document like this is
desperatly needed. Perhaps it could be updated with the content from
Ralph's sambaxp talk?

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

