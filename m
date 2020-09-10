Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A26862642A3
	for <lists+samba-technical@lfdr.de>; Thu, 10 Sep 2020 11:44:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Khc1dB7vSm3HftX/4dMKsGLvGwrWBe0soTK19avCnzk=; b=yi1fm/6LkGZfIAG0uhvRecqR65
	X+bxUVtAvVZRKAip0ULh9m8FqLdpeg8OmFvRBWDzMJYS6Q3S6o0oh+wDtWkpxC7p8VOIQSILYZjej
	ZMiv9q0I19SnsGBYmOm/rMUCSDzjTE/6Ep2McdPdAsREQO9rM27Brr3CIfZOv2XKo7VBazQWVZADE
	iR3Kpwqi0DvIXnDQMoZniwj9Ed6UBKUKlf8RdhzoZ3mYYvxnAmIInAZUdqMq8pDUm9mJuON7fhMHo
	SzZf2qLx12Vf/aPzWOYiKs7/Lr6mp+lFUWR42C796fB6+w0dVA1gEeok+h9MfvtHFRHcQQA1tVT+z
	7khUFCsw==;
Received: from localhost ([::1]:55658 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kGJ79-004rhO-Um; Thu, 10 Sep 2020 09:43:36 +0000
Received: from mx2.suse.de ([195.135.220.15]:59072) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kGJ75-004rhG-BF
 for samba-technical@lists.samba.org; Thu, 10 Sep 2020 09:43:33 +0000
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 07929AD39;
 Thu, 10 Sep 2020 09:43:44 +0000 (UTC)
To: Shyam Prasad N <nspmangalore@gmail.com>
Subject: Re: [PATCH][SMB3] mount.cifs integration with PAM
In-Reply-To: <CANT5p=o07RqmMkcFoLeUVTeQHhzh5MmFYpfAdv0755iiGbp1ZA@mail.gmail.com>
References: <CANT5p=pxPsBwAv3oJX6Ae9wjpZoEjLvyfGM1sM9DEhS11RNgog@mail.gmail.com>
 <87pn7t4kr9.fsf@suse.com>
 <CANT5p=oeY91u17DPe6WO75Eq_bjzrVC0kmAErrZ=h3S1qh-Wxw@mail.gmail.com>
 <87eeo54q0i.fsf@suse.com>
 <CANT5p=rxp3iQMgxaM_mn3RE3B+zezWr3o8zpkFyWUR27CpeVCA@mail.gmail.com>
 <CANT5p=qMHxq_L5RpXAixzrQztjMr8-P_aO4aPg5uqfPSLNUiTA@mail.gmail.com>
 <874ko7vy0z.fsf@suse.com>
 <CANT5p=o07RqmMkcFoLeUVTeQHhzh5MmFYpfAdv0755iiGbp1ZA@mail.gmail.com>
Date: Thu, 10 Sep 2020 11:43:27 +0200
Message-ID: <87mu1yc6gw.fsf@suse.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, sribhat.msa@outlook.com,
 samba-technical@lists.samba.org, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Shyam Prasad N <nspmangalore@gmail.com> writes:
> Your understanding is correct. We could also go for a hybrid approach,
> where we fallback to option b when option a fails to authenticate.
> But for now, I'll resubmit a patch with option a as a fallback when
> regular mount fails, just like you had suggested.

Please try DFS setups as well. On DFS links a sub-mount is made from the
kernel and mount.cifs is not called.

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

