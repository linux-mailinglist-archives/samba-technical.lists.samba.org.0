Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A18711DA3
	for <lists+samba-technical@lfdr.de>; Fri, 26 May 2023 04:17:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=e+YRl0CK0/vDUx+BiavA9wwrG9kcCyV04wSL16+Nl5k=; b=vw0LGQUBkEiC+0yQ72vMDk2c+j
	+zTITrca4kUqI6S/0TUKl7rRLwZ2uNTnSoPp427BbDJeVAan7UiH7QYjEuM8Mb52GzdW9+G1da4d+
	wqmvAh0T5vv+oJgVGwGpHbeegVY1K1tubfn9j8bYSLmhgPPM5gEVJDKQDpkXz83qvxx1xYCQS2c5N
	NqhJPFGbOjsbns/8L/6oKa7XaJbrTIrt7O5ypN41pA554OAyGb9x/kMiZ365xsiq1Bn1QfjM9pHBx
	AhTQvTJiVnYJRbAj0ueXRVNVJcbx8vcc3Y0fOUJnRq7DsZynza+EH3UOB90SO5BbvTyabDS+/oqDi
	nV6lJPxg==;
Received: from ip6-localhost ([::1]:31548 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q2N0W-00CNJW-9M; Fri, 26 May 2023 02:16:44 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:58470) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q2N0R-00CNJM-E8
 for samba-technical@lists.samba.org; Fri, 26 May 2023 02:16:41 +0000
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-96fffe11714so35568366b.0
 for <samba-technical@lists.samba.org>; Thu, 25 May 2023 19:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685067398; x=1687659398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e+YRl0CK0/vDUx+BiavA9wwrG9kcCyV04wSL16+Nl5k=;
 b=XJpl9Z4OX/DxszTowtfwAADz9DHbNc6dEhFIVTbT4aojTkFxaPBGsPtvruUhr85oMI
 hNhfOqkJdOD1SZnPplDKHfhuLKrxoTPEn45q8Iv5sbKEzIGcLafIGfHDHL9tDAkL38x7
 jToupvyB5/bzGJagH8D9MhG0R5aX6GFXI/TFc9c4XjcUYeYIh77usPwbhX2xy3/lJKOq
 FrmMUmwdUqHp7OJu6QZiOsda4HgJmrA8h1++wF+2cgDv8zE1tCulSjriMWhBLoty5Nnc
 eKVczAU85cvxNtDGkopeL+5QDOHv4rs7tbnfYn7JEVz76plDBlh6vIjZp7Q6+Di7PWSF
 xblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685067398; x=1687659398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e+YRl0CK0/vDUx+BiavA9wwrG9kcCyV04wSL16+Nl5k=;
 b=bxY+QS4JgMLz9VvXV1Hu7iBhybVL/l4Vtbp48AZgnxk/rqS+LUVap83Gh8v6nVFlXp
 RjqIOKwzYrGhCbdbqga2DyzJCx8pBeETyB/l7tFsOiFxcDB9qNpmVuAKZR6hsn8RAiKr
 yQGq7DB5B/kzMxtMJYns7psZ+LtJdQfb31An6m8pcrT6WuMuzqmtEh44orGVXXRwDzWI
 DlqQPtD/c3MRJU6ogEYYkoG49/dOqD1UOovuc3YAp67Am7eWlD61zhhLoC3XPKFyFEMr
 u5j09ewMHP23TFkd9nY8JFuSnkBwxf3BDrQSNoY1YQLh61SpddDgNBcS8D6i2LUpNnkV
 dZjQ==
X-Gm-Message-State: AC+VfDxn+uG6O7+f/+6/nFJlgNAF71f/71k1kQANVs2lCG+ITkjYTdm5
 ADWXMx+4qh8IIEyEaaGgn55asac95yiho9yz1/M=
X-Google-Smtp-Source: ACHHUZ49t58ZOhm1/YEaL5LYLIIy2bdA55XjL/If7r+7JZpXa3CyUB8dDOBPrBea2MVcZJlwo+qJS6A1kl0i0UQPcBo=
X-Received: by 2002:a17:907:3684:b0:958:cc8:bd55 with SMTP id
 bi4-20020a170907368400b009580cc8bd55mr704325ejc.0.1685067397801; Thu, 25 May
 2023 19:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
 <ZGuWhzP98U9Niog+@jeremy-rocky-laptop> <20230525093900.GA261009@sernet.de>
 <CAN05THTi0BC_iwjXMiWn61fg3hRemi5Momwp3O0WGygyWLGomQ@mail.gmail.com>
 <ZG+LOKTr8B+zjQsC@jeremy-rocky-laptop>
 <CAH2r5mv7aZ8nm30oKyYpa-bd8-MqA13EcEmQWV4mOyrV-rj8Ug@mail.gmail.com>
 <ZG/DajG6spMO6A7v@jeremy-rocky-laptop> <20230525221449.GA9932@sernet.de>
 <CAH2r5mvGb_e-kjLoKpwF3Eg7f7oOGGKcM7rL95SkU4q=pSE1AQ@mail.gmail.com>
In-Reply-To: <CAH2r5mvGb_e-kjLoKpwF3Eg7f7oOGGKcM7rL95SkU4q=pSE1AQ@mail.gmail.com>
Date: Fri, 26 May 2023 12:16:25 +1000
Message-ID: <CAN05THS3=XDPA7SzZF9zVPDFhyG5NpxHz8Gi8LoDsbZVYmZSSw@mail.gmail.com>
Subject: Re: Displaying streams as xattrs
To: Steve French <smfrench@gmail.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Christoph Hellwig <hch@lst.de>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 26 May 2023 at 09:50, Steve French <smfrench@gmail.com> wrote:
>
> On Thu, May 25, 2023 at 5:14=E2=80=AFPM Bj=C3=B6rn JACKE <bj@sernet.de> w=
rote:
> >
> > On 2023-05-25 at 13:22 -0700 Jeremy Allison sent off:
> > > I think cifsfs providing access to ADS remotely on Windows
> > > and Samba shares is fine.
> > >
> > > What I'm scared of is adding ADS as a generic "feature" to
> > > the Linux VFS and other filesystems :-).
> >
> > full ack on Jeremy's view here.
> >
> > If there is something the the Linux VFS layer should *really* add to he=
lp
> > interoperability with basically all other major OS implementations is N=
FSv4
> > ACLs.  Seriously, for so many people living with Linux is a real pain d=
ue to
> > the lack of NFS4 ACLs here.
>
> Today the "RichACLs" can be displayed multiple ways (e.g. "getcifsacl"
> and various other
> tools and also via system xattrs).
> Being able to display "RichACLs" makes sense - and I am fine with
> mapping these (and
> probably would make sense to at least have a readonly mapping of the
> existing richacls on
> a file to "posixacl") and RichACLs are very important.
>
> Wouldn't it be easier to let them also be queried for cifs.ko via
> "system.getrichacl" (or whatever
> the "getrichacl" tool used in various xfstests uses)?

Lets not use xattrs for this.
Xattrs are capped at a very tiny maximum size for the amount of data
they can store
and I suspect very complex ACLs could probably quite easily grow
beyond that limit.


>
> I was also wondering how we should display (and how to retrieve via
> SMB3) "claims based ACLs" (presumably these are reasonably common on a
> few server types like Windows)?
>
>
>
> --
> Thanks,
>
> Steve

