Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ABD1FFFCB
	for <lists+samba-technical@lfdr.de>; Fri, 19 Jun 2020 03:38:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=JnELCwwssaPt5TjelkFqVHGsKhxH7zBwj8PDD4WAX3s=; b=sluGdOMLAgbBBECRhvbKlvLrhi
	Ppvi/Y8FIo+g03qadKXMIOc9XooT4+Nu9aSWvOETZzIxR4gOtBcK2SDKTqvG2kZvl4h8V1p2OoAE0
	kfXeA95HomtSbx6+CnJB4YJaP3LRHI9Eoj0F7WJDX5oRu4RVamQ8/IYg3kJl0irSw7NLwG0mVdkJV
	BW6XuR+drHDOowAy+o6NaBvl56eebBMkjQ/atD5jIQMasGcLHjXk3Hd/+8baVbrcK0Jse5OBO+q6T
	BnfOAkqBKAmixrKc6QWBOMvz5Woz8fQWI8O/h/mdwKWG42MRVdBNakYFHIulRjGSLQ3Osn/eQC4lt
	W1zGl/rQ==;
Received: from localhost ([::1]:42258 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jm5zL-001K50-Sj; Fri, 19 Jun 2020 01:38:39 +0000
Received: from mx2.suse.de ([195.135.220.15]:42534) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jm5zF-001K4t-7l
 for samba-technical@lists.samba.org; Fri, 19 Jun 2020 01:38:35 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8C21DACCF;
 Fri, 19 Jun 2020 01:38:29 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: New Contribute page on the wiki
In-Reply-To: <20200619111338.2e5deb21@martins.ozlabs.org>
Date: Fri, 19 Jun 2020 11:38:13 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <FECF7A7A-D9CE-4D60-AE6D-53E58120C37D@suse.de>
References: <8b444948-cef4-74d8-a455-958446832aaa@suse.com>
 <20200526172611.GG18267@jeremy-acer>
 <9f00da33e7c31f8f6304af90280bdef8f917c7c3.camel@samba.org>
 <20200619111338.2e5deb21@martins.ozlabs.org>
To: Martin Schwenke <martin@meltin.net>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
From: William Brown via samba-technical <samba-technical@lists.samba.org>
Reply-To: William Brown <wbrown@suse.de>
Cc: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



> On 19 Jun 2020, at 11:13, Martin Schwenke via samba-technical =
<samba-technical@lists.samba.org> wrote:
>=20
> Also, although the page goes close, I feel it is missing the beauty of
> this statement:
>=20
>  Finally remember that Samba is Git patches as performance art.  Each
>  is to be carefully prepared, polished and presented with love, as a =
hand-
>  crafted gift to the future.  The beauty is in the stream of =
individual
>  gems.  It often feels overkill, but here today we see why we have the
>  emphasis, because it means that anybody - even someone outside CTDB
>  expertise, can say 'sure, that makes sense', and review it.=20
>=20
>  https://lists.samba.org/archive/samba-technical/2018-July/129353.html
>=20
> I feel that the author of this statement really captured something =
that
> day and it would be a shame if it were lost to only the mailing list
> archive...  ;-)

As poetic and beautiful as this statement is, the message it conveys is =
"Samba is hard" rather than "Anyone can be in this community". This =
could turn people away from wanting to start or contribute. So it's =
probably better to avoid things like this, as glorious and elegantly =
written as it is.=20

I do fully endorse stickers or shirts that say "Samba: Git patches as =
performance art" though, that would be amazing.=20


=E2=80=94
Sincerely,

William Brown

Senior Software Engineer, 389 Directory Server
SUSE Labs


