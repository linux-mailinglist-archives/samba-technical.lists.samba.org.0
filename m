Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F541B0674B
	for <lists+samba-technical@lfdr.de>; Tue, 15 Jul 2025 21:55:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8qzRlcwXYg6AwwPiXWehxsYQ3+UfrM1J6NX9J6Fau04=; b=vEsxQwXnVpTqKmRd1AaANE9LAh
	zHm9B6rsduRa697ILaGI3R/Pn1OnOi7etS6SUOv6lic7iwa/f628jJSHA7xGh+xAI667gcyJ0J18q
	ihuMov0MH1DiVcGWYQxbMh4/dsyume3v3y5Qb/S2lfgqqJLByBnCN2H5I+dabtGVp+g+I7FmdDseV
	BO3426krbUj8HEX7XDj7an0com5Fxxcs17GwAGosiKzFfvQraXf0CdlCWkSSElnUHEBPSJWR2byY5
	r0kknqdZNE7XEsszcb8rqdvSQi12CG1WzPY96M8HerH67OL9dnU2ZZlHE2fTa6UIkbzqlksk7uICC
	ZoJ4wVpg==;
Received: from ip6-localhost ([::1]:38332 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ubljo-00BGzp-18; Tue, 15 Jul 2025 19:54:52 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:44249) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ubljh-00BGzi-Dz
 for samba-technical@lists.samba.org; Tue, 15 Jul 2025 19:54:49 +0000
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-6facf4d8ea8so45750336d6.0
 for <samba-technical@lists.samba.org>; Tue, 15 Jul 2025 12:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752609283; x=1753214083; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8qzRlcwXYg6AwwPiXWehxsYQ3+UfrM1J6NX9J6Fau04=;
 b=bO7l0bq9G8x9nrIzo7fRs9L0K4W/jaF11BdK7u9uJ9VFaP1WXY4KuyEypSMrzWrYcC
 Ee8Zn1kPxj4Eo9gG7v0wAKtoo0iWn2+plx6u5Z2efgayLsxtdI4Qu7RoW6lzHaky9xzF
 HOMBk2sgG5exa2KpeJJ/DOeQPaYRs2ilUUpNU348VoOYoztdeqNx/YUcO1QOn8W6VgtP
 nNFWVXkiY4qXxFA6RQibK9Qg2Kfg+V+xdn8lBe9QX1IZHaD8ozS20TKYMdGaPS2S1zYR
 WWahfrqGMFXbmPRotn5gPyLclXgkh/d1Uu445nCnGT/kgZ6egXXVBdWH6NxPC4JAbji9
 6F2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752609283; x=1753214083;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8qzRlcwXYg6AwwPiXWehxsYQ3+UfrM1J6NX9J6Fau04=;
 b=w1eetlSm7Mo22laIL6kNtPWN4jUsmzPDv3YWcKGnCpBM6Su3duDYIi5Fa1eoUbyrPI
 AdctajuaX4dKbNr5ssP0C3SmGVU9g+NsWF2stN/yT711rhoR6ftQk7ai0jfw5GdlQ+J1
 jYr6XzSjHI0ixM9eCPQmar63XlWPfYQBv7+WQTlUhJXoAx+48BbqECDvT3gL9IPc2QUD
 pJKwuZISH8n00Ti3V+uP49w/lWzAozhv1+u9HO3ti8Q/03Qs6nLKzl+A4oHDHVIjtkBq
 dUuDsDxwsMUb3lnj/06J/R+3Tx0t436HxofyCCuEm8NoQh0O8GKMHMcFc3PvZiROsKNU
 YzIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKNUj7hOahJJKV9JtbJ/FTBhMTFdsQMHsntz7r/MGtUXRT2G3pHoHD5wvcxT5znI67Fo32kQUNO4u9fYjkWzM=@lists.samba.org
X-Gm-Message-State: AOJu0YxDlTOwRSu84U++Y5tuTW3r4vQUkx64QmzU8OP6mBI23UJDSAOU
 WR9qoA+HoFwccakYrNMQ68fXhsU47Ik24DanhxUnk3TC8hjOlbNYDd0VTS4aUoPqcsUiKaqxHZt
 RK/ljUW5gENo8uU0lXoH+68PrBejOe+X1Ez/D
X-Gm-Gg: ASbGncsQlSJenN83j2kGINOc7JpE2LC9HoMsZnA+rj2YYCvzEg46y08CyfOTBi2UBvw
 ocIj39fAgsfdKZyzpyBTOn2jjJTzVhGgdtr13w2Y3h4VrN1URPXDEzRQS1QEPbowemdbtzvNu5H
 u/qRgvDDZv88WtSJp/+Z+IUdMkwtTu7MYMYd9S+ntXnFre4JvVm3kiOweT46Wec0hZ3xd4ID2+y
 jUVmw==
X-Google-Smtp-Source: AGHT+IHe7gptNDXi9S0Ng4lUVo454Eurvj64qo/EpwernIpoMPhGGO8IhMleD+PDaRInXr9gA/AKjGpM5e3pXS7L5iA=
X-Received: by 2002:a05:6214:19cc:b0:701:9d0:1408 with SMTP id
 6a1803df08f44-704f4aac139mr9554436d6.20.1752609282320; Tue, 15 Jul 2025
 12:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <42e549c1-0f92-4b95-b62b-3e0efab9aa10@samba.org>
 <5519b2d9-600c-4a3f-b44f-594877417df7@samba.org>
 <20250714165844.4hctlrwegfspiius@pali>
 <CAH2r5ms9Lt3h9q2B6VsbhkoM=_yEdpFXguiHRrrkbsrbkp6j=Q@mail.gmail.com>
 <20250714192404.j3dw6l3afgm2voe6@pali>
 <CAH2r5msRGGHyy0GdNgVYBVN+8NzfevDS-wtzr9TO5jF5NmoxHQ@mail.gmail.com>
 <20250714211016.zqddwjdvybeplgdf@pali>
 <CAH2r5mumdvhWTNOCEGV-dT8aQVJrUQEDep0GEBn_CbKF+o3kjQ@mail.gmail.com>
 <20250715080911.julhkkcf7an56q4w@pali>
 <CAH2r5mvAuffmNwgJZ=n3m4aj4Xn45unK1ENPEdL_=pG-S3XHCw@mail.gmail.com>
 <20250715174321.7xko6gtmmlfsrjze@pali>
In-Reply-To: <20250715174321.7xko6gtmmlfsrjze@pali>
Date: Tue, 15 Jul 2025 14:54:31 -0500
X-Gm-Features: Ac12FXxBPQm4VZa0owHddwyJD8Q9oSmIJzSDTS5AcY5a_H7OLOSFh7NOBQcGY4k
Message-ID: <CAH2r5muQPRjpzWFLNJirhNjJ=DyJNusg-oNYOtQdxc2d-A7Hog@mail.gmail.com>
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

On Tue, Jul 15, 2025 at 12:43=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.org> =
wrote:
>
> On Tuesday 15 July 2025 12:07:50 Steve French wrote:
> > On Tue, Jul 15, 2025 at 3:09=E2=80=AFAM Pali Roh=C3=A1r <pali@kernel.or=
g> wrote:
> > >
> > > On Monday 14 July 2025 22:28:45 Steve French wrote:
> > > > On Mon, Jul 14, 2025 at 4:10=E2=80=AFPM Pali Roh=C3=A1r <pali@kerne=
l.org> wrote:
> > > > >
> > > > > On Monday 14 July 2025 15:30:26 Steve French wrote:
> > > > > > > But generally this is not Linux centric, but rather generic t=
o any other
> > > > > > implementations.
> > > > > >
> > > > > >
> > > > > > If they are supporting the SMB311 Linux Extensions why wouldn't=
 they want
> > > > > > to support special files? All of the servers which currently su=
pport the
> > > > > > extensions do
> > > > > > Thanks,
> > > > >
> > > > > Because of that possible filesystem limitation (like fat or proc =
or fuse).
> > > >
> > > > That is a moot point because even if the mount has FAT or FUSE moun=
ts
> > > > under it, the server can still support reparse points on that share=
.  A share
> > > > often crosses fs type boundaries, so it is always going to be possi=
ble to
> > > > setup a share where creating special files will work for only some =
of the
> > > > subdirectories - but at least for those cases with the suggested ch=
ange
> > > > we will return a more accurate return code (e.g. EACCES in some cas=
es)
> > >
> > > That is not fully truth. Crossing a mount point in mounted SMB share =
is
> > > signaled by the new mount point over SMB and so the SMB client is
> > > interpreting it like a new share and reading fs attributes for that
> >
> > That does not look correct.
> > I just tried this to Samba (mounting to the root of my laptop, and cd i=
nto
> > various subdirectories on various mounts with fs) and none of them trig=
gered
> > query fs information.
>
> I have tried it more times against Windows SMB server and it worked
> fine. I created mount point on SMB share, which is pointing to different
> filesystem on external disk with FAT and it is working fine on recent
> Windows Server 2022 and is working fine also on old Windows 2000. So
> seems that this is working fine for at least 25 years.
>
> I tried creating mount point via both GUI "diskmgmt.msc" tool (which
> allows to choose disk and then select mount point where to mount it on
> other disk e.g. C drive) and also via CLI "mountvol" command in cmd.exe,
> similar to UNIX mount command.
>
> If it does not work against Samba then it looks like Samba issue.

Not necessarily, but in any case until Windows supports SMB3.1.1 POSIX
extensions
it is moot point for the change to correctly check if SMB3.1.1 POSIX Extens=
ions
(not just check if the fsattr for supporting reparse points) is set.
Obviously a server
can (and will) support special files with SMB3.1.1 POSIX (emulating
them as reparse points over
the wire, but storing them however the server thinks is best) but some
will not support reparse points
generally (just in the narrow case for SMB3.1.1 POSIX Extensions)

> > > crossed path. Linux SMB client is already doing it and correctly hand=
les
> > > crossed mount points. It also shows crosses in the "mount" output.
> >
> > Looking at mount output I see no difference after crossing multiple
> > mount points under the same share, no automounts were created eg
> > and nothing new shows up in /proc/fs/cifs/DebugData or /proc/mounts
>
> When I accessed the mount point then I see a new line appeared in /proc/m=
ounts.
>
> And shell "stat" correctly shows different Device major/minor numbers
> for files inside the mount point and on the main share.

That is not the case to Samba (and presumably to some other servers as
well) although
it may be for Windows.   Windows handles junctions/links pointing to
different drives much
differently than Linux so am not surprised that the behavior differs.
> > > > > > Steve
> > > > > >
> > > > > > On Mon, Jul 14, 2025, 2:24=E2=80=AFPM Pali Roh=C3=A1r <pali@ker=
nel.org> wrote:
> > > > > >
> > > > > > > On Monday 14 July 2025 12:31:03 Steve French wrote:
> > > > > > > > > It does not matter if the client or server is POSIX or no=
t. Also on
> > > > > > > > > POSIX systems there are filesystems without the support f=
or special
> > > > > > > > > files and it is common scenario on more UNIX systems that=
 for
> > > > > > > particular
> > > > > > > > > mount are special files completely disabled for security =
reasons.
> > > > > > > >
> > > > > > > > If it is disabled for security reasons, then probably bette=
r to still
> > > > > > > > send the request and let the server return the correct retu=
rn code
> > > > > > > > (e.g. access denied rather than "not supported").   But for=
 Linux fs
> > > > > > > > the only examples I can think of where all special files ar=
e disabled
> > > > > > > > are VFAT and some pseudo-filesystems like /proc
> > > > > > >
> > > > > > > In case it is disabled for security reasons and server wants =
to announce
> > > > > > > that it is "available but disabled for security reasons" rath=
er than
> > > > > > > "not support at all", then yes it makes sense to send the req=
uest and
> > > > > > > let it fail with ACCESS error with all those cleanup related =
issues.
> > > > > > > But in this case server should announce the support that it i=
s available
> > > > > > > for clients.
> > > > > > >
> > > > > > > In Linux it is not only VFAT. It is also slightly modern exfa=
t. And also
> > > > > > > whatever is connected over fuse to userspace.
> > > > > > >
> > > > > > > But generally this is not Linux centric, but rather generic t=
o any other
> > > > > > > implementations.
> > > > > > >
> > > > > > > > On Mon, Jul 14, 2025 at 11:58=E2=80=AFAM Pali Roh=C3=A1r <p=
ali@kernel.org> wrote:
> > > > > > > > >
> > > > > > > > > On Monday 14 July 2025 10:23:17 Ralph Boehme wrote:
> > > > > > > > > > On 7/14/25 8:01 AM, Ralph Boehme via samba-technical wr=
ote:
> > > > > > > > > > > On 7/14/25 4:18 AM, Jeremy Allison wrote:
> > > > > > > > > > > > It's an oversight I'm afraid.
> > > > > > > > > > >
> > > > > > > > > > > hm... it seems reparse points support is mandatory fo=
r SMB3 POSIX
> > > > > > > so I
> > > > > > > > > > > wonder what this additional checks buys us.
> > > > > > > > >
> > > > > > > > > No. It is not mandatory. Getting or setting of reparse po=
ints is done
> > > > > > > > > via IOCTLs which are optional. Also fs attribute for repa=
rse points is
> > > > > > > > > optional.
> > > > > > > > >
> > > > > > > > > And that make sense as there are still lot of filesystems=
 which do not
> > > > > > > > > support reparse points (e.g. FAT) and this fs attribute i=
s exactly what
> > > > > > > > > server announce for clients and applications to tell feat=
ure support.
> > > > > > > > > So application would know what features are provided and =
which not on
> > > > > > > > > particular share. Server can support reparse points on sh=
are A but does
> > > > > > > > > not have to support it on share B. E.g. when A is NTFS an=
d B is FAT.
> > > > > > > > >
> > > > > > > > > > > While I agree that generally we should likely set thi=
s, for SMB3
> > > > > > > POSIX
> > > > > > > > > > > the client should probably not check this and we shou=
ld keep it
> > > > > > > out of
> > > > > > > > > > > the spec.
> > > > > > > > > >
> > > > > > > > > > one additional thought: it seems like a valid scenario =
to be able to
> > > > > > > support
> > > > > > > > > > SMB3 POSIX on a server that does not support xattrs on =
the backing
> > > > > > > > > > filesystem and hence may not have a way of storing arbi=
trary reparse
> > > > > > > points.
> > > > > > > > >
> > > > > > > > > xattrs and reparse points are two completely different th=
ings, and they
> > > > > > > > > should not be mixed or exchanged.
> > > > > > > > >
> > > > > > > > > For example FAT on older Windows versions supported xattr=
s (I'm not
> > > > > > > sure
> > > > > > > > > if recent Windows version still support them), but does n=
ot and never
> > > > > > > > > supported reparse points.
> > > > > > > > >
> > > > > > > > > For checking if xattrs (in MS terminology called Extended=
 Attributes or
> > > > > > > > > abbrev EAs) there is a fs attribute FILE_SUPPORTS_EXTENDE=
D_ATTRIBUTES.
> > > > > > > > >
> > > > > > > > > Again, application can check if server share supports xat=
trs by this
> > > > > > > > > fs attribute and decide what to do next.
> > > > > > > > >
> > > > > > > > > > In SMB3 POSIX we're just using them as a wire transport=
, not
> > > > > > > necessarily
> > > > > > > > > > expecting full support from the server.
> > > > > > > > > >
> > > > > > > > > > Hence, for Samba I see the following change
> > > > > > > > > >
> > > > > > > > > >     smbd: announce support for FILE_SUPPORTS_REPARSE_PO=
INTS if the
> > > > > > > share
> > > > > > > > > > supports EAs
> > > > > > > > >
> > > > > > > > > FILE_SUPPORTS_EXTENDED_ATTRIBUTES (0x00800000) !=3D
> > > > > > > FILE_SUPPORTS_REPARSE_POINTS (0x80)
> > > > > > > > >
> > > > > > > > > > ---
> > > > > > > > > >  source3/smbd/vfs.c | 3 +++
> > > > > > > > > >  1 file changed, 3 insertions(+)
> > > > > > > > > >
> > > > > > > > > > diff --git a/source3/smbd/vfs.c b/source3/smbd/vfs.c
> > > > > > > > > > index 76895f52e039..ea3fa4c8784f 100644
> > > > > > > > > > --- a/source3/smbd/vfs.c
> > > > > > > > > > +++ b/source3/smbd/vfs.c
> > > > > > > > > > @@ -1345,6 +1345,9 @@ uint32_t vfs_get_fs_capabilities(=
struct
> > > > > > > > > > connection_struct *conn,
> > > > > > > > > >         if (lp_nt_acl_support(SNUM(conn))) {
> > > > > > > > > >                 caps |=3D FILE_PERSISTENT_ACLS;
> > > > > > > > > >         }
> > > > > > > > > > +       if (lp_ea_support(SNUM(conn))) {
> > > > > > > > > > +               caps |=3D FILE_SUPPORTS_REPARSE_POINTS;
> > > > > > > > > > +       }
> > > > > > > > > >
> > > > > > > > > >         caps |=3D lp_parm_int(SNUM(conn), "share", "fak=
e_fscaps", 0);
> > > > > > > > > >
> > > > > > > > > > https://gitlab.com/samba-team/samba/-/merge_requests/41=
04
> > > > > > > > > >
> > > > > > > > > > For the client this would mean, it must allow reparse p=
oints for the
> > > > > > > special
> > > > > > > > > > files if SMB3 POSIX is negotiated.
> > > > > > > > > >
> > > > > > > > > > Makes sense?
> > > > > > > > > >
> > > > > > > > > > -slow
> > > > > > > > >
> > > > > > > > > I do not think that this is a good idea at all. It would =
just
> > > > > > > complicate
> > > > > > > > > things, make more incompatibilities and prevent using FAT=
 or any other
> > > > > > > > > filesystem without mknod support, including cases when se=
rver itself is
> > > > > > > > > configured to not support mknod for e.g. security reasons=
.
> > > > > > > > >
> > > > > > > > > FILE_SUPPORTS_REPARSE_POINTS is per-share fs attribute wh=
ich says if
> > > > > > > the
> > > > > > > > > reparse point of any type are supported. If it was decide=
d that special
> > > > > > > > > files, like fifos or character devices are represented as=
 reparse
> > > > > > > points
> > > > > > > > > then for share/filesystem on which are special files supp=
orted, server
> > > > > > > > > has to announce the FILE_SUPPORTS_REPARSE_POINTS fs attri=
bute.
> > > > > > > > >
> > > > > > > > > And if the server itself supports special files, but part=
icular
> > > > > > > > > filesystem like FAT does not support it, then server shou=
ld not
> > > > > > > announce
> > > > > > > > > the FILE_SUPPORTS_REPARSE_POINTS fs attribute.
> > > > > > > > >
> > > > > > > > > This is how it was designed and how it is used.
> > > > > > > > >
> > > > > > > > > It does not matter if the client or server is POSIX or no=
t. Also on
> > > > > > > > > POSIX systems there are filesystems without the support f=
or special
> > > > > > > > > files and it is common scenario on more UNIX systems that=
 for
> > > > > > > particular
> > > > > > > > > mount are special files completely disabled for security =
reasons.
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > So the result is that also when POSIX extensions are nego=
tiated, it is
> > > > > > > > > important and required to know by POSIX client whether pa=
rticular
> > > > > > > > > exported share supports reparse points / special files or=
 not.
> > > > > > > > > And FILE_SUPPORTS_REPARSE_POINTS is already there for it.



--=20
Thanks,

Steve

