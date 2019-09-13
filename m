Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D2306B2481
	for <lists+samba-technical@lfdr.de>; Fri, 13 Sep 2019 19:09:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=+VWcpnIsNLuoM/pb2J9gTRNb5VYvPTmhDpFe2pQP1Wc=; b=L4Z1xMt3L51sLNYNON15JYQlmv
	IfcTW4oalXUYPZz9Ffh9qidyIeoR3XjLTDg4AnEnudHQphMfQwEOApYDj5lD/1sotBd5bmicenjW4
	tkJvivYszUr7gX3fZVhM021aQ8dg6XCFMEVb1XHBVinCYVKZOO8jm/dB9SP3+XDT0VojDjyHBNprB
	fmEctBEZ/NHa1vdX7HHBUJSJYb8AHIsF5e28jt3fZK/Fvb3m6+2lOlrdo69PCX/eeaI0JfU8883iE
	86xEWPvK9gUwm4wylW9+CwOu3C93+JGeLcvOiL4ta/BphnH1Mx3JO9jP4O7C6AaihGYJgs/yldyx+
	bG+lPnnw==;
Received: from localhost ([::1]:19854 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i8p3z-005Nso-Cu; Fri, 13 Sep 2019 17:08:51 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:36268) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i8p3v-005Nsh-3V
 for samba-technical@lists.samba.org; Fri, 13 Sep 2019 17:08:49 +0000
Received: by mail-lj1-x244.google.com with SMTP id v24so195049ljj.3
 for <samba-technical@lists.samba.org>; Fri, 13 Sep 2019 10:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+VWcpnIsNLuoM/pb2J9gTRNb5VYvPTmhDpFe2pQP1Wc=;
 b=Ontad5so3cxtnekrOgFw+KYUleXXXjDf+ot8QkPoZUcIslstl/QsgI/1qPZzeGjrbc
 YWkIRui8Jhr2ZHcQTxXi5ySa1PASrMICCM1Zu2UcGXu4yqeFWJD0tCXcPDfZz6Ygb/n9
 JN44sYMHFWkrjOrUqnlehqDwKlZuE/GZHjM2nMZQzufTLBBJDHAxDyxdVmeauXe0o3h0
 yNshiYqDVgBtr42wldYSc2Owi+Oxk1rJeukG3JRQvy/83D90AiK3eDr3ZetVb0aEpK7G
 H05O85YZuNP2NP8rTxqWaPPYfd/dM2+i1F/zRnN88sn68XPM6SCof37NDwI7TLYg44Vf
 0RMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+VWcpnIsNLuoM/pb2J9gTRNb5VYvPTmhDpFe2pQP1Wc=;
 b=aEMNVlUwTK/amSERLMgMiR5RVyjNXtxt6JRaubX7eIyFwnuEq0MAxH5qpynPMIrbGu
 uNlQIC73A8HhLqvJleN/cbIGzHYNAQaxpDmfNSlEKL3cW+T5R2RCU2/NaHBCnHFQv3eR
 FADzc/2x4ZstIl0gP7zQP3/6SBYSVWdoxqxq0LmpT57YEeicG0oM5qgEp9nh7BUr2+Ks
 506W0YF3Nlwv3HLPVYUI9OyQmgwP7Tikl73Hlkuto0OE2LBk7nrjEagjVRPUSOA2WZf8
 Pnn2//9f23AOHQ76i6ub7zmXQIyQj++tTvPtMESvCE77ov02FjZK2Yz6MwWP7IE01qI9
 5AuQ==
X-Gm-Message-State: APjAAAUZnF7cMVEWTXhxzsdLxBh1ERWrHIMeqIEMSOHRPbRsfMPnxa2o
 /4cA3EPYZqlzGP8CLc/PBfm/2bucSZ5Tkp8RlQ==
X-Google-Smtp-Source: APXvYqw07Gj5/VjFdsarA2YFCEydXl7rLRmobk1bnzh8/Q5fSgmYKp6+z5ooAnKPwUA7vpAv6IAnZBtvYKkOyP7vwjk=
X-Received: by 2002:a2e:9555:: with SMTP id t21mr14170756ljh.93.1568394525389; 
 Fri, 13 Sep 2019 10:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190913134634.GR20699@kadam>
In-Reply-To: <20190913134634.GR20699@kadam>
Date: Fri, 13 Sep 2019 10:08:34 -0700
Message-ID: <CAKywueTGT9=G-uYAdK8VY4P2a4TC8PsOKfz78n8tc0rngMWc7Q@mail.gmail.com>
Subject: Re: [cifs:for-next 24/31] fs/cifs/smb2ops.c:4056
 smb2_decrypt_offload()
 error: we previously assumed 'mid' could be null (see line 4045)
To: Dan Carpenter <dan.carpenter@oracle.com>
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: linux-cifs <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Ronnie Sahlberg <lsahlber@redhat.com>, kbuild@01.org, kbuild-all@01.org,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Yes, this is a bug.

Steve, let's move

+       mid->callback(mid);
+
+       cifs_mid_q_entry_release(mid);

under ELSE {} block above.

We should probably move

+       dw->server->lstrp =3D jiffies;

before we looking for a mid.

--
Best regards,
Pavel Shilovsky

=D0=BF=D1=82, 13 =D1=81=D0=B5=D0=BD=D1=82. 2019 =D0=B3. =D0=B2 06:47, Dan C=
arpenter <dan.carpenter@oracle.com>:
>
> tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
> head:   5fc321fb644fc787710353be11129edadd313f3a
> commit: a091c5f67c994d154e8faf95ab774644be2f4dd7 [24/31] smb3: allow para=
llelizing decryption of reads
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> New smatch warnings:
> fs/cifs/smb2ops.c:4056 smb2_decrypt_offload() error: we previously assume=
d 'mid' could be null (see line 4045)
>
> git remote add cifs git://git.samba.org/sfrench/cifs-2.6.git
> git remote update cifs
> git checkout a091c5f67c994d154e8faf95ab774644be2f4dd7
> vim +/mid +4056 fs/cifs/smb2ops.c
>
> a091c5f67c994d Steve French 2019-09-07  4030  static void smb2_decrypt_of=
fload(struct work_struct *work)
> a091c5f67c994d Steve French 2019-09-07  4031  {
> a091c5f67c994d Steve French 2019-09-07  4032    struct smb2_decrypt_work =
*dw =3D container_of(work,
> a091c5f67c994d Steve French 2019-09-07  4033                            s=
truct smb2_decrypt_work, decrypt);
> a091c5f67c994d Steve French 2019-09-07  4034    int i, rc;
> a091c5f67c994d Steve French 2019-09-07  4035    struct mid_q_entry *mid;
> a091c5f67c994d Steve French 2019-09-07  4036
> a091c5f67c994d Steve French 2019-09-07  4037    rc =3D decrypt_raw_data(d=
w->server, dw->buf, dw->server->vals->read_rsp_size,
> a091c5f67c994d Steve French 2019-09-07  4038                          dw-=
>ppages, dw->npages, dw->len);
> a091c5f67c994d Steve French 2019-09-07  4039    if (rc) {
> a091c5f67c994d Steve French 2019-09-07  4040            cifs_dbg(VFS, "er=
ror decrypting rc=3D%d\n", rc);
> a091c5f67c994d Steve French 2019-09-07  4041            goto free_pages;
> a091c5f67c994d Steve French 2019-09-07  4042    }
> a091c5f67c994d Steve French 2019-09-07  4043
> a091c5f67c994d Steve French 2019-09-07  4044    mid =3D smb2_find_mid(dw-=
>server, dw->buf);
> a091c5f67c994d Steve French 2019-09-07 @4045    if (mid =3D=3D NULL)
> a091c5f67c994d Steve French 2019-09-07  4046            cifs_dbg(FYI, "mi=
d not found\n");
>
> Return here?
>
> a091c5f67c994d Steve French 2019-09-07  4047    else {
> a091c5f67c994d Steve French 2019-09-07  4048            mid->decrypted =
=3D true;
> a091c5f67c994d Steve French 2019-09-07  4049            rc =3D handle_rea=
d_data(dw->server, mid, dw->buf,
> a091c5f67c994d Steve French 2019-09-07  4050                             =
     dw->server->vals->read_rsp_size,
> a091c5f67c994d Steve French 2019-09-07  4051                             =
     dw->ppages, dw->npages, dw->len);
> a091c5f67c994d Steve French 2019-09-07  4052    }
> a091c5f67c994d Steve French 2019-09-07  4053
> a091c5f67c994d Steve French 2019-09-07  4054    dw->server->lstrp =3D jif=
fies;
> a091c5f67c994d Steve French 2019-09-07  4055
> a091c5f67c994d Steve French 2019-09-07 @4056    mid->callback(mid);
>                                                 ^^^^^^^^^^^^^
> Potential NULL derference.
>
> a091c5f67c994d Steve French 2019-09-07  4057
> a091c5f67c994d Steve French 2019-09-07  4058    cifs_mid_q_entry_release(=
mid);
> a091c5f67c994d Steve French 2019-09-07  4059
> a091c5f67c994d Steve French 2019-09-07  4060  free_pages:
> a091c5f67c994d Steve French 2019-09-07  4061    for (i =3D dw->npages-1; =
i >=3D 0; i--)
> a091c5f67c994d Steve French 2019-09-07  4062            put_page(dw->ppag=
es[i]);
> a091c5f67c994d Steve French 2019-09-07  4063
> a091c5f67c994d Steve French 2019-09-07  4064    kfree(dw->ppages);
> a091c5f67c994d Steve French 2019-09-07  4065    cifs_small_buf_release(dw=
->buf);
> a091c5f67c994d Steve French 2019-09-07  4066  }
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/kbuild-all                   Intel Corpora=
tion

