Return-Path: <samba-technical-bounces@lists.samba.org>
Delivered-To: lists+samba-technical@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBCQDAukb2n0DgAAu9opvQ
	(envelope-from <samba-technical-bounces@lists.samba.org>)
	for <lists+samba-technical@lfdr.de>; Tue, 20 Jan 2026 16:49:31 +0100
X-Original-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 245CE46B66
	for <lists+samba-technical@lfdr.de>; Tue, 20 Jan 2026 16:49:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8ipcNo6HCzR9Xe4A7m7WEph8shxdLCWwkiU9CBCxJus=; b=LovzfB0CXIcA8JxFIoxUw0gMiJ
	rICYHFxZHoU79QB8A35aVUdNn5/P03GI1PZRp+tBOezJr5jbk0rL7dyOI4RYjT5y7nWS5m/n7S/mE
	TueAVXIAARxMf0J92FtHOLs3chi1qUSkB9yvc7A+NT7kpmxR2EVM9Jy++JvhNJPDEn+CRYiPDUNbi
	yITFz39ivnpFK5n2qoy/uc8rz2QfLjQFj2XpbeMLJeYUo+fdkIUCWNfS46xA+t1NhhrOHeRnyhWwK
	jP5TSbPboMzfbAHiL3PKGRc2Ngb7Dla5mkyIuHQ/OK7COIoNCewm+JwSjrb9lnItgFRzWpYIgxjKO
	VfqyaxPQ==;
Received: from ip6-localhost ([::1]:60554 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1viBhZ-000jR3-0K; Tue, 20 Jan 2026 13:23:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31]:54686) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1viBhT-000jQu-Lj
 for samba-technical@lists.samba.org; Tue, 20 Jan 2026 13:23:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 884E643FB6
 for <samba-technical@lists.samba.org>; Tue, 20 Jan 2026 13:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D84C4AF0B
 for <samba-technical@lists.samba.org>; Tue, 20 Jan 2026 13:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768914782;
 bh=tzEtq0KKqjNS4zyy1FqA0LcZcpoLgcAXtUvv1kBVNsE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NQvTq4mS26alwWrwI4xhOL1ERssj3+g+hglUQDDORgSyOgLOWhJ20+UNFLMsFyAAG
 0c1zRjiBR4LOxPIVMY8qK2AYKLaXpCojP1AMbqbnmvImoVcZHJlB/URR2oTYy9RwVn
 DUWaqoOetT0GQ+sFTA8KJpbWS9GfTCe7fqnFNQ1usuUHCbquRlXhfSbXyCt703yu6R
 WNf7K2ueV/M/9f1qyzEyZ44VJuwq+ce3P7ay3s0TLUG8gQEwJrRmxiKRIIM+14b/FB
 icgHw2W2xsq5PF7xxZKYLrgZIca6LZnuhVI3S02MSHneZOHKHfdkS201ibajDO7xpz
 qEQKRq+CKRdmQ==
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b87693c981fso892708666b.1
 for <samba-technical@lists.samba.org>; Tue, 20 Jan 2026 05:13:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXAyM8Ja2pcVnlla1aQqQgjPXUTQWKXYOJNB6GpILTpGzJMhq1gE5qvT+vFh/7FHZEMPQuxrjtTBVi4NtBt6+E=@lists.samba.org
X-Gm-Message-State: AOJu0Yy6/zJhEY+gIq6Jrdg/b98t0iQfei1los7SjdszP4XmL0BME2QA
 dt6E+WUTENuTTtLSnFgFxRuUBAyvBW0fQ5UbG5CzGj0FM0qaL8B/3fqwgu6r7tc5xMSkb7tMGf1
 4+3U9UKykrI9JJQwocU6j5SEHlM7BVYw=
X-Received: by 2002:a17:907:2d8c:b0:b87:365d:26b8 with SMTP id
 a640c23a62f3a-b8792f783e1mr1206435066b.35.1768914781032; Tue, 20 Jan 2026
 05:13:01 -0800 (PST)
MIME-Version: 1.0
References: <20251208154919.934760-1-metze@samba.org>
 <b5b92cae-d92a-426e-b6ad-fcaa9691b980@samba.org>
In-Reply-To: <b5b92cae-d92a-426e-b6ad-fcaa9691b980@samba.org>
Date: Tue, 20 Jan 2026 22:12:48 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9-BeHe7zU-xo0KZzmvzeba=BMvXOMNZnuW+yeqGcq19g@mail.gmail.com>
X-Gm-Features: AZwV_Qh9CVKbXimtnhH0quoMTgZe0wN1lycT7JouA0RLfhB_wFmkFmEBv-PnM1U
Message-ID: <CAKYAXd9-BeHe7zU-xo0KZzmvzeba=BMvXOMNZnuW+yeqGcq19g@mail.gmail.com>
Subject: Re: [PATCH] smb: server: reset smb_direct_port =
 SMB_DIRECT_PORT_INFINIBAND on init
To: Stefan Metzmacher <metze@samba.org>
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2a01:4f8:192:486::/64:c];
	R_DKIM_ALLOW(-0.20)[lists.samba.org:s=2954282];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.samba.org,reject];
	FREEMAIL_CC(0.00)[talpey.com,vger.kernel.org,lists.samba.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[talpey.com:email,samba.org:email,mail.gmail.com:mid,lists.samba.org:dkim];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20201202];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:metze@samba.org,m:tom@talpey.com,m:linux-cifs@vger.kernel.org,m:samba-technical@lists.samba.org,m:smfrench@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[samba-technical@lists.samba.org,samba-technical-bounces@lists.samba.org];
	FORWARDED(0.00)[samba-technical@lists.samba.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[samba-technical@lists.samba.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[samba-technical@lists.samba.org,samba-technical-bounces@lists.samba.org];
	DKIM_TRACE(0.00)[lists.samba.org:+,kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[samba-technical];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:24940, ipnet:2a01:4f8::/32, country:DE];
	HAS_REPLYTO(0.00)[linkinjeon@kernel.org]
X-Rspamd-Queue-Id: 245CE46B66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 2:40=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Hi Namjae,
>
> can this be merged? It makes testing between roce and iwarp
> much easier.
Looks ok. Applied it to #ksmbd-for-nex-next.
>
> I have infrastructure to listen on both iwarp and roce
> at the same time, but I haven't written the patches for
> ksmbd.ko to use it. I'll hopefully find the time
> in the next days.
I also hope it will be supported soon.
Thanks!
>
> Thanks!
> metze
>
>
> Am 08.12.25 um 16:49 schrieb Stefan Metzmacher:
> > This allows testing with different devices (iwrap vs. non-iwarp) withou=
t
> > 'rmmod ksmbd && modprobe ksmbd', but instead
> > 'ksmbd.control -s && ksmbd.mountd' is enough.
> >
> > In the long run we want to listen on iwarp and non-iwarp at the same ti=
me,
> > but requires more changes, most likely also in the rdma layer.
> >
> > Cc: Namjae Jeon <linkinjeon@kernel.org>
> > Cc: Steve French <smfrench@gmail.com>
> > Cc: Tom Talpey <tom@talpey.com>
> > Cc: linux-cifs@vger.kernel.org
> > Cc: samba-technical@lists.samba.org
> > Signed-off-by: Stefan Metzmacher <metze@samba.org>
> > ---
> >   fs/smb/server/transport_rdma.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_r=
dma.c
> > index f585359684d4..05f008ea51cd 100644
> > --- a/fs/smb/server/transport_rdma.c
> > +++ b/fs/smb/server/transport_rdma.c
> > @@ -2708,6 +2708,7 @@ int ksmbd_rdma_init(void)
> >   {
> >       int ret;
> >
> > +     smb_direct_port =3D SMB_DIRECT_PORT_INFINIBAND;
> >       smb_direct_listener.cm_id =3D NULL;
> >
> >       ret =3D ib_register_client(&smb_direct_ib_client);
>

