Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 896D272F003
	for <lists+samba-technical@lfdr.de>; Wed, 14 Jun 2023 01:35:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=fXvfTZg6b7z+gzNDpU83sunvHkwgM2ODmMeyATC7lzA=; b=j3W5oVfuRFQJquhmh+0UzOUgOc
	bALOjWGEfRjvGacBVnqQ15KLo+AO45ljs9s6l2z8m9mBgKUzQSKQrzK86w15Fveo+zA/tJlg0vHlh
	dbSzcpCpgfLs8bhVmkV9XM7dynRyd0TtLYmZcLuMN48SKTrAK2t5v14HUSutxQu9ErUjcexHVPs99
	o1PpMzTntEZfQjN8jOZmP1eqJSIem/Wq+/w3zc5PIxP6RmB2+/cS3N6DaTt8DEE8FprxdCiOJ5rE1
	ZgCO0YfTHA5u6BRmbEKQxbGgsOrXhq6uE0a68RRfqDlRRJT9kQMW35uyER4WvKvyzi1a2CK1ZycaV
	vhGvLkRg==;
Received: from ip6-localhost ([::1]:35570 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q9DXB-0029qw-OK; Tue, 13 Jun 2023 23:34:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33282) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q9DX7-0029qn-0N
 for samba-technical@lists.samba.org; Tue, 13 Jun 2023 23:34:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=fXvfTZg6b7z+gzNDpU83sunvHkwgM2ODmMeyATC7lzA=; b=D3i56uhl8wI8HSeeawvOnPRmlg
 A9ilPacra+L1kbwooMXM4RR+Pwv0HUjjihJzgnNxVufd7VCzjN8bvEEsgCVQCr00XVq5qZ86suM8m
 akTV2cm4Walq9GoXDxDRJgS2SREyDFixD3Jf9HUREJISDM29YA9rN4xx9dy3+sTrJ/xVqOTl/PAiK
 lJVJVO6rXH0b064GvreK4Oc+2Ol3ueVJ7vo+nKynMkLiGfBqUdZhFiRJ8ykhKBF1R9oqbFv2+NTeF
 gEybUaxSH0RrzFyXvlksdIpnTOZUvysER/7Lb/aizWVpCaMCd3aS7utwCfMp7CoWbImCz8qcDsmAq
 KlIBqEM6glXpZ+cN1eeL5K5B4Oy+8ISB2lzBl5uDdqTSj43Xpjm6QFs4VWQfHYahSCpDjNCBLpNdF
 qK3qWtAXZaLkuEmWrMNp5UNDKuYBwVHjzCkkB9bKiHQFfI+3gByIgcQKSoDrcqEaKKFEX8VQ0By9Q
 L3jFDanvisSxBJssAavwV8Rz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1q9DX5-001ngJ-1N; Tue, 13 Jun 2023 23:34:39 +0000
Date: Tue, 13 Jun 2023 16:34:35 -0700
To: Steve French <smfrench@gmail.com>
Subject: Re: Samba returning mtime for multiple time stamp fields
Message-ID: <ZIj9CwDYeT0GKb0J@jeremy-rocky-laptop>
References: <CAH2r5muZavtKBU__Qy2s+XRG11u1HXyjC3oXF2yxY5h1b2jh1g@mail.gmail.com>
 <CAH2r5muVt+x26kMQ+OsB4WOVZ4bqeTLtG0GAVSXksSuE6YDy=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2r5muVt+x26kMQ+OsB4WOVZ4bqeTLtG0GAVSXksSuE6YDy=Q@mail.gmail.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jun 13, 2023 at 06:17:35PM -0500, Steve French wrote:
>Samba seems to be the only server with this bug (I tried it with and
>without vfs_btrfs as well).  The test works to the other servers I
>tried including Windows.
>
>Windows server updates ctime on hardlinks, but Samba fails to update
>the timestamps in this case since it looks like it populates both
>ChangeTime (ctime) and LastWriteTime (mtime) based on mtime rather
>than setting:    ChangeTime = ctime (and LastWriteTime = mtime).
>Locally the mtime and ctime are correct on the Samba server, but
>remotely it reports it wrong.

Can you log a bug please and upload traces of the client
talking to a Windows.latest server and a Samba.master
built server.

Thanks,

Jeremy.

