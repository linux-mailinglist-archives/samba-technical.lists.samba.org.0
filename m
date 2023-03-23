Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B016C6A5B
	for <lists+samba-technical@lfdr.de>; Thu, 23 Mar 2023 15:03:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=oOQetMaSZJeNzVjClm+fyta6IWYDYNGcO8Ll5rNU0Rg=; b=4fb+KJOEK6CGYMv5f0hwWF8od0
	r+2RRwGWMAsJSCHKJin6L/6iSZHN96nZXSlYF0us5cBjtLscDfMHtIA40kLBwb7we3+ZWZMdtCCCf
	e9QCJXNIF6BAPp1joZWrN3S2hovHSLgy33LZFQI8Jf74LChChEhHEDywnfi5ZHk1VxRxRH32gciTS
	tb0Ds/2u1hWLg4g94+tOipSWVpuL12/ndPJfmRo8UkQ8AyDVNPc79LnX3l2J+UvuYtTH3r5zUBNUY
	jdbtuZEtFaWnIIxMiMQqWDx2AJHnEHTqcF9KDz5ji9Nzv+d2U6BTNdeBAuYrTqAqnKLzMiUivz6uF
	RICyotkQ==;
Received: from ip6-localhost ([::1]:29136 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pfLXB-0049jH-PR; Thu, 23 Mar 2023 14:03:17 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:34483) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pfLX5-0049j8-5x
 for samba-technical@lists.samba.org; Thu, 23 Mar 2023 14:03:15 +0000
Received: by mail-lf1-x12b.google.com with SMTP id t11so27890046lfr.1
 for <samba-technical@lists.samba.org>; Thu, 23 Mar 2023 07:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679580190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oOQetMaSZJeNzVjClm+fyta6IWYDYNGcO8Ll5rNU0Rg=;
 b=RrlNG0U+jDtZkeulhvHpLMUDCxk0SXpsIHK71lf1mX2OZ2tjEeMIBIQqV6UT7vFh2E
 GfLDu6S78BnVpK269bDpjWbzXjke9WTw6NlfzkxGvBQ8cJNiupzHaTmjT5/ogLRVtaCt
 Wl20ed9pwpImcLI6TB5WbV8iQT+3z/QHFl5TSr6Rk8vwkXvaEcq7WYKyUbD+njnMuqkC
 0HafRRWpwlmFJheTydrV/+F7j7BK5StMRJksOYbl8Pw/XyC7dIiILfant15ozYGS/G4C
 4kmJMtMQ3kqvUFKMN0PuXqDKWDW1w2PKSfoX5j6xJX7v6o3IPcHdjORRMMnTC8qahxwy
 3JcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679580190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oOQetMaSZJeNzVjClm+fyta6IWYDYNGcO8Ll5rNU0Rg=;
 b=eIi1kGvGmXUhWFQX1xLj3wUHVZC5/s417Ew0Rm9ik7rnUYEZWDuDbtFyq+gC3ot3C7
 qx8AtUFdTUUaiEXkVEa6SI+S4HtRZnSddAMeGn4AJ3RjMELxIfTYzEi2FM6BHBXobBRf
 gqAg7FGLV2qMl+EkmVOaVXQRZQWLBotwPjS/vtVrJ9xkKnCdCoHXpzmAghgdBZM6m8ba
 /zApVq4+Jh2CuMQrnoaNpOODMxITEJuI8N05ZHQh02nyAntqo67hPdEM97VjYvfYfXFx
 fnnQfmNsMw2I4GMfmrnfC6QkiVyXnQDfXVXgQ3dKKp6J5PrXXamgA4xNDhdjGzR1aFkL
 uy4Q==
X-Gm-Message-State: AO0yUKXbHfz7P2U1bYc+w8T/CmZmzo2eJ9usld5VI+a9hZdaUmR9y1dO
 ypSbJLmoivJw9E1FSr47uUUoKvh9jTZmkt3e/Qw=
X-Google-Smtp-Source: AK7set8TYyLqEFaEsXNIHMHmfwHG4jXQs5rhwOxsSONSO+PY1C+M5g0CYUEscmGIoG8RcCwuK6ml9AC+MkSx4gZ3xao=
X-Received: by 2002:a05:6512:2803:b0:4e8:49cc:6744 with SMTP id
 cf3-20020a056512280300b004e849cc6744mr3298073lfb.1.1679580189398; Thu, 23 Mar
 2023 07:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <13de0bf0-aa74-46a3-8389-3c70fe77be1f@kili.mountain>
 <bbb33b9e-570f-8d02-1162-fa93fbe006dd@talpey.com>
In-Reply-To: <bbb33b9e-570f-8d02-1162-fa93fbe006dd@talpey.com>
Date: Thu, 23 Mar 2023 19:32:58 +0530
Message-ID: <CANT5p=rTryD+hrQTnSMJkp61zPTdphNZqraazHYD2FK02B4YVw@mail.gmail.com>
Subject: Re: [cifs:for-next 3/8] fs/cifs/connect.c:1303 cifs_ipaddr_cmp()
 error: memcmp() '&saddr4->sin_addr.s_addr' too small (4 vs 16)
To: Tom Talpey <tom@talpey.com>
Content-Type: text/plain; charset="UTF-8"
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: "Paulo Alcantara \(SUSE\)" <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Shyam Prasad N <sprasad@microsoft.com>, lkp@intel.com,
 oe-kbuild@lists.linux.dev, samba-technical@lists.samba.org,
 oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>,
 Dan Carpenter <error27@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Mar 23, 2023 at 7:10=E2=80=AFPM Tom Talpey <tom@talpey.com> wrote:
>
> On 3/23/2023 5:40 AM, Dan Carpenter wrote:
> > tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
> > head:   96114df697dfaef2ce29c14089a83e4a5777e915
> > commit: 010c4e0a894e6a3dee3176aa2f654fce632d0346 [3/8] cifs: fix sockad=
dr comparison in iface_cmp
> > config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/2=
0230323/202303230210.ufS9gVzi-lkp@intel.com/config)
> > compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Link: https://lore.kernel.org/r/202303230210.ufS9gVzi-lkp@intel.com/
> >
> > New smatch warnings:
> > fs/cifs/connect.c:1303 cifs_ipaddr_cmp() error: memcmp() '&saddr4->sin_=
addr.s_addr' too small (4 vs 16)
> > fs/cifs/connect.c:1318 cifs_ipaddr_cmp() error: memcmp() '&saddr6->sin6=
_addr' too small (16 vs 28)
> >
> > Old smatch warnings:
> > fs/cifs/connect.c:1303 cifs_ipaddr_cmp() error: memcmp() '&vaddr4->sin_=
addr.s_addr' too small (4 vs 16)
> > fs/cifs/connect.c:1318 cifs_ipaddr_cmp() error: memcmp() '&vaddr6->sin6=
_addr' too small (16 vs 28)
> > fs/cifs/connect.c:2937 generic_ip_connect() error: we previously assume=
d 'socket' could be null (see line 2925)
> >
> > vim +1303 fs/cifs/connect.c
> >
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1279  int
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1280  cifs_ipaddr_cmp(struct=
 sockaddr *srcaddr, struct sockaddr *rhs)
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1281  {
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1282       struct sockaddr_i=
n *saddr4 =3D (struct sockaddr_in *)srcaddr;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1283       struct sockaddr_i=
n *vaddr4 =3D (struct sockaddr_in *)rhs;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1284       struct sockaddr_i=
n6 *saddr6 =3D (struct sockaddr_in6 *)srcaddr;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1285       struct sockaddr_i=
n6 *vaddr6 =3D (struct sockaddr_in6 *)rhs;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1286
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1287       switch (srcaddr->=
sa_family) {
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1288       case AF_UNSPEC:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1289               switch (r=
hs->sa_family) {
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1290               case AF_U=
NSPEC:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1291                       r=
eturn 0;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1292               case AF_I=
NET:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1293               case AF_I=
NET6:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1294                       r=
eturn 1;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1295               default:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1296                       r=
eturn -1;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1297               }
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1298       case AF_INET: {
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1299               switch (r=
hs->sa_family) {
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1300               case AF_U=
NSPEC:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1301                       r=
eturn -1;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1302               case AF_I=
NET:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27 @1303                       r=
eturn memcmp(&saddr4->sin_addr.s_addr,
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1304                        =
      &vaddr4->sin_addr.s_addr,
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1305                        =
      sizeof(struct sockaddr_in));
> >
> > saddr4 and vaddr4 are type sockaddr_in.  But sin_addr.s_addr is an
> > offset into the struct.  This looks like a read overflow.  I would thin=
k
> > it should be sizeof(struct in_addr).
>
> Oh, definitely. It's more than a read overflow, it's an incorrect
> comparison which will lead to creating new and unnecessary channels.
> Two bugs here.
>
> Tom.
>
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1306               case AF_I=
NET6:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1307                       r=
eturn 1;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1308               default:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1309                       r=
eturn -1;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1310               }
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1311       }
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1312       case AF_INET6: {
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1313               switch (r=
hs->sa_family) {
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1314               case AF_U=
NSPEC:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1315               case AF_I=
NET:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1316                       r=
eturn -1;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1317               case AF_I=
NET6:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27 @1318                       r=
eturn memcmp(&saddr6->sin6_addr,
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1319                        =
             &vaddr6->sin6_addr,
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1320                        =
             sizeof(struct sockaddr_in6));
> >
> > Same.
> >
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1321               default:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1322                       r=
eturn -1;
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1323               }
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1324       }
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1325       default:
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1326               return -1=
; /* don't expect to be here */
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1327       }
> > 010c4e0a894e6a3 Shyam Prasad N 2022-12-27  1328  }
> >

Thanks for catching this Dan.
I will fix this and send an updated patch.

--=20
Regards,
Shyam

