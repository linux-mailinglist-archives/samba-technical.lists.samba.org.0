Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C7E8251D1
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jan 2024 11:24:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=lraO2XeH29IEphDl7lyWKGHaK/kn7b8KfS/+Ygu7O90=; b=Fe6C3aPWZta6fSomDBe+qR/9/L
	jvMO3Xd3dag2t5AHXTq3eOixlljZTS9jjVNNro2k6uLp0a4cCvbrVBiffwulYmtQ3/eiE1ZMoornb
	aJL+LvCbGTruQuP2q8EX5Am+Ohv2jTwHIPdFQxYx/rmfRRs/wgJdMh+F1rgGZ6wciwEkj9SjlE/km
	1mbC12O9quaKvCLl+9PMCiM4hhTiFrEM/8yMGLbD9W3cB7HuwTsN7fOIaVudDkFjwMQYmtboInqrE
	jFVxTpKf3AZpjZCkkUs7I23jv6RtYScuF7EZEH4LoVwc3bpNvLrjGpwawTlSZM5TR0JgFhCzdBxDq
	uJ9nHzrg==;
Received: from ip6-localhost ([::1]:27632 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rLhMw-002T9m-Rm; Fri, 05 Jan 2024 10:24:02 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:56700) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rLhMq-002T9f-6X
 for samba-technical@lists.samba.org; Fri, 05 Jan 2024 10:24:00 +0000
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2cd0d05838fso16461111fa.1
 for <samba-technical@lists.samba.org>; Fri, 05 Jan 2024 02:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704450235; x=1705055035; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lraO2XeH29IEphDl7lyWKGHaK/kn7b8KfS/+Ygu7O90=;
 b=LfsiNa4vSZJIj4BT/0u3Krz8wJTv2per0Eal72yyecSWfXkg4GAAuFDpVMhyXpgq7Y
 2UiE2dacIwBgPQYi5YaQWBzSvVjPQuCJNDnZWgJIDFccmthhMUxRnf4Y0JMQf8Q5ylPd
 pdKxIOHy1ghPeAJ0acfzaB0pxI9gRMS2G3A4oZs7w+pdMe1HoI14sLCyne+qQG2f9fcg
 vjlXOBAGvQN8aFJae8LxVbrlv4xC+Dm9eHhd1+bmC0xeyBEuxxS+b3yzYh+AAkUsJzi3
 1x2qtS8url0T7DM5nCBjVRh+6+lROsbiKf51qq9ZlKRy78NzX9O3yxAifygjmMO8yeVr
 Acng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704450235; x=1705055035;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lraO2XeH29IEphDl7lyWKGHaK/kn7b8KfS/+Ygu7O90=;
 b=bYZXMzjA564hEUHCFlwjU1VeKLdRLEsREaW5DrqNha+uRerwsaVoPFY72xu5GJnMaL
 1b7srOmJVwQTWtoXT8fUFaGr8wXv5ZbwDxg3QPCIJB5+xVkSeJWRvY0FYVJDe90qIaLz
 M8UgbW+j1dZ/suGATCycOJ4cq8b43Pr3PTOjtQQYXy3GXIHc2i7+wrwdxceNogngEzav
 i81v2p2rH/AIT6/oeoSAFG6jO3Hi5dNczPmPGCOxLmAf/0EYB+oBrqsMqK7abIgtCbpH
 1HlDCaNMIERdHBwlgQVK9pOmaCmcBAOM+wM+d5Px0dECUcJ7KzBALhGnQ0F0s6lKEmFs
 DIXQ==
X-Gm-Message-State: AOJu0YyK/8xUtGrdm7X9rV9TsDZsb+UacASaBC33abH/YlE2R9p6H8AM
 KCc13rrxMdhLv7rCksw/Q7y2O4Gc1k0BaQZVGIY=
X-Google-Smtp-Source: AGHT+IEhxJ6rzAN3ItavqYUezN+dWr+l5CN5kAUj7vCDCjan4UdmOQBt+vGMwskzlpAj8lPWpQKSoD/Y3hsuX8O2tBg=
X-Received: by 2002:a05:6512:3e07:b0:50e:714f:f2ca with SMTP id
 i7-20020a0565123e0700b0050e714ff2camr1238829lfv.91.1704450234583; Fri, 05 Jan
 2024 02:23:54 -0800 (PST)
MIME-Version: 1.0
References: <20231229143521.44880-1-meetakshisetiyaoss@gmail.com>
 <20231229143521.44880-2-meetakshisetiyaoss@gmail.com>
 <7e61ce96ef41bdaf26ac765eda224381@manguebit.com>
 <CAFTVevWC-6S-fbDupfUugEOh_gP-1xrNuZpD15Of9zW5G9BuDQ@mail.gmail.com>
 <c618ab330758fcba46f4a0a6e4158414@manguebit.com>
 <62eb08fb-b27f-4c95-ab29-ac838f24d70f@talpey.com>
 <CANT5p=qqUbqbedW+ccdSQz2q1N-NNA-kqw4y8xSrfdOdbjAyjg@mail.gmail.com>
 <242e196c-dc38-49d2-a213-e703c3b4e647@samba.org>
In-Reply-To: <242e196c-dc38-49d2-a213-e703c3b4e647@samba.org>
Date: Fri, 5 Jan 2024 15:53:43 +0530
Message-ID: <CANT5p=oFxQEB5G4CzVuJBkg76Fu-gqxKuFdYJ8NCnGkS-HhFJA@mail.gmail.com>
Subject: Re: [PATCH 2/2] smb: client: retry compound request without reusing
 lease
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: Paulo Alcantara <pc@manguebit.com>,
 Meetakshi Setiya <meetakshisetiyaoss@gmail.com>, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 Tom Talpey <tom@talpey.com>, sfrench@samba.org,
 Meetakshi Setiya <msetiya@microsoft.com>, bharathsm.hsk@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Metze,

On Fri, Jan 5, 2024 at 3:30=E2=80=AFPM Stefan Metzmacher <metze@samba.org> =
wrote:
>
> Am 05.01.24 um 10:39 schrieb Shyam Prasad N via samba-technical:
> > On Fri, Jan 5, 2024 at 2:39=E2=80=AFAM Tom Talpey <tom@talpey.com> wrot=
e:
> >>
> >> On 1/3/2024 9:37 AM, Paulo Alcantara wrote:
> >>> Meetakshi Setiya <meetakshisetiyaoss@gmail.com> writes:
> >>>
> >>>> As per the discussion with Tom on the previous version of the change=
s, I
> >>>> conferred with Shyam and Steve about possible workarounds and this s=
eemed like a
> >>>> choice which did the job without much perf drawbacks and code change=
s. One
> >>>> highlighted difference between the two could be that in the previous
> >>>> version, lease
> >>>> would not be reused for any file with hardlinks at all, even though =
the inode
> >>>> may hold the correct lease for that particular file. The current cha=
nges
> >>>> would take care of this by sending the lease at least once, irrespec=
tive of the
> >>>> number of hardlinks.
> >>>
> >>> Thanks for the explanation.  However, the code change size is no excu=
se
> >>> for providing workarounds rather than the actual fix.
> >>
> >> I have to agree. And it really isn't much of a workaround either.
> >>
> >
> > The original problem, i.e. compound operations like
> > unlink/rename/setsize not sending a lease key is very prevalent on the
> > field.
> > Unfortunately, fixing that exposed this problem with hard links.
> > So Steve suggested getting this fix to a shape where it's fixing the
> > original problem, even if it means that it does not fix it for the
> > case of where there are open handles to multiple hard links to the
> > same file.
> > Only thing we need to be careful of is that it does not make things
> > worse for other workloads.
> >
> >>> A possible way to handle such case would be keeping a list of
> >>> pathname:lease_key pairs inside the inode, so in smb2_compound_op() y=
ou
> >>> could look up the lease key by using @dentry.  I'm not sure if there'=
s a
> >>> better way to handle it as I haven't looked into it further.
> >>
> >
> > This seems like a reasonable change to make. That will make sure that
> > we stick to what the protocol recommends.
> > I'm not sure that this change will be a simple one. There could be
> > several places where we make an assumption that the lease is
> > associated with an inode, and not a link.
> >
> > And I'm not yet fully convinced that the spec itself is doing the
> > right thing by tying the lease with the link, rather than the file.
> > Shouldn't the lease protect the data of the file, and not the link
> > itself? If opening two links to the same file with two different lease
> > keys end up breaking each other's leases, what's the point?
>
> I guess the reason for making the lease key per path on
> the client is that the client can't know about possible hardlinks
> before opening the file, but that open wants to use a leasekey...
> Or a "stat" open that won't any lease needs to be done first,
> which doubles the roundtrip for every open.
>
> And hard links are not that common...
>

That does makes sense.

> Maybe choosing und using a new leasekey would be the
> way to start with and when a hardlink is detected
> the open on the hardlink is closed again and retried
> with the former lease key, which would also upgrade it again.

That would not work today, as the former lease key would be associated
with the other hardlink. And would result in the server returning
STATUS_INVALID_PARAMETER.

>
> But sharing the handle lease for two pathnames seems wrong,
> as the idea of the handle lease is to cache the patchname on the client.
>
> While sharing the RW lease between two hardlinks would be desired.
>
> metze



--=20
Regards,
Shyam

