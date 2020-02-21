Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 183A9167F69
	for <lists+samba-technical@lfdr.de>; Fri, 21 Feb 2020 14:57:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=E/7A4TjMcx26m2bUdwby/LxhnM4gQmT6au5xsay7h7M=; b=CSFtBU4o3pk/kQT5NvVouOj9+l
	OiyMY9gAffTdLFF5i5cDXQtKtQ4VkvR6HnzSbarMTZiPpyYSPGntycXismP8soLTXTcrjBrFeRy1X
	E9EyTWyFwTRwgQe2VP13OFBzMhRSuAv8HPaUOuJJrLfY38FAyvXpW067Kxk1OtHdyGAOcEhncfYin
	XJPtOB3kq7RkNfYIB4XSzsfkdf71lNO56NuoYELDSkgHg8+0ESfLfaQ2pfwb/Ix6XhIDLXLhKRyCP
	0L7u1yrDCRngg5lrnMh0K2ziCmqYfXKML3Qth/7N2Vx3JaB8xBWv7KU6Yfn9BWB7knEAsqbv+biyC
	2bT7PRSg==;
Received: from localhost ([::1]:20088 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j58oC-00AvnQ-2h; Fri, 21 Feb 2020 13:57:36 +0000
Received: from smtprelay0184.hostedemail.com ([216.40.44.184]:38163
 helo=smtprelay.hostedemail.com) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j58o6-00AvnJ-Qz
 for samba-technical@lists.samba.org; Fri, 21 Feb 2020 13:57:33 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id CDB7018224D78;
 Fri, 21 Feb 2020 13:57:21 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: noise65_4028b1475993c
X-Filterd-Recvd-Size: 1339
Received: from XPS-9350.home (unknown [47.151.143.254])
 (Authenticated sender: joe@perches.com)
 by omf04.hostedemail.com (Postfix) with ESMTPA;
 Fri, 21 Feb 2020 13:57:20 +0000 (UTC)
Message-ID: <0f2c5adb37454dacbd57d65ba8743bb6092876ff.camel@perches.com>
Subject: Re: [trivial PATCH] cifs: Use #define in cifs_dbg
To: =?ISO-8859-1?Q?Aur=E9lien?= Aptel <aaptel@suse.com>, Steve French
 <sfrench@samba.org>
Date: Fri, 21 Feb 2020 05:55:56 -0800
In-Reply-To: <87eeuo5a2y.fsf@suse.com>
References: <862518f826b35cd010a2e46f64f6f4cfa0d44582.camel@perches.com>
 <87eeuo5a2y.fsf@suse.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Warn: EHLO/HELO not verified: Remote host 216.40.44.184
 (smtprelay0184.hostedemail.com) incorrectly presented itself as
 smtprelay.hostedemail.com
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
From: Joe Perches via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joe Perches <joe@perches.com>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2020-02-21 at 14:44 +0100, Aurélien Aptel wrote:
> Joe Perches <joe@perches.com> writes:
> > +			cifs_dbg(VFS, "bogus file nlink value %u\n",
> > +				 fattr->cf_nlink);
> 
> Good catch :)
> I realize that 1 is VFS but this should probably be FYI.

change it as you please.

fyi:

Perhaps commit f2f176b41 ("CIFS: add ONCE flag for cifs_dbg type")
may have increased object size quite a bit as it now tests
an external variable.



