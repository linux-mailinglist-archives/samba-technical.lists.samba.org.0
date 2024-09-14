Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8E4978E28
	for <lists+samba-technical@lfdr.de>; Sat, 14 Sep 2024 08:02:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Lf/YMIfb+2Zu/yKChK72uKrs+v0SF/ljvcIM9ywqVpg=; b=zxFiWkR3ZI5zO+StW8+IF+drb4
	njlaCtohbe9GLSGhSP4FQQHhw+0dEas7bmMLaUz2U2C5qNPpnaWdtJQBYsJVZLxrLE3D7FGhDMnv5
	TC2eq8ny486gJw+P5sf1WLS6taqycS3Nx8eOSBJPnur8JOb6XxznU3mX+j1qwYjddYTXmiAf2/O4V
	5AepRuvuO4XyHZ43eYhl3pnsMMUeao1S8eAhh2+nm6/cneYnair6fUCOupM4bz52GLoG8qKEAYa4O
	0vPXB7qmgKa1Fe+fuiwcIV1JuvexKqQlXM54OdJIQ3QMw32kPo9WnMxX51OR8kkK0IdZz2997R01Z
	AiRSTFOA==;
Received: from ip6-localhost ([::1]:26988 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1spLqk-0001bI-Vi; Sat, 14 Sep 2024 06:01:39 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:54314) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1spLqf-0001bB-SD
 for samba-technical@lists.samba.org; Sat, 14 Sep 2024 06:01:36 +0000
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c27067b81aso1621586a12.0
 for <samba-technical@lists.samba.org>; Fri, 13 Sep 2024 23:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726293692; x=1726898492; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lf/YMIfb+2Zu/yKChK72uKrs+v0SF/ljvcIM9ywqVpg=;
 b=XhPwpsCK+s5wJX290PtpQqDIgk31Y3IG6IGMoyBYiw19YR4qVJJrO20s6U9TpruHiL
 hU705S+AZqgoKSvZ2qImR0cbVdjDhyrJ6HIUAQF5a67/B/GnOM+hMKet1yWaCqimPJ3N
 CLs3iIbr5m3TwC0jwk629gHWicZxaeppdGZPcbyKMmeICHajIU28cNWRKCMtdBCyFHaM
 ScX40o7AmEgsyB0rtPHSpxZNt1zpZshRbIuJ8dKk/lHNWt3FqPlw01bhNpbP4BD8a9mj
 sTEf4mvO4qj/wln6ckZORDWMmunpIFwcY5lyQ4ZxcXA4jN04wTwnnx6gVPoNMCLHBUYI
 nQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726293692; x=1726898492;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lf/YMIfb+2Zu/yKChK72uKrs+v0SF/ljvcIM9ywqVpg=;
 b=NZVymyAj5u33fp3JirNotdTftY/ny5Lkrsnc3/LILbkR627An3tQbg+vs19YehOwlf
 VVstkC57mQwt3O2NiMctQ19XHAdfy63U32L434j7K+rTQEc86PBBotMRF+lg/V6XLiTS
 6C0uNBIq+KJbhHQTbS1QswG8tnS2Gz9vHtp0PSAerEMT7J9tQEOl6Gq+4MR2xgf508IG
 /SdQYAsTgKiDN0WVKjy8R0DnOHfybAwGMU8O3s4q/nZQnU61nxF09ZS8YZluFbBrIJ31
 szDINJeGB6R9f/hjnHI3290lADo7ta0j9Pm29zi5ZXyQFDr5xXyKvT77Tqw/6T4BW2NB
 ke2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv1frWI8kxhbdWR9aIxJrlFEHnBEM99lCa/hkGC4f181DXj7wdopzqhp5bG6NtPDXaaDege6eJji7uEI7tQgg=@lists.samba.org
X-Gm-Message-State: AOJu0Yz42g/3HT11cMcegfS/A8YKmO72ysUBuZk4vTeyLrzjA0APVYOe
 z7xrVmwoy//siVyNQibfncL8bBTqqIB6kaw8qD+yXeBJMBDHahIPfObRX7JbCZ8FlSZ7eWrgQ5z
 GdGUZiixnDNQvBGnYOEmPiKlIzx4=
X-Google-Smtp-Source: AGHT+IGc2jE7I4KNR724zpEtd52VLgY4GffBQHicvuMutrirxiXRQn27NUACjEy+Zrk+aHKGdg7OSDQoK3qLOx2sX2A=
X-Received: by 2002:a17:907:7da1:b0:a86:96ca:7f54 with SMTP id
 a640c23a62f3a-a9047ca3bebmr416539066b.21.1726293691180; Fri, 13 Sep 2024
 23:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240913032750.175840-1-qianqiang.liu@163.com>
 <63aacc6d-8e3c-476d-938f-cce25d74a6b5@stanley.mountain>
In-Reply-To: <63aacc6d-8e3c-476d-938f-cce25d74a6b5@stanley.mountain>
Date: Sat, 14 Sep 2024 01:01:19 -0500
Message-ID: <CAH2r5mtswGSeNWb9GyGy0r6aaiQAF0x1q2uYmWONGVNq_Q0Udg@mail.gmail.com>
Subject: Re: [PATCH v2] smb: client: compress: fix an "illegal accesses" issue
To: Dan Carpenter <dan.carpenter@linaro.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: linux-cifs@vger.kernel.org, Qianqiang Liu <qianqiang.liu@163.com>,
 ematsumiya@suse.de, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

added to cifs-2.6.git for-next (after correcting minor typo in Fixes:
tag spotted by checkpatch) and added RB

Will let Enzo address your other suggestions but they seemed reasonable.


On Fri, Sep 13, 2024 at 8:26=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Fri, Sep 13, 2024 at 11:27:51AM +0800, Qianqiang Liu wrote:
> > Using uninitialized value "bkt" when calling "kfree"
> >
> > Fixes: 13b68d44990d9 ("smb: client: compress: LZ77 code improvements cl=
eanup")
> > Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
>
> Thanks.
>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> I was reviewing this static checker warning.  I also have an unpublished =
warning
> which complains about collect_sample().
>
> fs/smb/client/compress.c:207 collect_sample() warn: should we be adding '=
len' of the min_t value?
>
> It's a bit weird to sample data from each page.  Could we add some commen=
ts at
> the top of the function explaining what the function does.
>
> /*
>  * This reads a 2k sample from the start of each page to see the data is =
already
>  * compressed or whether we can compress it further.
>  */
>
> regards,
> dan carpenter
>
>


--=20
Thanks,

Steve

