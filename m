Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AE8167F87
	for <lists+samba-technical@lfdr.de>; Fri, 21 Feb 2020 15:03:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=PHFP2hpTS+yDz2gwRXQPbFW5Iq8j+GWfMJJt9rJbpoc=; b=JqCxI2bqfWOeYsf6sEz8QUPe0t
	/+RS5C+m4owrfcpGki3dzw4AA3mhHHzYaur/ouJe61rOgF20Dvzb+uzxGG7UAh48jZQtZVWzHl6Nw
	0Cp8FUwGO/qWAg4eBXfjVac8yoixVD7O4r/JMenz1wfjWO5gjDVhmGCnEVMuftHYQVOgKBc4cR2wO
	KAWvr++0v8ry04Zn29SX575V+FfGE/F56+4QoRlsYhQziwrgSWXFhYEws+S9zwyEwHCPNvg8y0Uek
	ZyzZ/KMK1h1Rjt1iE8hgzjCRNEbtE1lFpg3/+ZCtaZAI1Oqgy0dFAmQBCtpYI/nBm+bXikRE698Hk
	YcnKd+kA==;
Received: from localhost ([::1]:20834 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j58uF-00Avtb-V4; Fri, 21 Feb 2020 14:03:52 +0000
Received: from mx2.suse.de ([195.135.220.15]:54564) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1j58uA-00AvtU-W0
 for samba-technical@lists.samba.org; Fri, 21 Feb 2020 14:03:49 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0F892B137;
 Fri, 21 Feb 2020 13:44:23 +0000 (UTC)
To: Joe Perches <joe@perches.com>, Steve French <sfrench@samba.org>
Subject: Re: [trivial PATCH] cifs: Use #define in cifs_dbg
In-Reply-To: <862518f826b35cd010a2e46f64f6f4cfa0d44582.camel@perches.com>
References: <862518f826b35cd010a2e46f64f6f4cfa0d44582.camel@perches.com>
Date: Fri, 21 Feb 2020 14:44:21 +0100
Message-ID: <87eeuo5a2y.fsf@suse.com>
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
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Joe Perches <joe@perches.com> writes:
> +			cifs_dbg(VFS, "bogus file nlink value %u\n",
> +				 fattr->cf_nlink);

Good catch :)
I realize that 1 is VFS but this should probably be FYI.

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

