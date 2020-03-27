Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A161955F7
	for <lists+samba-technical@lfdr.de>; Fri, 27 Mar 2020 12:06:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=MMJ2/TmsYjIGC9CXRySmZcqv5SiieINr7ELLHBGKO5Q=; b=Oa1W+hpQ+mDQyvW4Po5PrGKwfG
	Jd5sfvvDCPT3kJE4gzDHycCbW1zTLWxszx5ESR0W5qtYQu3FGWK6ueLliVHy+/90se+3B2F8HxAhe
	kBtiuBuw0d6rz4xkipoCAMe8Gs/uKKOVbJis2Egd9LpwvyOueF/UZN1hkozYYcce4JOCtsF91N93i
	0rsIXRYR8D0Ox8BbltyO0VCOAXuyAOG7jIkG+kj7VyaqJAr0C5czzpNK2ah3dUl+lhR0rKiheWDtH
	CzGufmh/LtCjJ4EjQwTitrhXW32ePELi488bVXwPBfAKCcYUy/7hwnGCOcHlJz8smCe8sNw1JcB2T
	jZXB8XGg==;
Received: from localhost ([::1]:42698 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jHmnt-000qTb-4d; Fri, 27 Mar 2020 11:05:33 +0000
Received: from mx2.suse.de ([195.135.220.15]:53702) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jHmnn-000qTU-52
 for samba-technical@lists.samba.org; Fri, 27 Mar 2020 11:05:29 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 78030ADFE;
 Fri, 27 Mar 2020 11:05:24 +0000 (UTC)
To: Long Li <longli@microsoft.com>, "longli\@linuxonhyperv.com"
 <longli@linuxonhyperv.com>, Steve French <sfrench@samba.org>,
 "linux-cifs\@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "samba-technical\@lists.samba.org" <samba-technical@lists.samba.org>,
 "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] cifs: Remove locking in smb2_verify_signature() when
 calculating SMB2/SMB3 signature on receiving packets
In-Reply-To: <BN8PR21MB1155DCB17C62EDCE529922ABCECC0@BN8PR21MB1155.namprd21.prod.outlook.com>
References: <1585159997-115196-1-git-send-email-longli@linuxonhyperv.com>
 <87d08zzbg6.fsf@suse.com>
 <BN8PR21MB1155DCB17C62EDCE529922ABCECC0@BN8PR21MB1155.namprd21.prod.outlook.com>
Date: Fri, 27 Mar 2020 12:05:23 +0100
Message-ID: <877dz6njm4.fsf@suse.com>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Long Li <longli@microsoft.com> writes:
>>need for locks). AFAIK there's no state that need to be kept between
>>signing/encrypting calls beside the access to keys. Is it that expensive =
to
>>create/release?
>
> My guess is that crypto_alloc_shash() is a heavy call?

AFAIK there's no IO, just some memory allocation. Could be faster than
locking. Something to look into, maybe...

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

