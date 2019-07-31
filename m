Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A087A7C6B8
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 17:35:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=55QYgc7yBQ7ThsWmveFo9XYW/UTChnwrNvtCgk6FRTA=; b=l6yKJn5elzf8Qe/XmHZWr4T+Om
	KBPdNbHk/Jg5kve1k0tq1n8+la4n/Cmjz2FE2J7XDqSX3jX+4COSOM9yMsUJ/NLvv2Y0Vahj3lNtx
	qaGosGLZiZJRisjeCZ13dY8F6JaDYlLom4yrSmZ1jhvmhYBBISxYJzIQUb/8mvyUmc+IQslYUeIpQ
	prOqebT4BwFduaPmgW5eElkvTkEFRnN1ghhcN/iQeka7GAOAliIEIu7lhS3nWqn22+MG8DBNQV7De
	qXhbi7F1RoUy5FlxWlsplXOA0gTprLgcUNxoN/45M4JjyIdOzJtJbfggy91atkx5cuEbCNcvqPIds
	3STlAZpA==;
Received: from localhost ([::1]:39190 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsqcv-001V95-P5; Wed, 31 Jul 2019 15:34:53 +0000
Received: from mx2.suse.de ([195.135.220.15]:40468 helo=mx1.suse.de) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hsqcq-001V7f-JH
 for samba-technical@lists.samba.org; Wed, 31 Jul 2019 15:34:51 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CC5D1AC68;
 Wed, 31 Jul 2019 15:34:40 +0000 (UTC)
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] cifs: remove redundant assignment to variable rc
In-Reply-To: <20190731122841.GA1974@kadam>
References: <20190731090526.27245-1-colin.king@canonical.com>
 <87r266seg4.fsf@suse.com> <20190731122841.GA1974@kadam>
Date: Wed, 31 Jul 2019 17:34:39 +0200
Message-ID: <87lfwerze8.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Warn: EHLO/HELO not verified: Remote host 195.135.220.15 (mx2.suse.de)
 incorrectly presented itself as mx1.suse.de
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
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, Colin King <colin.king@canonical.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

"Dan Carpenter" <dan.carpenter@oracle.com> writes:
> You're just turning off GCC's static analysis (and introducing false
> positives) when you do that.  We have seen bugs caused by this and never
> seen any bugs prevented by this style.

You've never seen bugs prevented by initializing uninitialized
variables? Code can change overtime and I don't think coverity is
checked as often as it could be, meaning the var could end up being used
while uninitialized in the future.

Anyway I won't die on this hill, merge this if you prefer.

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Linux GmbH, Maxfeldstra=C3=9Fe 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 21284 (AG N=C3=BCr=
nberg)

