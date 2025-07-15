Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6ECB04EE7
	for <lists+samba-technical@lfdr.de>; Tue, 15 Jul 2025 05:29:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=mqEzZsmsg62sBSnAiJWNpUEjORuCe45Qu4nfZgH58IM=; b=wzM5IHiQJtrd2Id3+L2OLogyUU
	4ONWwhzK4lJe7Dl+ZO79NiWrWZxBCjgXsgvH3Rlyg7H4WJONaQGgt1LiNA+YUHVlrELolYPAriG/V
	3WxipySOEvQUhvI/LTmxov5xnNub1PbICT7Hs+ezlTn7jppv4F1cuTKFuCLFQwZuKWz/jvDr4mYr9
	EF12+xmXAr7VmilyhLWOSS1h25u573sIf5CwncoN+skglO4HAQbSc8sR3oSrnWhFQYcQQtYADJWTy
	9+7OL3o85SufTzhRfa7lP4JzD5016pWSHPInjYL0i8PrT6OlU1xi9Gsx636moZhNN8ly9dKZ5fWGw
	z/00d8gA==;
Received: from ip6-localhost ([::1]:51828 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ubWLq-00BELe-Ur; Tue, 15 Jul 2025 03:29:07 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:49449) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ubWLj-00BELX-Ub
 for samba-technical@lists.samba.org; Tue, 15 Jul 2025 03:29:04 +0000
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-6facacf521eso42882556d6.3
 for <samba-technical@lists.samba.org>; Mon, 14 Jul 2025 20:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752550137; x=1753154937; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mqEzZsmsg62sBSnAiJWNpUEjORuCe45Qu4nfZgH58IM=;
 b=H4DIm0+DxV42BeIOAJ2/1nYKU9x7Co+kaPuAKFt5neHreOg5aTBUfe9cZxjC1p/8CV
 C2WC66EuSpj718hhwHHmUNtwC4iZQaB+yzzJyd8CZjpnCOdhV61W0b3P5Q80rVlsXhEJ
 dFg6nzUwmTQt1WrtcdtgNvPp9R9oepCrtuhQlhJA+4zh7cubUGCbwBL5ZlMSLz6Bhjta
 hoCP6r644KnJ141IQdplHvwlEZeMFoTKCbHQ/yEXU6w38q2dE4/eJYxGBKxOG4+Q39id
 dzzc4Z9o4txh8XEUSMirPROygilVIEGjCxPgaR3dka5fLGceiEJdgpJAcZxtwAeq0qDW
 yr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752550137; x=1753154937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mqEzZsmsg62sBSnAiJWNpUEjORuCe45Qu4nfZgH58IM=;
 b=qXDVZgzc7yf9muI5qqruskELcNFMHuScxTNtRqyVi5cabAd0GbuULFi5XPQfsd9CvO
 gPsFPZLk2E3YJ9ZEKH/+xeeHb56d5E5mfGea9Q+MiPjUWD4EA26mOp+1myRWR3IiAeXW
 1Zk/vVYBXkX3lt1SOhIua56C9lPkzTRocms96v+eaOxcTEEV2sdVVydhKiejUYRrQSc7
 4eSOjlx7hiQVUz0LEkDZCuDih53eApONHD/xPMwX9k6HfP6r+b9CRLgDqZPlwUe/3kd1
 Fr86YwvrQySEyQ64ypwyypkS8MHxzkMuScFnfTrKa7UdB1/61dg6Sx2Yafjc4Grv7G2R
 /gTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDEJRkfA4KLqWAuXvCjl55v8TpC/KmWoGwj/GXcqWNosr4Odliv0DJ70bUtLxcVoLrtrcYbPAlUz2voUEw+hE=@lists.samba.org
X-Gm-Message-State: AOJu0YzOE2QX1lWNUGmpIxG1KGkTXycM/ztYw0M5rtx3N2B8gT6D4t7X
 Ibuf04cjXKkorqGL97Y+j/vk+NBRH9fjcQ0gQTiB/ajFZmLflI80nRdEOxPtWIqzqJYsJOQgAyk
 6MJHpOh1NSx6Y/c3LO565V+v8lbu0PuXNej9H
X-Gm-Gg: ASbGnctOFmKYFu+9fxWsYT6+vuSsuaON4CZJ/JeigvMLTjxAPSAZvjjSGD55Rdew5K8
 z/j6RzCuA4Ey3XqlvmHSZC2rTvP7WZRWwHugDqi4wiLW6R0of9raytRonjGHJQp3W1ZvhsSDzlE
 Gza0E2Z0FwRD43xF/8R2KYZbQFNJEk1Xl+2GLDnyQlMrXvuGGUdcvc88h+AreYh69oHozVpkMKW
 flAz3bx1BAFSSnvLcS0cbmcYlunaPvq3Yg0w7fkKA==
X-Google-Smtp-Source: AGHT+IF0Rn3q1simPIvhbc0vnwA4w5RWqXVNYySOA+fEZKvC427+ra0q/RqsKx1LlesxbDASpcGCRQNR+1Vwd2A95IA=
X-Received: by 2002:a05:6214:4886:b0:704:89cd:c43d with SMTP id
 6a1803df08f44-704a3540f3fmr253276826d6.3.1752550136986; Mon, 14 Jul 2025
 20:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5muQGDkaHL78JOcgsfjL_=A64Xm9CrCBSKgOMABOjcg44w@mail.gmail.com>
 <CAH2r5msdLbvGMARXJ=V9wt0pvXJOrc=zh3eUfeF9AXEeshtByg@mail.gmail.com>
 <aHRo9VfMDIfK5MR6@jeremy-HP-Z840-Workstation>
 <42e549c1-0f92-4b95-b62b-3e0efab9aa10@samba.org>
 <5519b2d9-600c-4a3f-b44f-594877417df7@samba.org>
 <20250714165844.4hctlrwegfspiius@pali>
 <CAH2r5ms9Lt3h9q2B6VsbhkoM=_yEdpFXguiHRrrkbsrbkp6j=Q@mail.gmail.com>
 <20250714192404.j3dw6l3afgm2voe6@pali>
 <CAH2r5msRGGHyy0GdNgVYBVN+8NzfevDS-wtzr9TO5jF5NmoxHQ@mail.gmail.com>
 <20250714211016.zqddwjdvybeplgdf@pali>
In-Reply-To: <20250714211016.zqddwjdvybeplgdf@pali>
Date: Mon, 14 Jul 2025 22:28:45 -0500
X-Gm-Features: Ac12FXzeMo16oQKxlQC3WIW26V776b5SlQIrn8XsokXtUJ90Q_6Vt8qypRQ8jXk
Message-ID: <CAH2r5mumdvhWTNOCEGV-dT8aQVJrUQEDep0GEBn_CbKF+o3kjQ@mail.gmail.com>
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

On Mon, Jul 14, 2025 at 4:10=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.org> w=
rote:
>
> On Monday 14 July 2025 15:30:26 Steve French wrote:
> > > But generally this is not Linux centric, but rather generic to any ot=
her
> > implementations.
> >
> >
> > If they are supporting the SMB311 Linux Extensions why wouldn't they wa=
nt
> > to support special files? All of the servers which currently support th=
e
> > extensions do
> > Thanks,
>
> Because of that possible filesystem limitation (like fat or proc or fuse)=
.

That is a moot point because even if the mount has FAT or FUSE mounts
under it, the server can still support reparse points on that share.  A sha=
re
often crosses fs type boundaries, so it is always going to be possible to
setup a share where creating special files will work for only some of the
subdirectories - but at least for those cases with the suggested change
we will return a more accurate return code (e.g. EACCES in some cases)


> > Steve
> >
> > On Mon, Jul 14, 2025, 2:24=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.org>=
 wrote:
> >
> > > On Monday 14 July 2025 12:31:03 Steve French wrote:
> > > > > It does not matter if the client or server is POSIX or not. Also =
on
> > > > > POSIX systems there are filesystems without the support for speci=
al
> > > > > files and it is common scenario on more UNIX systems that for
> > > particular
> > > > > mount are special files completely disabled for security reasons.
> > > >
> > > > If it is disabled for security reasons, then probably better to sti=
ll
> > > > send the request and let the server return the correct return code
> > > > (e.g. access denied rather than "not supported").   But for Linux f=
s
> > > > the only examples I can think of where all special files are disabl=
ed
> > > > are VFAT and some pseudo-filesystems like /proc
> > >
> > > In case it is disabled for security reasons and server wants to annou=
nce
> > > that it is "available but disabled for security reasons" rather than
> > > "not support at all", then yes it makes sense to send the request and
> > > let it fail with ACCESS error with all those cleanup related issues.
> > > But in this case server should announce the support that it is availa=
ble
> > > for clients.
> > >
> > > In Linux it is not only VFAT. It is also slightly modern exfat. And a=
lso
> > > whatever is connected over fuse to userspace.
> > >
> > > But generally this is not Linux centric, but rather generic to any ot=
her
> > > implementations.
> > >
> > > > On Mon, Jul 14, 2025 at 11:58=E2=80=AFAM Pali Roh=C3=A1r <pali@kern=
el.org> wrote:
> > > > >
> > > > > On Monday 14 July 2025 10:23:17 Ralph Boehme wrote:
> > > > > > On 7/14/25 8:01 AM, Ralph Boehme via samba-technical wrote:
> > > > > > > On 7/14/25 4:18 AM, Jeremy Allison wrote:
> > > > > > > > It's an oversight I'm afraid.
> > > > > > >
> > > > > > > hm... it seems reparse points support is mandatory for SMB3 P=
OSIX
> > > so I
> > > > > > > wonder what this additional checks buys us.
> > > > >
> > > > > No. It is not mandatory. Getting or setting of reparse points is =
done
> > > > > via IOCTLs which are optional. Also fs attribute for reparse poin=
ts is
> > > > > optional.
> > > > >
> > > > > And that make sense as there are still lot of filesystems which d=
o not
> > > > > support reparse points (e.g. FAT) and this fs attribute is exactl=
y what
> > > > > server announce for clients and applications to tell feature supp=
ort.
> > > > > So application would know what features are provided and which no=
t on
> > > > > particular share. Server can support reparse points on share A bu=
t does
> > > > > not have to support it on share B. E.g. when A is NTFS and B is F=
AT.
> > > > >
> > > > > > > While I agree that generally we should likely set this, for S=
MB3
> > > POSIX
> > > > > > > the client should probably not check this and we should keep =
it
> > > out of
> > > > > > > the spec.
> > > > > >
> > > > > > one additional thought: it seems like a valid scenario to be ab=
le to
> > > support
> > > > > > SMB3 POSIX on a server that does not support xattrs on the back=
ing
> > > > > > filesystem and hence may not have a way of storing arbitrary re=
parse
> > > points.
> > > > >
> > > > > xattrs and reparse points are two completely different things, an=
d they
> > > > > should not be mixed or exchanged.
> > > > >
> > > > > For example FAT on older Windows versions supported xattrs (I'm n=
ot
> > > sure
> > > > > if recent Windows version still support them), but does not and n=
ever
> > > > > supported reparse points.
> > > > >
> > > > > For checking if xattrs (in MS terminology called Extended Attribu=
tes or
> > > > > abbrev EAs) there is a fs attribute FILE_SUPPORTS_EXTENDED_ATTRIB=
UTES.
> > > > >
> > > > > Again, application can check if server share supports xattrs by t=
his
> > > > > fs attribute and decide what to do next.
> > > > >
> > > > > > In SMB3 POSIX we're just using them as a wire transport, not
> > > necessarily
> > > > > > expecting full support from the server.
> > > > > >
> > > > > > Hence, for Samba I see the following change
> > > > > >
> > > > > >     smbd: announce support for FILE_SUPPORTS_REPARSE_POINTS if =
the
> > > share
> > > > > > supports EAs
> > > > >
> > > > > FILE_SUPPORTS_EXTENDED_ATTRIBUTES (0x00800000) !=3D
> > > FILE_SUPPORTS_REPARSE_POINTS (0x80)
> > > > >
> > > > > > ---
> > > > > >  source3/smbd/vfs.c | 3 +++
> > > > > >  1 file changed, 3 insertions(+)
> > > > > >
> > > > > > diff --git a/source3/smbd/vfs.c b/source3/smbd/vfs.c
> > > > > > index 76895f52e039..ea3fa4c8784f 100644
> > > > > > --- a/source3/smbd/vfs.c
> > > > > > +++ b/source3/smbd/vfs.c
> > > > > > @@ -1345,6 +1345,9 @@ uint32_t vfs_get_fs_capabilities(struct
> > > > > > connection_struct *conn,
> > > > > >         if (lp_nt_acl_support(SNUM(conn))) {
> > > > > >                 caps |=3D FILE_PERSISTENT_ACLS;
> > > > > >         }
> > > > > > +       if (lp_ea_support(SNUM(conn))) {
> > > > > > +               caps |=3D FILE_SUPPORTS_REPARSE_POINTS;
> > > > > > +       }
> > > > > >
> > > > > >         caps |=3D lp_parm_int(SNUM(conn), "share", "fake_fscaps=
", 0);
> > > > > >
> > > > > > https://gitlab.com/samba-team/samba/-/merge_requests/4104
> > > > > >
> > > > > > For the client this would mean, it must allow reparse points fo=
r the
> > > special
> > > > > > files if SMB3 POSIX is negotiated.
> > > > > >
> > > > > > Makes sense?
> > > > > >
> > > > > > -slow
> > > > >
> > > > > I do not think that this is a good idea at all. It would just
> > > complicate
> > > > > things, make more incompatibilities and prevent using FAT or any =
other
> > > > > filesystem without mknod support, including cases when server its=
elf is
> > > > > configured to not support mknod for e.g. security reasons.
> > > > >
> > > > > FILE_SUPPORTS_REPARSE_POINTS is per-share fs attribute which says=
 if
> > > the
> > > > > reparse point of any type are supported. If it was decided that s=
pecial
> > > > > files, like fifos or character devices are represented as reparse
> > > points
> > > > > then for share/filesystem on which are special files supported, s=
erver
> > > > > has to announce the FILE_SUPPORTS_REPARSE_POINTS fs attribute.
> > > > >
> > > > > And if the server itself supports special files, but particular
> > > > > filesystem like FAT does not support it, then server should not
> > > announce
> > > > > the FILE_SUPPORTS_REPARSE_POINTS fs attribute.
> > > > >
> > > > > This is how it was designed and how it is used.
> > > > >
> > > > > It does not matter if the client or server is POSIX or not. Also =
on
> > > > > POSIX systems there are filesystems without the support for speci=
al
> > > > > files and it is common scenario on more UNIX systems that for
> > > particular
> > > > > mount are special files completely disabled for security reasons.
> > > > >
> > > > >
> > > > > So the result is that also when POSIX extensions are negotiated, =
it is
> > > > > important and required to know by POSIX client whether particular
> > > > > exported share supports reparse points / special files or not.
> > > > > And FILE_SUPPORTS_REPARSE_POINTS is already there for it.
> > > >
> > > >
> > > >
> > > > --
> > > > Thanks,
> > > >
> > > > Steve
> > >



--=20
Thanks,

Steve

