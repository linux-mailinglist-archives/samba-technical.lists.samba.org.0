Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F422E372D38
	for <lists+samba-technical@lfdr.de>; Tue,  4 May 2021 17:44:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=uU/esxZREzwAkzTj/2SdFqTccJTvO4Zx7+OIkYLS5KA=; b=UnF3GnvhkCjYlzO3fpH71d1YLh
	ZWEweJvFs2IFcTWvB4060CiOyL6kpyC/zKhR+8ot3SXMI0PO1f4ZD/LJhCD5uPODB1hxVnsHrmZYu
	fSTatE7qsrnuC8wE5+g9V/fC7kAKiAh639SHVDYpeKLGe5BjV2rz2/wvlyJDumCbE0M+HFDk9FhVf
	wZy4546kvy9AcJK4pk1tvs7P/4TgbJYvywU/OTDCcFrS/xvU0CGCmPNYzQpH9WQ8Yu4mX+V58hWSt
	tk04MHmb5XvrzxbeYuFUEFYoApcgXHQ5xHnIpGtb74d6R9sObsUZvy2p3JCqEtnT+Y0Wx0iFt90EL
	sZFU5lkw==;
Received: from ip6-localhost ([::1]:57898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ldxDr-00FRVM-QA; Tue, 04 May 2021 15:44:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20778) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ldxDm-00FRVF-A3
 for samba-technical@lists.samba.org; Tue, 04 May 2021 15:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=uU/esxZREzwAkzTj/2SdFqTccJTvO4Zx7+OIkYLS5KA=; b=roEScRufxU3f9OT5gktlpJnluy
 79Fk1Q9Ve+JHHD+XRgrCCoN09yf16JtMJjsg3ecSeOxV+iD68/s5ThjQGHvHOmSi+bho0Bp7ipmv6
 vgDJICET1tZBbCdDTY5JsAeJ8jyVqXU+7V8XLVbTgGYv1WQqAg1Hhpn7ZoUbYyjYLr70sWudFISqo
 D1GhVe9oQVnCqLbDp6NjZdrJCRvlCUL9mbTvfDLeeyp44lZRAPPkCv51LeSVKw10uh4ljGQp7mMvL
 PVCR129ifCMNo3q5ZT0dTiRLSytIZdt2TIcHORwnJDZZhTnlnD29atz+3/dJjTvWMpBXdDrGcZrmo
 GT2S1TLAiFvvWlSMKUacNXkYmN5eh94uDBdTk7IveASlTsuKZkfWigXyUVuTDj3A3nxsGhZS9axPD
 gmncRJmsoV13gdpXlWlKn6m8ke3MNMJb5WejeYCv+W5Uf97XhWG6kQKcfKRtAsG64rxQRWNRFFruj
 171q82D0Z+ejJ+eG3cS6L8mU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ldxDk-0007Ed-9T; Tue, 04 May 2021 15:44:25 +0000
Message-ID: <ab76b10f3f63cdf970843fb407cae78c8b88eeb3.camel@samba.org>
Subject: Re: simple password sync method
To: d tbsky <tbskyd@gmail.com>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Wed, 05 May 2021 03:44:18 +1200
In-Reply-To: <CAC6SzHJXOrFWYas9TT7EkE3AuiwXHEZtQaVsCHVg7DbhpeAbJQ@mail.gmail.com>
References: <CAC6SzHJXOrFWYas9TT7EkE3AuiwXHEZtQaVsCHVg7DbhpeAbJQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2021-05-04 at 15:39 +0800, d tbsky via samba-technical wrote:
> 
>     I wonder if the old simple method can co-exist with the current
> 
> one. maybe just a config like "password sync script = xxxx" and let
> 
> samba trigger it when password change? although with clear password
> 
> you can sync it to new service at any time, but old simple method
> 
> doesn't need any infrastructure change and doesn't need to store the
> 
> private encryption key.

If you know the target password type (eg crypt()) then we can store
some such passwords without the need for the GPG key, and run the sync
from there.

eg set "password hash userPassword schemes = CryptSHA512"

We won't be adding the 'samba3' style password sync to the AD DC, due
to locking requirements.  At the point where we can process a password
sync, we have to lock the DB against all other changes, and it would
risk service to all other users to start making calls at this point.

Of course Samba remains Free Software and you may make whatever changes
you desire for your private use, but this is our feeling regarding what
we will allow upstream.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


