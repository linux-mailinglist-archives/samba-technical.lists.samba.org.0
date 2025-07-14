Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D92B0488C
	for <lists+samba-technical@lfdr.de>; Mon, 14 Jul 2025 22:31:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8fqSkG2zqTbx5Mqri8gIPbFty0kdlTnlXdKyPCnTtGs=; b=D4omSKtIY2nBIcOYPyAMPKNNrF
	N2vFP01e8ynKs+K1fNqyrxCvNb+BtDBQENGlcpmnzyQXdjsy7LoR5noUm+6e632zgFrZiZGcN0YJS
	zQ87H8AmjaR+xT2hoR0ZOMxzjWUhDGMKizxqXBUpKcmqTfrAgTmZcLRVc260Gp5rOA74VzaQhpXV1
	Vjz7u2mPCTI+w6NYfsSoy8X9/3Mw1bgg9foFRfeLqhITJIRf9k7ElY+DXwRxoircqumbS7SuAABRB
	09+12q42BlMrlh7X+ShD2ldGCMdB5L8wGMwRJiyYASn3IrfXpuE0AExOiz0wO5yGrVriduCSgQovO
	1QR1vA9w==;
Received: from ip6-localhost ([::1]:37930 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ubPp2-00BDr0-KC; Mon, 14 Jul 2025 20:30:48 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:44191) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ubPov-00BDqn-Ue
 for samba-technical@lists.samba.org; Mon, 14 Jul 2025 20:30:46 +0000
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-7e29616cc4fso153893385a.0
 for <samba-technical@lists.samba.org>; Mon, 14 Jul 2025 13:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752525040; x=1753129840; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SF+5xCqcgzZ6+82gUe/4qpZoKkcnQQlTaXXg+kzgnWo=;
 b=iB8yPzc1emWNq7ZErykpUqKMEDMA/7OhX4DANjvJs7QnDOFwy+Og0xQLkZXVsI9yxG
 W/yDHz0V3kt0u94OqlmLTDQljPyU0iY+Tcu7ZAvojLf0HQ6hLnJ33Hq5t2cPOV7lK70+
 StNbR/9s8aKCWQTg1Ity6c3Za9UomFUGoHZsnhvzGrtsoqFLM+ehcqoArRk8+1loPWuE
 Iqn+V5Gp+jGfo78ICNOkpYKpnbJ52a96m6n9ovlUqPymC5Dguy1ipSsAtoPHVweTAr9F
 vW4iWTBTzn+UoVvG9b3nN4UnCLySIsvITvvOM+/XXTPTw2u3PycGSny6msnx4J3N1Jm0
 SaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752525040; x=1753129840;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SF+5xCqcgzZ6+82gUe/4qpZoKkcnQQlTaXXg+kzgnWo=;
 b=Ygk2ePDakcG4pepzIArDLJifY3a5jcZt+M9pvSGVoUVjURDIEw0USAew/YABImL2ej
 PNpq/MB7LTgen4s1HkL+VR46euQjuaBP+CqjYT3WI+JUHMEH7ym9Jy6gJ+lPVGajopz2
 BhP8V6Tu/vMceaYZrpbWtDucCn/jUIVWEok3Cyh0NbF82om853G0w5X23V3RJZH3eq0T
 exg4ysj5j/Krc5N4G/3XeV3F2YuEffvXsG6rza1lRNQ0/OsLpbOyZMhuYk/q1knOFl9L
 lDpFQFlOrmyr6fPsb0Jqx1mAthWWo6DoLh31x9s7dWq8j2aZ2IBUv70bXmPj5IVSF0ia
 b1Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaMxjAFqUSNbyDGEIekC5mLpKLprfEythUm3VD1QrWMjmOPhaxGiPr/F2+rjSQx1zAygT4ZoMP1NvqBkfDfXs=@lists.samba.org
X-Gm-Message-State: AOJu0YzFhF+Iv20K3Gm21/uXLiwe/9r1QvawdQdi2xTjrjvZHtZrTO3M
 qhBaltflwEQKpsjjNmrLztNhC86Z+VuuAWwzJeSyV3plm9Lx9/DzLFv30JPrY7w0sZNASYj1PIw
 JfCG5FLCzKGYqAlDQVmr10L4GgqdcbwtA2s2G
X-Gm-Gg: ASbGncvSL8BinrmhFOrRMpTDjCHcRg8nwRX9sFsbczBiD8sv8QuIFDRdabUdrq92Mho
 Gl0c4lwySJNkZwbYoPTUFIWdsEQKX+D4CZrqW4sBL2T0XUHKC3fpzFGqgqjxhoZBAB8Kzj+zvt1
 Xox4xHoHs5lM+934oelfk3blDURV18gRNkeoeiTo1y2vyDNvVMyjS0i5d1/SFKBfyZsb7qa6sWO
 baTlpXMd9pwLt66/nfUsJkD0fUhB8SazpgxpTaiZg==
X-Google-Smtp-Source: AGHT+IEPheoiJi43Px8tYAQZPi1ea+JWjc/q3dXmRuic7XRM5NKDxXu3M+stmikfo9w6UdqHR4GmIDGVWQGDRtCXI0w=
X-Received: by 2002:a05:620a:4515:b0:7d4:4f9e:67a with SMTP id
 af79cd13be357-7debf6c2680mr1995587885a.7.1752525039648; Mon, 14 Jul 2025
 13:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5muQGDkaHL78JOcgsfjL_=A64Xm9CrCBSKgOMABOjcg44w@mail.gmail.com>
 <CAH2r5msdLbvGMARXJ=V9wt0pvXJOrc=zh3eUfeF9AXEeshtByg@mail.gmail.com>
 <aHRo9VfMDIfK5MR6@jeremy-HP-Z840-Workstation>
 <42e549c1-0f92-4b95-b62b-3e0efab9aa10@samba.org>
 <5519b2d9-600c-4a3f-b44f-594877417df7@samba.org>
 <20250714165844.4hctlrwegfspiius@pali>
 <CAH2r5ms9Lt3h9q2B6VsbhkoM=_yEdpFXguiHRrrkbsrbkp6j=Q@mail.gmail.com>
 <20250714192404.j3dw6l3afgm2voe6@pali>
In-Reply-To: <20250714192404.j3dw6l3afgm2voe6@pali>
Date: Mon, 14 Jul 2025 15:30:26 -0500
X-Gm-Features: Ac12FXyF4VCiwrq5gt5rV-dsMESjZ3vsz8KobzMRZEj5LDZwbBrutgs7FGVDIB0
Message-ID: <CAH2r5msRGGHyy0GdNgVYBVN+8NzfevDS-wtzr9TO5jF5NmoxHQ@mail.gmail.com>
Subject: Re: Samba support for creating special files (via reparse points)
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

> But generally this is not Linux centric, but rather generic to any other
implementations.


If they are supporting the SMB311 Linux Extensions why wouldn't they want
to support special files? All of the servers which currently support the
extensions do
Thanks,

Steve

On Mon, Jul 14, 2025, 2:24=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.org> wro=
te:

> On Monday 14 July 2025 12:31:03 Steve French wrote:
> > > It does not matter if the client or server is POSIX or not. Also on
> > > POSIX systems there are filesystems without the support for special
> > > files and it is common scenario on more UNIX systems that for
> particular
> > > mount are special files completely disabled for security reasons.
> >
> > If it is disabled for security reasons, then probably better to still
> > send the request and let the server return the correct return code
> > (e.g. access denied rather than "not supported").   But for Linux fs
> > the only examples I can think of where all special files are disabled
> > are VFAT and some pseudo-filesystems like /proc
>
> In case it is disabled for security reasons and server wants to announce
> that it is "available but disabled for security reasons" rather than
> "not support at all", then yes it makes sense to send the request and
> let it fail with ACCESS error with all those cleanup related issues.
> But in this case server should announce the support that it is available
> for clients.
>
> In Linux it is not only VFAT. It is also slightly modern exfat. And also
> whatever is connected over fuse to userspace.
>
> But generally this is not Linux centric, but rather generic to any other
> implementations.
>
> > On Mon, Jul 14, 2025 at 11:58=E2=80=AFAM Pali Roh=C3=A1r <pali@kernel.o=
rg> wrote:
> > >
> > > On Monday 14 July 2025 10:23:17 Ralph Boehme wrote:
> > > > On 7/14/25 8:01 AM, Ralph Boehme via samba-technical wrote:
> > > > > On 7/14/25 4:18 AM, Jeremy Allison wrote:
> > > > > > It's an oversight I'm afraid.
> > > > >
> > > > > hm... it seems reparse points support is mandatory for SMB3 POSIX
> so I
> > > > > wonder what this additional checks buys us.
> > >
> > > No. It is not mandatory. Getting or setting of reparse points is done
> > > via IOCTLs which are optional. Also fs attribute for reparse points i=
s
> > > optional.
> > >
> > > And that make sense as there are still lot of filesystems which do no=
t
> > > support reparse points (e.g. FAT) and this fs attribute is exactly wh=
at
> > > server announce for clients and applications to tell feature support.
> > > So application would know what features are provided and which not on
> > > particular share. Server can support reparse points on share A but do=
es
> > > not have to support it on share B. E.g. when A is NTFS and B is FAT.
> > >
> > > > > While I agree that generally we should likely set this, for SMB3
> POSIX
> > > > > the client should probably not check this and we should keep it
> out of
> > > > > the spec.
> > > >
> > > > one additional thought: it seems like a valid scenario to be able t=
o
> support
> > > > SMB3 POSIX on a server that does not support xattrs on the backing
> > > > filesystem and hence may not have a way of storing arbitrary repars=
e
> points.
> > >
> > > xattrs and reparse points are two completely different things, and th=
ey
> > > should not be mixed or exchanged.
> > >
> > > For example FAT on older Windows versions supported xattrs (I'm not
> sure
> > > if recent Windows version still support them), but does not and never
> > > supported reparse points.
> > >
> > > For checking if xattrs (in MS terminology called Extended Attributes =
or
> > > abbrev EAs) there is a fs attribute FILE_SUPPORTS_EXTENDED_ATTRIBUTES=
.
> > >
> > > Again, application can check if server share supports xattrs by this
> > > fs attribute and decide what to do next.
> > >
> > > > In SMB3 POSIX we're just using them as a wire transport, not
> necessarily
> > > > expecting full support from the server.
> > > >
> > > > Hence, for Samba I see the following change
> > > >
> > > >     smbd: announce support for FILE_SUPPORTS_REPARSE_POINTS if the
> share
> > > > supports EAs
> > >
> > > FILE_SUPPORTS_EXTENDED_ATTRIBUTES (0x00800000) !=3D
> FILE_SUPPORTS_REPARSE_POINTS (0x80)
> > >
> > > > ---
> > > >  source3/smbd/vfs.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/source3/smbd/vfs.c b/source3/smbd/vfs.c
> > > > index 76895f52e039..ea3fa4c8784f 100644
> > > > --- a/source3/smbd/vfs.c
> > > > +++ b/source3/smbd/vfs.c
> > > > @@ -1345,6 +1345,9 @@ uint32_t vfs_get_fs_capabilities(struct
> > > > connection_struct *conn,
> > > >         if (lp_nt_acl_support(SNUM(conn))) {
> > > >                 caps |=3D FILE_PERSISTENT_ACLS;
> > > >         }
> > > > +       if (lp_ea_support(SNUM(conn))) {
> > > > +               caps |=3D FILE_SUPPORTS_REPARSE_POINTS;
> > > > +       }
> > > >
> > > >         caps |=3D lp_parm_int(SNUM(conn), "share", "fake_fscaps", 0=
);
> > > >
> > > > https://gitlab.com/samba-team/samba/-/merge_requests/4104
> > > >
> > > > For the client this would mean, it must allow reparse points for th=
e
> special
> > > > files if SMB3 POSIX is negotiated.
> > > >
> > > > Makes sense?
> > > >
> > > > -slow
> > >
> > > I do not think that this is a good idea at all. It would just
> complicate
> > > things, make more incompatibilities and prevent using FAT or any othe=
r
> > > filesystem without mknod support, including cases when server itself =
is
> > > configured to not support mknod for e.g. security reasons.
> > >
> > > FILE_SUPPORTS_REPARSE_POINTS is per-share fs attribute which says if
> the
> > > reparse point of any type are supported. If it was decided that speci=
al
> > > files, like fifos or character devices are represented as reparse
> points
> > > then for share/filesystem on which are special files supported, serve=
r
> > > has to announce the FILE_SUPPORTS_REPARSE_POINTS fs attribute.
> > >
> > > And if the server itself supports special files, but particular
> > > filesystem like FAT does not support it, then server should not
> announce
> > > the FILE_SUPPORTS_REPARSE_POINTS fs attribute.
> > >
> > > This is how it was designed and how it is used.
> > >
> > > It does not matter if the client or server is POSIX or not. Also on
> > > POSIX systems there are filesystems without the support for special
> > > files and it is common scenario on more UNIX systems that for
> particular
> > > mount are special files completely disabled for security reasons.
> > >
> > >
> > > So the result is that also when POSIX extensions are negotiated, it i=
s
> > > important and required to know by POSIX client whether particular
> > > exported share supports reparse points / special files or not.
> > > And FILE_SUPPORTS_REPARSE_POINTS is already there for it.
> >
> >
> >
> > --
> > Thanks,
> >
> > Steve
>
