Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3A1B064EF
	for <lists+samba-technical@lfdr.de>; Tue, 15 Jul 2025 19:08:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ddvGN+rLSCBQUAL799t/0Ffiq8mPRK+5qqR1wncm+EI=; b=fR/Tp/8Xhq58QJVOIokUpUhvV4
	INFSz7BNJuh6FGlkzVNVkQ7GFzQgDxVO8GM9Q09ih6oK5kv8oFJ8xIFBZ4Cab202U1Ha2tzkZYY6L
	Hy5CFN0z2t9/why8MqU80gt+KuSuDwcQI06t3QqQpHAv4Ob+l2x0R0h/487SvLKAPoIq/GNBAEf6r
	BmWuoUtuAobRWUtkdBoVA+QRGKx042/gwb+uSQhIVwO0+tfjNWVOg2F7vQQ+i+eodKQ6Fmx7OHfWa
	slVEmFFdCvyd1Yo+hEB1fIcQxx9TsfwDt1KTVk2TBExxJ/JH1988pSTjgkKkr/V/EunP3JH7Y2JgW
	YePqNRFQ==;
Received: from ip6-localhost ([::1]:47984 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ubj8V-00BGmh-N0; Tue, 15 Jul 2025 17:08:11 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:48586) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ubj8O-00BGmZ-Js
 for samba-technical@lists.samba.org; Tue, 15 Jul 2025 17:08:07 +0000
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-4ab6e66ea68so27285591cf.1
 for <samba-technical@lists.samba.org>; Tue, 15 Jul 2025 10:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752599283; x=1753204083; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ddvGN+rLSCBQUAL799t/0Ffiq8mPRK+5qqR1wncm+EI=;
 b=XiD6MfwO4y0GyADefLkpXClyjOt0ru5/TOd/3gU8HMhVkILzpeezVrmQsZxl/bcp6h
 hz5zPev1J4JXZQBAwuOAkJPjIHFmhIGb95q22av1JQOiZM6YUxK/s3jMpu1DDArAHfPy
 lFDCAhxzXiwaXVJjp67n21RWDSTEBJqGf2+zYNrgdpdOE3LLtnQiUXmM5dY4+JlCEwFT
 TXo460T69mu5AE0zUtxOZNL47KwDLBC6qTOSMoBY90F7GITgMXrfbCcZ0xIfVLDtbFNU
 VUNagmwW9jHpIMTWafPG9+BrvFIJe0R8YQAa/feiPzTbNKn6t+DZ2O0a3S/PdioQE6Hj
 0KTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752599283; x=1753204083;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ddvGN+rLSCBQUAL799t/0Ffiq8mPRK+5qqR1wncm+EI=;
 b=xCeYnYWlNdsyDnnVFgaxn9W9GXYes0CcLU2lm+AhWgaXsxPqi1GqOLJ0HOyaF0BnDX
 0UPnzs1gxM5Z0c7WKZoAA+q5yl5IrhACYcEPJr/aSBl2OTchrcfUspRGXAqa3Hluf8xR
 DHwPQGmdVKXgDmNZ6NAMTYcvjoQLrDN0SbpxZj16KHwtp+C/jgIoS97ZcfbvzPafqm98
 aQK+yEjO5pWv8fOqQDwCdnoqnZlKpdJw/3GYWG6yh/aH+rgVwCG1M8HTjkJ4/JtnbEwK
 soLTqw8xuYRNA+YfdFcHNaha2ZtfvsRkxaQ1y2NEA47BkMtZSZog+scELvcjDWsHY93E
 ebnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2PY1ed61hnVpXGuF26nTe831n6yYS6mxhhxAxOvU8zee/5ARVnERHJhldgzDd0W5A2HpzBSWpepYP5bX9A1E=@lists.samba.org
X-Gm-Message-State: AOJu0Yw+Do/j7sXLZ5c7q2Z9oIO4Asijwz08Q8VcdmZjvH3mkdXWIIKp
 UC55KNUMoYw8GKGNOPend/Q10nEAOMzKki45zTHECxqSZKr7lZvYD4EqIl9uf7rvjHZ6gRAhbUw
 mO0IKaQVHNKwewikGPYyz4DIMEGfIr4k=
X-Gm-Gg: ASbGncuwKEeshdSX5vZ/KWtNyMZ8Lm2Qv6Zo0UG2MdbfwQDz5xxdtrBmCM0dujNIK+s
 PmJ2cU7iRtecSxc02F9eLciHw588nvlSzgK7Xz4yqVVAWgZxUJDX4MKy6Zztegnp8f4GfAFRPqX
 9TJmIgi58co5xKux3P5nKGkZNcI5dLLG8aiuLU0DnAiaC9tyBxJnKU5vyRDIjSIPirdvJwXTsJS
 yrt8I4tbsYtHtGi3JX1BvucAsBfVIC1ss9JwZom
X-Google-Smtp-Source: AGHT+IGl18I8wSFRg3pzRlBSgUHj9cFx4GWI7KnJMg7FAehUJNVUPaIuFGfzfMqufKMlUoPBG6ooDPpOj4RueskEI2Q=
X-Received: by 2002:ac8:5a46:0:b0:4ab:77c2:af0a with SMTP id
 d75a77b69052e-4ab9098125bmr4072941cf.3.1752599281951; Tue, 15 Jul 2025
 10:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5msdLbvGMARXJ=V9wt0pvXJOrc=zh3eUfeF9AXEeshtByg@mail.gmail.com>
 <aHRo9VfMDIfK5MR6@jeremy-HP-Z840-Workstation>
 <42e549c1-0f92-4b95-b62b-3e0efab9aa10@samba.org>
 <5519b2d9-600c-4a3f-b44f-594877417df7@samba.org>
 <20250714165844.4hctlrwegfspiius@pali>
 <CAH2r5ms9Lt3h9q2B6VsbhkoM=_yEdpFXguiHRrrkbsrbkp6j=Q@mail.gmail.com>
 <20250714192404.j3dw6l3afgm2voe6@pali>
 <CAH2r5msRGGHyy0GdNgVYBVN+8NzfevDS-wtzr9TO5jF5NmoxHQ@mail.gmail.com>
 <20250714211016.zqddwjdvybeplgdf@pali>
 <CAH2r5mumdvhWTNOCEGV-dT8aQVJrUQEDep0GEBn_CbKF+o3kjQ@mail.gmail.com>
 <20250715080911.julhkkcf7an56q4w@pali>
In-Reply-To: <20250715080911.julhkkcf7an56q4w@pali>
Date: Tue, 15 Jul 2025 12:07:50 -0500
X-Gm-Features: Ac12FXyeXBmUa92csKI2DTxG4hKOJy0Ry1bLetfgXTDsn4Y7zWlUyqakK7-dMHY
Message-ID: <CAH2r5mvAuffmNwgJZ=n3m4aj4Xn45unK1ENPEdL_=pG-S3XHCw@mail.gmail.com>
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
 samba-technical <samba-technical@lists.samba.org>,
 "vl@samba.org" <vl@samba.org>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jul 15, 2025 at 3:09=E2=80=AFAM Pali Roh=C3=A1r <pali@kernel.org> w=
rote:
>
> On Monday 14 July 2025 22:28:45 Steve French wrote:
> > On Mon, Jul 14, 2025 at 4:10=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.or=
g> wrote:
> > >
> > > On Monday 14 July 2025 15:30:26 Steve French wrote:
> > > > > But generally this is not Linux centric, but rather generic to an=
y other
> > > > implementations.
> > > >
> > > >
> > > > If they are supporting the SMB311 Linux Extensions why wouldn't the=
y want
> > > > to support special files? All of the servers which currently suppor=
t the
> > > > extensions do
> > > > Thanks,
> > >
> > > Because of that possible filesystem limitation (like fat or proc or f=
use).
> >
> > That is a moot point because even if the mount has FAT or FUSE mounts
> > under it, the server can still support reparse points on that share.  A=
 share
> > often crosses fs type boundaries, so it is always going to be possible =
to
> > setup a share where creating special files will work for only some of t=
he
> > subdirectories - but at least for those cases with the suggested change
> > we will return a more accurate return code (e.g. EACCES in some cases)
>
> That is not fully truth. Crossing a mount point in mounted SMB share is
> signaled by the new mount point over SMB and so the SMB client is
> interpreting it like a new share and reading fs attributes for that

That does not look correct.
I just tried this to Samba (mounting to the root of my laptop, and cd into
various subdirectories on various mounts with fs) and none of them triggere=
d
query fs information.

> crossed path. Linux SMB client is already doing it and correctly handles
> crossed mount points. It also shows crosses in the "mount" output.

Looking at mount output I see no difference after crossing multiple
mount points under the same share, no automounts were created eg
and nothing new shows up in /proc/fs/cifs/DebugData or /proc/mounts

> > > > Steve
> > > >
> > > > On Mon, Jul 14, 2025, 2:24=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.=
org> wrote:
> > > >
> > > > > On Monday 14 July 2025 12:31:03 Steve French wrote:
> > > > > > > It does not matter if the client or server is POSIX or not. A=
lso on
> > > > > > > POSIX systems there are filesystems without the support for s=
pecial
> > > > > > > files and it is common scenario on more UNIX systems that for
> > > > > particular
> > > > > > > mount are special files completely disabled for security reas=
ons.
> > > > > >
> > > > > > If it is disabled for security reasons, then probably better to=
 still
> > > > > > send the request and let the server return the correct return c=
ode
> > > > > > (e.g. access denied rather than "not supported").   But for Lin=
ux fs
> > > > > > the only examples I can think of where all special files are di=
sabled
> > > > > > are VFAT and some pseudo-filesystems like /proc
> > > > >
> > > > > In case it is disabled for security reasons and server wants to a=
nnounce
> > > > > that it is "available but disabled for security reasons" rather t=
han
> > > > > "not support at all", then yes it makes sense to send the request=
 and
> > > > > let it fail with ACCESS error with all those cleanup related issu=
es.
> > > > > But in this case server should announce the support that it is av=
ailable
> > > > > for clients.
> > > > >
> > > > > In Linux it is not only VFAT. It is also slightly modern exfat. A=
nd also
> > > > > whatever is connected over fuse to userspace.
> > > > >
> > > > > But generally this is not Linux centric, but rather generic to an=
y other
> > > > > implementations.
> > > > >
> > > > > > On Mon, Jul 14, 2025 at 11:58=E2=80=AFAM Pali Roh=C3=A1r <pali@=
kernel.org> wrote:
> > > > > > >
> > > > > > > On Monday 14 July 2025 10:23:17 Ralph Boehme wrote:
> > > > > > > > On 7/14/25 8:01 AM, Ralph Boehme via samba-technical wrote:
> > > > > > > > > On 7/14/25 4:18 AM, Jeremy Allison wrote:
> > > > > > > > > > It's an oversight I'm afraid.
> > > > > > > > >
> > > > > > > > > hm... it seems reparse points support is mandatory for SM=
B3 POSIX
> > > > > so I
> > > > > > > > > wonder what this additional checks buys us.
> > > > > > >
> > > > > > > No. It is not mandatory. Getting or setting of reparse points=
 is done
> > > > > > > via IOCTLs which are optional. Also fs attribute for reparse =
points is
> > > > > > > optional.
> > > > > > >
> > > > > > > And that make sense as there are still lot of filesystems whi=
ch do not
> > > > > > > support reparse points (e.g. FAT) and this fs attribute is ex=
actly what
> > > > > > > server announce for clients and applications to tell feature =
support.
> > > > > > > So application would know what features are provided and whic=
h not on
> > > > > > > particular share. Server can support reparse points on share =
A but does
> > > > > > > not have to support it on share B. E.g. when A is NTFS and B =
is FAT.
> > > > > > >
> > > > > > > > > While I agree that generally we should likely set this, f=
or SMB3
> > > > > POSIX
> > > > > > > > > the client should probably not check this and we should k=
eep it
> > > > > out of
> > > > > > > > > the spec.
> > > > > > > >
> > > > > > > > one additional thought: it seems like a valid scenario to b=
e able to
> > > > > support
> > > > > > > > SMB3 POSIX on a server that does not support xattrs on the =
backing
> > > > > > > > filesystem and hence may not have a way of storing arbitrar=
y reparse
> > > > > points.
> > > > > > >
> > > > > > > xattrs and reparse points are two completely different things=
, and they
> > > > > > > should not be mixed or exchanged.
> > > > > > >
> > > > > > > For example FAT on older Windows versions supported xattrs (I=
'm not
> > > > > sure
> > > > > > > if recent Windows version still support them), but does not a=
nd never
> > > > > > > supported reparse points.
> > > > > > >
> > > > > > > For checking if xattrs (in MS terminology called Extended Att=
ributes or
> > > > > > > abbrev EAs) there is a fs attribute FILE_SUPPORTS_EXTENDED_AT=
TRIBUTES.
> > > > > > >
> > > > > > > Again, application can check if server share supports xattrs =
by this
> > > > > > > fs attribute and decide what to do next.
> > > > > > >
> > > > > > > > In SMB3 POSIX we're just using them as a wire transport, no=
t
> > > > > necessarily
> > > > > > > > expecting full support from the server.
> > > > > > > >
> > > > > > > > Hence, for Samba I see the following change
> > > > > > > >
> > > > > > > >     smbd: announce support for FILE_SUPPORTS_REPARSE_POINTS=
 if the
> > > > > share
> > > > > > > > supports EAs
> > > > > > >
> > > > > > > FILE_SUPPORTS_EXTENDED_ATTRIBUTES (0x00800000) !=3D
> > > > > FILE_SUPPORTS_REPARSE_POINTS (0x80)
> > > > > > >
> > > > > > > > ---
> > > > > > > >  source3/smbd/vfs.c | 3 +++
> > > > > > > >  1 file changed, 3 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/source3/smbd/vfs.c b/source3/smbd/vfs.c
> > > > > > > > index 76895f52e039..ea3fa4c8784f 100644
> > > > > > > > --- a/source3/smbd/vfs.c
> > > > > > > > +++ b/source3/smbd/vfs.c
> > > > > > > > @@ -1345,6 +1345,9 @@ uint32_t vfs_get_fs_capabilities(stru=
ct
> > > > > > > > connection_struct *conn,
> > > > > > > >         if (lp_nt_acl_support(SNUM(conn))) {
> > > > > > > >                 caps |=3D FILE_PERSISTENT_ACLS;
> > > > > > > >         }
> > > > > > > > +       if (lp_ea_support(SNUM(conn))) {
> > > > > > > > +               caps |=3D FILE_SUPPORTS_REPARSE_POINTS;
> > > > > > > > +       }
> > > > > > > >
> > > > > > > >         caps |=3D lp_parm_int(SNUM(conn), "share", "fake_fs=
caps", 0);
> > > > > > > >
> > > > > > > > https://gitlab.com/samba-team/samba/-/merge_requests/4104
> > > > > > > >
> > > > > > > > For the client this would mean, it must allow reparse point=
s for the
> > > > > special
> > > > > > > > files if SMB3 POSIX is negotiated.
> > > > > > > >
> > > > > > > > Makes sense?
> > > > > > > >
> > > > > > > > -slow
> > > > > > >
> > > > > > > I do not think that this is a good idea at all. It would just
> > > > > complicate
> > > > > > > things, make more incompatibilities and prevent using FAT or =
any other
> > > > > > > filesystem without mknod support, including cases when server=
 itself is
> > > > > > > configured to not support mknod for e.g. security reasons.
> > > > > > >
> > > > > > > FILE_SUPPORTS_REPARSE_POINTS is per-share fs attribute which =
says if
> > > > > the
> > > > > > > reparse point of any type are supported. If it was decided th=
at special
> > > > > > > files, like fifos or character devices are represented as rep=
arse
> > > > > points
> > > > > > > then for share/filesystem on which are special files supporte=
d, server
> > > > > > > has to announce the FILE_SUPPORTS_REPARSE_POINTS fs attribute=
.
> > > > > > >
> > > > > > > And if the server itself supports special files, but particul=
ar
> > > > > > > filesystem like FAT does not support it, then server should n=
ot
> > > > > announce
> > > > > > > the FILE_SUPPORTS_REPARSE_POINTS fs attribute.
> > > > > > >
> > > > > > > This is how it was designed and how it is used.
> > > > > > >
> > > > > > > It does not matter if the client or server is POSIX or not. A=
lso on
> > > > > > > POSIX systems there are filesystems without the support for s=
pecial
> > > > > > > files and it is common scenario on more UNIX systems that for
> > > > > particular
> > > > > > > mount are special files completely disabled for security reas=
ons.
> > > > > > >
> > > > > > >
> > > > > > > So the result is that also when POSIX extensions are negotiat=
ed, it is
> > > > > > > important and required to know by POSIX client whether partic=
ular
> > > > > > > exported share supports reparse points / special files or not=
.
> > > > > > > And FILE_SUPPORTS_REPARSE_POINTS is already there for it.
> > > > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > > Thanks,
> > > > > >
> > > > > > Steve
> > > > >
> >
> >
> >
> > --
> > Thanks,
> >
> > Steve



--=20
Thanks,

Steve

