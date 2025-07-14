Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F62DB0468A
	for <lists+samba-technical@lfdr.de>; Mon, 14 Jul 2025 19:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=TAUcekZTSbbnjQ9iCGpnMI2DRkfrJFHhbVGWyYUqFS0=; b=mU624GsfbONTrdLEEWL3OtPwX5
	RnyByTbCd/5ZLSOcHuyUJlJ4iroFpe0uBWE4+Re+xzABEC5c4eeoDKdEf4Vc78x+NnsbpvwRs2Eis
	/RdTXtOucRv9ynFSOKJ1kXwAs0R1NGTNsqKQvtU0kUfJ3Wsp5QBxcEdjAyAFB5Ui4zWr8nJ9cYnwL
	M4nDSZzjFyBMsGicV7trt3oY+PAzdWXwcsMpAQQhxdZcUB1gWlbwmir3EGU3dGnbxpWdoaZ/3VDlc
	sEisEIStLtJw0FChc7poW1M42tySoYP+9Mp3IvNKnKEgaDimv8eujFdBvw+a2w6Qep4LuOSVQJSA4
	k7RDQo9A==;
Received: from ip6-localhost ([::1]:63068 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ubN1P-00BDcb-8u; Mon, 14 Jul 2025 17:31:23 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:44459) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ubN1I-00BDcU-TD
 for samba-technical@lists.samba.org; Mon, 14 Jul 2025 17:31:20 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-702cbfe860cso44268976d6.1
 for <samba-technical@lists.samba.org>; Mon, 14 Jul 2025 10:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752514275; x=1753119075; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TAUcekZTSbbnjQ9iCGpnMI2DRkfrJFHhbVGWyYUqFS0=;
 b=JiN90IIWTX4ub/H0gPMIpVBKh6vDs35vmt3kI2CRmN8UByMpB6RF+SD0qaWNzHvg3S
 WV3PRYuYAbeX5jr+4c31v4LOt8joPqlURDMnuDiyJ3O07s7BexBqj1m3W7szUaYjJ0gL
 m9uNpf6JQcGMC5MkeyF6zIoYefi5p5aymTzd0zUhSKyiPBR6g3fUsrAT2hbScvwwCIo9
 J/kTqXe8LdaM+k1uAjhGBS9DcfQUp6nE7QEe6A0dSYhoymg0kin0J+FPikUOQeUTW0nD
 llAxUvq9DOEmuojJI6RU9Fl0iXtoyRua/o9sO0cEb5p3UNsQY76Uk9g17mfOko7lgabH
 PDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752514275; x=1753119075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TAUcekZTSbbnjQ9iCGpnMI2DRkfrJFHhbVGWyYUqFS0=;
 b=PTsqwqUwIbBYfT/+s20yvN50eKCUyMWaIbLdvIGHpqHRZUejhB3MOQzq2AamG2ULfc
 aqgJ9DsWOqYE3egXduAj/9TZ/6JmDfodpfRTP743N2ILumdfl5x2tETtmKma2pLgig25
 EvESSdJ3wBJF+plj/VcjovzH/sH8G+evdB/BX/NgP9YCMGiiiEmKR87C8mL+wmLU5PqD
 XygpdhrFyZUVamYA4qvlLRr2lKAUcWH2OFfikUiuqk8s3FWeNa9yiDcyGdlAU1x1FDAJ
 rEBMVQzn2IPh5hyt0uZyXmFFnaKVWgNZRF7X3lYqbjHumaJQ57OfkymSbRCltSV0UFQG
 vOBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOsyV7GbD5HplcK8NSPmB9vmIYBJzhXaFL0WZz00X2OBTZN2RSFQ74C8JzQGbuqheVjRVuBp6dQYB/7JyQ0ms=@lists.samba.org
X-Gm-Message-State: AOJu0YwXu8c307iXi7GEI/LHbexnCJlAHIZV6n++088eBdO20rQ8pAYK
 ySU7AzqmSvqq90tRV3vIlduCgCqmeMuCacwFdvMfvm4zhvrmzL5EpvLPvHI0Otpz8SWXBRODR/a
 qw6svcI4HMYKXub07YLxraaIU08iEazk=
X-Gm-Gg: ASbGnctL27NZ5iFCOwsYkYWs34NhYjBsKtfKlUXlMM5Sdibwg+PGPU2LvRidmYf90Dy
 780ziLlFuMd5+7HIFVDR0bQdScZvxPQ+mRqBkx/0y62DkDV4azkUSLxXuJvaK4HTEsrEl0c6Sp5
 c8yp0GROhUg7xG+YA+bgUb7nm/4A/y196oeZxmCnzFZys+R1Dy5J6IUxNpgyHte9nnTedV3nTcV
 IYeHfjy5wVcZCRyPldctQjeMpV07PiUfNnFGbeUNA==
X-Google-Smtp-Source: AGHT+IG4FtpvRedJZf3hiyetQ//slqTthyU/gOcJhJNeC8EMT7HjT1WjEJP2E95oycFDl1BEtPGhTrFsQPB6DtDjHvQ=
X-Received: by 2002:a05:6214:5d0c:b0:6f8:e66b:578e with SMTP id
 6a1803df08f44-704a70328d0mr215909776d6.32.1752514274721; Mon, 14 Jul 2025
 10:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5muQGDkaHL78JOcgsfjL_=A64Xm9CrCBSKgOMABOjcg44w@mail.gmail.com>
 <CAH2r5msdLbvGMARXJ=V9wt0pvXJOrc=zh3eUfeF9AXEeshtByg@mail.gmail.com>
 <aHRo9VfMDIfK5MR6@jeremy-HP-Z840-Workstation>
 <42e549c1-0f92-4b95-b62b-3e0efab9aa10@samba.org>
 <5519b2d9-600c-4a3f-b44f-594877417df7@samba.org>
 <20250714165844.4hctlrwegfspiius@pali>
In-Reply-To: <20250714165844.4hctlrwegfspiius@pali>
Date: Mon, 14 Jul 2025 12:31:03 -0500
X-Gm-Features: Ac12FXyJKlWCdvZJ4yTBnDKpC_uW6aM04Gf_6hGmIItvlwzAZDiqush6GMbjknM
Message-ID: <CAH2r5ms9Lt3h9q2B6VsbhkoM=_yEdpFXguiHRrrkbsrbkp6j=Q@mail.gmail.com>
Subject: Re: Samba support for creating special files (via reparse points)
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Paulo Alcantara <pc@manguebit.org>,
 samba-technical <samba-technical@lists.samba.org>, vl@samba.org,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> It does not matter if the client or server is POSIX or not. Also on
> POSIX systems there are filesystems without the support for special
> files and it is common scenario on more UNIX systems that for particular
> mount are special files completely disabled for security reasons.

If it is disabled for security reasons, then probably better to still
send the request and let the server return the correct return code
(e.g. access denied rather than "not supported").   But for Linux fs
the only examples I can think of where all special files are disabled
are VFAT and some pseudo-filesystems like /proc

On Mon, Jul 14, 2025 at 11:58=E2=80=AFAM Pali Roh=C3=A1r <pali@kernel.org> =
wrote:
>
> On Monday 14 July 2025 10:23:17 Ralph Boehme wrote:
> > On 7/14/25 8:01 AM, Ralph Boehme via samba-technical wrote:
> > > On 7/14/25 4:18 AM, Jeremy Allison wrote:
> > > > It's an oversight I'm afraid.
> > >
> > > hm... it seems reparse points support is mandatory for SMB3 POSIX so =
I
> > > wonder what this additional checks buys us.
>
> No. It is not mandatory. Getting or setting of reparse points is done
> via IOCTLs which are optional. Also fs attribute for reparse points is
> optional.
>
> And that make sense as there are still lot of filesystems which do not
> support reparse points (e.g. FAT) and this fs attribute is exactly what
> server announce for clients and applications to tell feature support.
> So application would know what features are provided and which not on
> particular share. Server can support reparse points on share A but does
> not have to support it on share B. E.g. when A is NTFS and B is FAT.
>
> > > While I agree that generally we should likely set this, for SMB3 POSI=
X
> > > the client should probably not check this and we should keep it out o=
f
> > > the spec.
> >
> > one additional thought: it seems like a valid scenario to be able to su=
pport
> > SMB3 POSIX on a server that does not support xattrs on the backing
> > filesystem and hence may not have a way of storing arbitrary reparse po=
ints.
>
> xattrs and reparse points are two completely different things, and they
> should not be mixed or exchanged.
>
> For example FAT on older Windows versions supported xattrs (I'm not sure
> if recent Windows version still support them), but does not and never
> supported reparse points.
>
> For checking if xattrs (in MS terminology called Extended Attributes or
> abbrev EAs) there is a fs attribute FILE_SUPPORTS_EXTENDED_ATTRIBUTES.
>
> Again, application can check if server share supports xattrs by this
> fs attribute and decide what to do next.
>
> > In SMB3 POSIX we're just using them as a wire transport, not necessaril=
y
> > expecting full support from the server.
> >
> > Hence, for Samba I see the following change
> >
> >     smbd: announce support for FILE_SUPPORTS_REPARSE_POINTS if the shar=
e
> > supports EAs
>
> FILE_SUPPORTS_EXTENDED_ATTRIBUTES (0x00800000) !=3D FILE_SUPPORTS_REPARSE=
_POINTS (0x80)
>
> > ---
> >  source3/smbd/vfs.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/source3/smbd/vfs.c b/source3/smbd/vfs.c
> > index 76895f52e039..ea3fa4c8784f 100644
> > --- a/source3/smbd/vfs.c
> > +++ b/source3/smbd/vfs.c
> > @@ -1345,6 +1345,9 @@ uint32_t vfs_get_fs_capabilities(struct
> > connection_struct *conn,
> >         if (lp_nt_acl_support(SNUM(conn))) {
> >                 caps |=3D FILE_PERSISTENT_ACLS;
> >         }
> > +       if (lp_ea_support(SNUM(conn))) {
> > +               caps |=3D FILE_SUPPORTS_REPARSE_POINTS;
> > +       }
> >
> >         caps |=3D lp_parm_int(SNUM(conn), "share", "fake_fscaps", 0);
> >
> > https://gitlab.com/samba-team/samba/-/merge_requests/4104
> >
> > For the client this would mean, it must allow reparse points for the sp=
ecial
> > files if SMB3 POSIX is negotiated.
> >
> > Makes sense?
> >
> > -slow
>
> I do not think that this is a good idea at all. It would just complicate
> things, make more incompatibilities and prevent using FAT or any other
> filesystem without mknod support, including cases when server itself is
> configured to not support mknod for e.g. security reasons.
>
> FILE_SUPPORTS_REPARSE_POINTS is per-share fs attribute which says if the
> reparse point of any type are supported. If it was decided that special
> files, like fifos or character devices are represented as reparse points
> then for share/filesystem on which are special files supported, server
> has to announce the FILE_SUPPORTS_REPARSE_POINTS fs attribute.
>
> And if the server itself supports special files, but particular
> filesystem like FAT does not support it, then server should not announce
> the FILE_SUPPORTS_REPARSE_POINTS fs attribute.
>
> This is how it was designed and how it is used.
>
> It does not matter if the client or server is POSIX or not. Also on
> POSIX systems there are filesystems without the support for special
> files and it is common scenario on more UNIX systems that for particular
> mount are special files completely disabled for security reasons.
>
>
> So the result is that also when POSIX extensions are negotiated, it is
> important and required to know by POSIX client whether particular
> exported share supports reparse points / special files or not.
> And FILE_SUPPORTS_REPARSE_POINTS is already there for it.



--=20
Thanks,

Steve

