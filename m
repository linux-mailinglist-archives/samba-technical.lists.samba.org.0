Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B9277711AE2
	for <lists+samba-technical@lfdr.de>; Fri, 26 May 2023 01:51:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ggWLpR5SIsdGQr/iFMBh/HeMCJnyFwZgVHSjyUREoBU=; b=px8oYl3/08kWBmqpKpdrA9Xuu2
	TCT5+lEVZEg71WXGCgix/Cu2oyQJbgD8eSf53dQPEOFhBK9/0KK+lX0JkVhQJA03HmRmTS+Ce3fZL
	ieBemx0kPVKx/RNC+t/Hm232oqZLkcK4AMqlKGMFyVNm3iiZX7yNF1QDoBKJytaFaG4B+mZljMOFM
	Sxg+hwpAPcC6Ice7AkSjXgkM/yPnLKLvefDwW6RPLPNNwVBQA0HXBPlhSIWkbdw8TlXf/xEHa9VgB
	ijm0xZ90qLSP2Ol/FpgX6LMtMVLNaSRUfGUOsvbMNyHXJbrX0m+KczGN38GqS+hjTV8Ns2PUzlAur
	zQKzbgQQ==;
Received: from ip6-localhost ([::1]:51508 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q2Kj4-00CMfZ-6D; Thu, 25 May 2023 23:50:34 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:47256) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q2Kiz-00CMfQ-1J
 for samba-technical@lists.samba.org; Thu, 25 May 2023 23:50:31 +0000
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f4d6aee530so63726e87.2
 for <samba-technical@lists.samba.org>; Thu, 25 May 2023 16:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685058627; x=1687650627;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ggWLpR5SIsdGQr/iFMBh/HeMCJnyFwZgVHSjyUREoBU=;
 b=Ar5pb64m8luvleoEMT5l/KwPtlu2fSEhq3qP0yDS9gQJI+EkOMIbMewT2mR1b2QpX+
 MEv1wZ2FKg3Si8BVhfqBEZve1txGIDQSM+ew70/dfX47ecXkwXLr9X0bGwItZFZXTfYx
 xEralR8UXsG/0G3jNiQyKzcvwDBbW+6REhF8kiVWP3Wj7hEskrsj/KXk702JND1UZmTX
 ocrvOE+E6aSt/byH/tMjGUGyp0rp0t489V5PIzWZwURW7R2It6l2BKNjoZ7g10O4rLRn
 7bYqUnWgEo9p3UT3icdMLpbBFRIVa333J6NbTouBGMMhS9idioZZsD8HOy6kaiK0AW6j
 zgdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685058627; x=1687650627;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ggWLpR5SIsdGQr/iFMBh/HeMCJnyFwZgVHSjyUREoBU=;
 b=GSnlx2OAUHb479i0JyjaHBjJhDbW0gnXamPsHUaQy0GNW+N2buGCStZCOIykFTPQRX
 92czN2pe5YW1AZHM0xQ3Hs5rCS/5G/1hPhCxxyBpZlfHptZIpSW8KhohD9zvFintMKw8
 hHUPIqCVMR5Nm5HsEXDPrU7Wch7FXaeO0lP24Tf11zqFXJAgc2/v1Cg9SBG9JiLfC9BM
 9aPXjP18G0nGyVSdZXgh3j/ytFyov5kpJGiBC4UhYZal4+rTD6zJKUl1A7Xi/8RJH1rJ
 H5ouCTD0z8mknB6uhINuBrXurOo2YaH436P/YpZfiW1zY2RpahIMh0odhOV8//DI3qNE
 JQ6Q==
X-Gm-Message-State: AC+VfDz3BSrVKA8wJFJ9/1YI7urnrkCM0zlzqwhmj9Obye0GKmQmSVnQ
 5j7c4sTJhxVD30vJOV981eF99/EuzPbskBqwlzvr+4qKRpGGMw==
X-Google-Smtp-Source: ACHHUZ60GaMNEO7fvqQdli4vTnAMaqI/aq6v+5xZUGoaDmitC4MDvDndxXc8/fkMnH2djVNGYSHK6kN4ZJs4zUJA0jo=
X-Received: by 2002:a19:7003:0:b0:4e8:5576:98f4 with SMTP id
 h3-20020a197003000000b004e8557698f4mr6536043lfc.45.1685058626856; Thu, 25 May
 2023 16:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
 <ZGuWhzP98U9Niog+@jeremy-rocky-laptop> <20230525093900.GA261009@sernet.de>
 <CAN05THTi0BC_iwjXMiWn61fg3hRemi5Momwp3O0WGygyWLGomQ@mail.gmail.com>
 <ZG+LOKTr8B+zjQsC@jeremy-rocky-laptop>
 <CAH2r5mv7aZ8nm30oKyYpa-bd8-MqA13EcEmQWV4mOyrV-rj8Ug@mail.gmail.com>
 <ZG/DajG6spMO6A7v@jeremy-rocky-laptop> <20230525221449.GA9932@sernet.de>
In-Reply-To: <20230525221449.GA9932@sernet.de>
Date: Thu, 25 May 2023 18:50:15 -0500
Message-ID: <CAH2r5mvGb_e-kjLoKpwF3Eg7f7oOGGKcM7rL95SkU4q=pSE1AQ@mail.gmail.com>
Subject: Re: Displaying streams as xattrs
To: Jeremy Allison <jra@samba.org>, Steve French <smfrench@gmail.com>, 
 ronnie sahlberg <ronniesahlberg@gmail.com>, Christoph Hellwig <hch@lst.de>,
 CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 25, 2023 at 5:14=E2=80=AFPM Bj=C3=B6rn JACKE <bj@sernet.de> wro=
te:
>
> On 2023-05-25 at 13:22 -0700 Jeremy Allison sent off:
> > I think cifsfs providing access to ADS remotely on Windows
> > and Samba shares is fine.
> >
> > What I'm scared of is adding ADS as a generic "feature" to
> > the Linux VFS and other filesystems :-).
>
> full ack on Jeremy's view here.
>
> If there is something the the Linux VFS layer should *really* add to help
> interoperability with basically all other major OS implementations is NFS=
v4
> ACLs.  Seriously, for so many people living with Linux is a real pain due=
 to
> the lack of NFS4 ACLs here.

Today the "RichACLs" can be displayed multiple ways (e.g. "getcifsacl"
and various other
tools and also via system xattrs).
Being able to display "RichACLs" makes sense - and I am fine with
mapping these (and
probably would make sense to at least have a readonly mapping of the
existing richacls on
a file to "posixacl") and RichACLs are very important.

Wouldn't it be easier to let them also be queried for cifs.ko via
"system.getrichacl" (or whatever
the "getrichacl" tool used in various xfstests uses)?

I was also wondering how we should display (and how to retrieve via
SMB3) "claims based ACLs" (presumably these are reasonably common on a
few server types like Windows)?



--=20
Thanks,

Steve

