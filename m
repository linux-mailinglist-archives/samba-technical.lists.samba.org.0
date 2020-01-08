Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA4F133C1A
	for <lists+samba-technical@lfdr.de>; Wed,  8 Jan 2020 08:19:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=qrRhfhZLSXL8+z1rRMw9IvRZnlIyvRwg5ov9ROJNzAc=; b=ks480gm9+ZZReYFzEdZjfVpyDn
	Axsb/kYTbuHlWvDtNkY0wZBnhKthtzShcg4tsvfcPYnN6QQ12UNcnWXhlhliuYB4Hd56xEGC9QT9u
	yzJaQd7SXzQu/09jAIQVRxemPRKhTbFyzSxuR7OGqd2Pq0CARlNT7FLfXcb3OK15M2EK5jsw3ORyf
	fvVKJgpXj8cuzZgpMV+yrdbZfG2q272Q3WXjLuN29kzqnYc25czgzHAmBbEQX0jbjkM6Gqqc1ZQ7C
	A30LQRQN0m1C4N+FLeyuytJq5stznTosz+fOFScUvAchX3zA+7UI/T0ndaIr/K7r1QkNjX3Fj3Bty
	IxvdW9HA==;
Received: from localhost ([::1]:54112 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ip5bq-002jP7-Ok; Wed, 08 Jan 2020 07:18:30 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:50561) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ip5bb-002jP0-Kn
 for samba-technical@lists.samba.org; Wed, 08 Jan 2020 07:18:20 +0000
Received: from intern.SerNet.DE by mail.SerNet.DE with esmtps (Exim 4.92 #3)
 for samba-technical@lists.samba.org
 id 1ip5bb-0003nQ-3b; Wed, 08 Jan 2020 08:18:15 +0100
Received: by intern.sernet.de
 id 1ip5ba-000239-Vn; Wed, 08 Jan 2020 08:18:15 +0100
Received: from bjacke by pell.sernet.de with local (Exim 4.90_1)
 (envelope-from <bjacke@sernet.de>) id 1ip5bb-00078j-CE
 for samba-technical@lists.samba.org; Wed, 08 Jan 2020 08:18:15 +0100
Date: Wed, 8 Jan 2020 08:18:15 +0100
To: samba-technical@lists.samba.org
Subject: Re: [PATCH] docs-xml/winbindnssinfo: clarify interaction with
 idmap_ad etc.
Message-ID: <20200108071815.GA23016@sernet.de>
Mail-Followup-To: samba-technical@lists.samba.org
References: <20200107093340.GA7605@sernet.de>
 <ad2ab7ff-21b2-92c1-03e7-48698d133363@samba.org>
 <20200107121804.GA11511@sernet.de>
 <41a9c5b3-a13c-f2b7-111f-1e77339afbc9@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41a9c5b3-a13c-f2b7-111f-1e77339afbc9@samba.org>
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2020-01-07 at 14:25 +0000 Rowland penny via samba-technical sent off:
> attributes, so, like 'rid' & 'autorid', it only uses 'template'. If there is
> a third party idmap module, Samba knows nothing about it, so shouldn't even
> be considered.

we always care about possible third party modules


> Unless the idmap_ad module is removed, winbind nss info is needed and if
> used in smb.conf, we should point users to the relevant documentation, which
> in this case is 'man idmap_ad'.

this is what "<refentrytitle>idmap_ad</refentrytitle>" in the patch does.

Björn
-- 
SerNet GmbH, Bahnhofsallee 1b, 37081 Göttingen
phone: 0551-370000-0, mail: kontakt@sernet.de
Gesch.F.: Dr. Johannes Loxen & Reinhild Jung
AG Göttingen: HR-B 2816 - https://www.sernet.de

