Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CC5B2794
	for <lists+samba-technical@lfdr.de>; Fri, 13 Sep 2019 23:53:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=kQXCij7p1IOwTylOihi+RbfbQJGFM7gV75fK8wdtcXQ=; b=EMBWyOXiFGpi+2n6EFGO7j5MKa
	A05o82swzt27rx2x6PnBM8/kyC5a1vaX2k1kFXTtjEONnXc8z3YPgN4G6/XULIyUZazQOuvnLVeI7
	hWDJfu/dk5HL7wEsiDLJUUZjo7Ct+EJDwJA7NV7YPF5x7NnzJpKOb5oYFfdlJktbqbHeKdWyEM5wG
	1pl0UjqDVHcMqLdiYNRNGvDJc00jfJwhUWrwMSh79lrxiOeiqapc8vQGtV2BDYn1L6IGTli6Kq19C
	030kSRzf3H2E/rEI7Ob0OHo/B38m2YJsZLTwxEGb9GPFee3Aaepxc03g8nHqDEV21EOf9BEppS12p
	RVwMo0Tg==;
Received: from localhost ([::1]:33834 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i8tUI-005RCX-VM; Fri, 13 Sep 2019 21:52:19 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:44268) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i8tUD-005RCQ-UT
 for samba-technical@lists.samba.org; Fri, 13 Sep 2019 21:52:16 +0000
Received: by mail-io1-xd43.google.com with SMTP id j4so65859477iog.11
 for <samba-technical@lists.samba.org>; Fri, 13 Sep 2019 14:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kQXCij7p1IOwTylOihi+RbfbQJGFM7gV75fK8wdtcXQ=;
 b=WbGH3hIMsfDu5tdg1m4X92DF/CO84QQZVYbEmF7fSByah7d39ZASmEXtoS0oNbCTcy
 L8bXZEIqp+tbYkEM8AoeOAbVl4rIyxP4iUjuLW5RDHQgVq3AIlLEMGXhqw7f3YRqeUmd
 Z/xgHBy5wByoWTifTdtedc2zo6+9uuYIdAlO+R9+1h1U7l/rtK0BBjYrDQA31jb0Jg+G
 LZh1lYRIkgizBtjJ6DJGXrq6jNKxCUHGpVcVEO2hn/z3W19bEIuLfnsGAjN0uU/J5Hue
 HOvt9Y17Dehwp68k9sBlCMJjIm9rIsmx+N1Yg0wRL11C5pNPDsXpkzJWWDOXctj8OObF
 2YYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kQXCij7p1IOwTylOihi+RbfbQJGFM7gV75fK8wdtcXQ=;
 b=FIa6syjIwCY+uCLO+gXaLlIBRM2f6jtsV6CP9tdetuatM0pL2PWnxHSwhr+4LyDqnU
 huJPndCQnN7K3sZq7Eqx3Bk2e9zZ6DQD3y8mhnIP/GvT+7qKpSrlt7D2E+u4ImI7Rv+O
 VF0T0eW8kL4dPpYNfeyZNmZhK+gIlTlnH6YWMlb4pfgpgKXltCDQ2rdmkGY8gcVMghLy
 4Cd6SMl6yNOc5R5n9pljk2vzWAGpe4Wex3p50wytbgH6LqVAmDKYKxH99g6dSXKKAGB7
 WYWLKG4bKWOQaVXN6c8r9ElR5+mA9rMqGC44n03b+Cq2bKBOpQ+BPKaXf7Rl9MynxO/D
 vzFA==
X-Gm-Message-State: APjAAAVELYFPe6dbd45Q3F+ltTtCSa1b+zYjIdyCO8Op947tA07CwJJp
 L/UOvlGCN/7fErcglEiTKFTS9wRMXdohEquSRBs=
X-Google-Smtp-Source: APXvYqy3NoeI4WCIM8NJ7L90lX4Az/h7QHPNASX58paoVITibHgY+5jdjtJHi4/Iv3ZCKEHj/0jQLbrjknlpRwuDGds=
X-Received: by 2002:a02:3786:: with SMTP id r128mr24282578jar.76.1568411531726; 
 Fri, 13 Sep 2019 14:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190913134634.GR20699@kadam>
 <CAKywueTGT9=G-uYAdK8VY4P2a4TC8PsOKfz78n8tc0rngMWc7Q@mail.gmail.com>
In-Reply-To: <CAKywueTGT9=G-uYAdK8VY4P2a4TC8PsOKfz78n8tc0rngMWc7Q@mail.gmail.com>
Date: Fri, 13 Sep 2019 16:52:00 -0500
Message-ID: <CAH2r5mtahgXfrKA2hyiDWBm9wVOh-QUv+Y=9Bn6s95zYxm6x8Q@mail.gmail.com>
Subject: Re: [cifs:for-next 24/31] fs/cifs/smb2ops.c:4056
 smb2_decrypt_offload()
 error: we previously assumed 'mid' could be null (see line 4045)
To: Pavel Shilovsky <piastryyy@gmail.com>
Content-Type: multipart/mixed; boundary="00000000000035f1660592764452"
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
Cc: linux-cifs <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Ronnie Sahlberg <lsahlber@redhat.com>, kbuild@01.org, kbuild-all@01.org,
 Steve French <stfrench@microsoft.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--00000000000035f1660592764452
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fix attached.  Tentatively merged into cifs-2.6.git for-next pending
review and the usual "buildbot" automated regression testing

On Fri, Sep 13, 2019 at 12:09 PM Pavel Shilovsky via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Yes, this is a bug.
>
> Steve, let's move
>
> +       mid->callback(mid);
> +
> +       cifs_mid_q_entry_release(mid);
>
> under ELSE {} block above.
>
> We should probably move
>
> +       dw->server->lstrp =3D jiffies;
>
> before we looking for a mid.
>
> --
> Best regards,
> Pavel Shilovsky
>
> =D0=BF=D1=82, 13 =D1=81=D0=B5=D0=BD=D1=82. 2019 =D0=B3. =D0=B2 06:47, Dan=
 Carpenter <dan.carpenter@oracle.com>:
> >
> > tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
> > head:   5fc321fb644fc787710353be11129edadd313f3a
> > commit: a091c5f67c994d154e8faf95ab774644be2f4dd7 [24/31] smb3: allow pa=
rallelizing decryption of reads
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > New smatch warnings:
> > fs/cifs/smb2ops.c:4056 smb2_decrypt_offload() error: we previously assu=
med 'mid' could be null (see line 4045)
> >
> > git remote add cifs git://git.samba.org/sfrench/cifs-2.6.git
> > git remote update cifs
> > git checkout a091c5f67c994d154e8faf95ab774644be2f4dd7
> > vim +/mid +4056 fs/cifs/smb2ops.c
> >
> > a091c5f67c994d Steve French 2019-09-07  4030  static void smb2_decrypt_=
offload(struct work_struct *work)
> > a091c5f67c994d Steve French 2019-09-07  4031  {
> > a091c5f67c994d Steve French 2019-09-07  4032    struct smb2_decrypt_wor=
k *dw =3D container_of(work,
> > a091c5f67c994d Steve French 2019-09-07  4033                           =
 struct smb2_decrypt_work, decrypt);
> > a091c5f67c994d Steve French 2019-09-07  4034    int i, rc;
> > a091c5f67c994d Steve French 2019-09-07  4035    struct mid_q_entry *mid=
;
> > a091c5f67c994d Steve French 2019-09-07  4036
> > a091c5f67c994d Steve French 2019-09-07  4037    rc =3D decrypt_raw_data=
(dw->server, dw->buf, dw->server->vals->read_rsp_size,
> > a091c5f67c994d Steve French 2019-09-07  4038                          d=
w->ppages, dw->npages, dw->len);
> > a091c5f67c994d Steve French 2019-09-07  4039    if (rc) {
> > a091c5f67c994d Steve French 2019-09-07  4040            cifs_dbg(VFS, "=
error decrypting rc=3D%d\n", rc);
> > a091c5f67c994d Steve French 2019-09-07  4041            goto free_pages=
;
> > a091c5f67c994d Steve French 2019-09-07  4042    }
> > a091c5f67c994d Steve French 2019-09-07  4043
> > a091c5f67c994d Steve French 2019-09-07  4044    mid =3D smb2_find_mid(d=
w->server, dw->buf);
> > a091c5f67c994d Steve French 2019-09-07 @4045    if (mid =3D=3D NULL)
> > a091c5f67c994d Steve French 2019-09-07  4046            cifs_dbg(FYI, "=
mid not found\n");
> >
> > Return here?
> >
> > a091c5f67c994d Steve French 2019-09-07  4047    else {
> > a091c5f67c994d Steve French 2019-09-07  4048            mid->decrypted =
=3D true;
> > a091c5f67c994d Steve French 2019-09-07  4049            rc =3D handle_r=
ead_data(dw->server, mid, dw->buf,
> > a091c5f67c994d Steve French 2019-09-07  4050                           =
       dw->server->vals->read_rsp_size,
> > a091c5f67c994d Steve French 2019-09-07  4051                           =
       dw->ppages, dw->npages, dw->len);
> > a091c5f67c994d Steve French 2019-09-07  4052    }
> > a091c5f67c994d Steve French 2019-09-07  4053
> > a091c5f67c994d Steve French 2019-09-07  4054    dw->server->lstrp =3D j=
iffies;
> > a091c5f67c994d Steve French 2019-09-07  4055
> > a091c5f67c994d Steve French 2019-09-07 @4056    mid->callback(mid);
> >                                                 ^^^^^^^^^^^^^
> > Potential NULL derference.
> >
> > a091c5f67c994d Steve French 2019-09-07  4057
> > a091c5f67c994d Steve French 2019-09-07  4058    cifs_mid_q_entry_releas=
e(mid);
> > a091c5f67c994d Steve French 2019-09-07  4059
> > a091c5f67c994d Steve French 2019-09-07  4060  free_pages:
> > a091c5f67c994d Steve French 2019-09-07  4061    for (i =3D dw->npages-1=
; i >=3D 0; i--)
> > a091c5f67c994d Steve French 2019-09-07  4062            put_page(dw->pp=
ages[i]);
> > a091c5f67c994d Steve French 2019-09-07  4063
> > a091c5f67c994d Steve French 2019-09-07  4064    kfree(dw->ppages);
> > a091c5f67c994d Steve French 2019-09-07  4065    cifs_small_buf_release(=
dw->buf);
> > a091c5f67c994d Steve French 2019-09-07  4066  }
> >
> > ---
> > 0-DAY kernel test infrastructure                Open Source Technology =
Center
> > https://lists.01.org/pipermail/kbuild-all                   Intel Corpo=
ration
>


--=20
Thanks,

Steve

--00000000000035f1660592764452
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-fix-potential-null-dereference-in-decrypt-offlo.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-fix-potential-null-dereference-in-decrypt-offlo.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k0inpdcv0>
X-Attachment-Id: f_k0inpdcv0

RnJvbSA5YjZlY2YzMjQ5OWIzMjI1OWVhMzA2ZmMzZTE1MGNlMjMzN2E4YjdiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IEZyaSwgMTMgU2VwIDIwMTkgMTY6NDc6MzEgLTA1MDAKU3ViamVjdDogW1BBVENIXSBz
bWIzOiBmaXggcG90ZW50aWFsIG51bGwgZGVyZWZlcmVuY2UgaW4gZGVjcnlwdCBvZmZsb2FkCgpj
b21taXQgYTA5MWM1ZjY3Yzk5ICgic21iMzogYWxsb3cgcGFyYWxsZWxpemluZyBkZWNyeXB0aW9u
IG9mIHJlYWRzIikKaGFkIGEgcG90ZW50aWFsIG51bGwgZGVyZWZlcmVuY2UKClJlcG9ydGVkLWJ5
OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KUmVwb3J0ZWQtYnk6IERhbiBDYXJw
ZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KU3VnZ2VzdGVkLWJ5OiBQYXZlbCBTaGls
b3Zza3kgPHBzaGlsb3ZAbWljcm9zb2Z0LmNvbT4KU2lnbmVkLW9mZi1ieTogU3RldmUgRnJlbmNo
IDxzdGZyZW5jaEBtaWNyb3NvZnQuY29tPgotLS0KIGZzL2NpZnMvc21iMm9wcy5jIHwgOSArKyst
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZnMvY2lmcy9zbWIyb3BzLmMgYi9mcy9jaWZzL3NtYjJvcHMuYwppbmRleCA1
Nzc2ZDdiMGE5N2UuLmVhZWQxODA2MTMxNCAxMDA2NDQKLS0tIGEvZnMvY2lmcy9zbWIyb3BzLmMK
KysrIGIvZnMvY2lmcy9zbWIyb3BzLmMKQEAgLTQwNTUsNiArNDA1NSw3IEBAIHN0YXRpYyB2b2lk
IHNtYjJfZGVjcnlwdF9vZmZsb2FkKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIAkJZ290byBm
cmVlX3BhZ2VzOwogCX0KIAorCWR3LT5zZXJ2ZXItPmxzdHJwID0gamlmZmllczsKIAltaWQgPSBz
bWIyX2ZpbmRfbWlkKGR3LT5zZXJ2ZXIsIGR3LT5idWYpOwogCWlmIChtaWQgPT0gTlVMTCkKIAkJ
Y2lmc19kYmcoRllJLCAibWlkIG5vdCBmb3VuZFxuIik7CkBAIC00MDYzLDE0ICs0MDY0LDEwIEBA
IHN0YXRpYyB2b2lkIHNtYjJfZGVjcnlwdF9vZmZsb2FkKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29y
aykKIAkJcmMgPSBoYW5kbGVfcmVhZF9kYXRhKGR3LT5zZXJ2ZXIsIG1pZCwgZHctPmJ1ZiwKIAkJ
CQkgICAgICBkdy0+c2VydmVyLT52YWxzLT5yZWFkX3JzcF9zaXplLAogCQkJCSAgICAgIGR3LT5w
cGFnZXMsIGR3LT5ucGFnZXMsIGR3LT5sZW4pOworCQltaWQtPmNhbGxiYWNrKG1pZCk7CisJCWNp
ZnNfbWlkX3FfZW50cnlfcmVsZWFzZShtaWQpOwogCX0KIAotCWR3LT5zZXJ2ZXItPmxzdHJwID0g
amlmZmllczsKLQotCW1pZC0+Y2FsbGJhY2sobWlkKTsKLQotCWNpZnNfbWlkX3FfZW50cnlfcmVs
ZWFzZShtaWQpOwotCiBmcmVlX3BhZ2VzOgogCWZvciAoaSA9IGR3LT5ucGFnZXMtMTsgaSA+PSAw
OyBpLS0pCiAJCXB1dF9wYWdlKGR3LT5wcGFnZXNbaV0pOwotLSAKMi4yMC4xCgo=
--00000000000035f1660592764452--

