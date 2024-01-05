Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7B38250FD
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jan 2024 10:40:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=EtgubL+nkia1lR8g6fJs8/LX7BG4L9GjDmSywRwFk30=; b=QfbOfN16wwAkl3aLWwT6k9/C+l
	to1pErz1MC5FCz6qc5SA2yeRu9faVmX1gJTD8vmyzzI3n80rAGbjiy7AZpcYFUwoaZgikqDU0c0RI
	C1NMyuHFweuchmJC7CKfATyw06CD+wRBolP9L5YNvHprmm/cQ88vzaPSis8nfivytZdIlfMDPgHG0
	VRwEIHnaWxuY5huWyC2nIOBE85FZi/qrY/o9pGUK6uga5ANFBabpTYqyitD7aX0GFRQMTihn16FJN
	t0MPbSnvUu+lhghZLKL+s7olkabB18WjZ2PSt4FKfulOO+/v7B6nDJYet1OZt0Y4K9WU6H+cWkhbg
	H2ITqQnw==;
Received: from ip6-localhost ([::1]:34364 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rLgg9-002Su7-IH; Fri, 05 Jan 2024 09:39:49 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:52611) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rLgg3-002Su0-6H
 for samba-technical@lists.samba.org; Fri, 05 Jan 2024 09:39:47 +0000
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50e7f58c5fbso1761719e87.1
 for <samba-technical@lists.samba.org>; Fri, 05 Jan 2024 01:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704447582; x=1705052382; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EtgubL+nkia1lR8g6fJs8/LX7BG4L9GjDmSywRwFk30=;
 b=nJ4dpkMftn9MZT4ebo3+B3z8pjjLEoikfmum3J4c23qAo8cHIOdlzjNS5y30uaEEBJ
 OC1241FoFSF6eHDj8+sNdg7fn9P4w03wACuwfdz9jFngj12mGz3NollnK7XdUwlhma9n
 aTZ03+GKqT/YQoybXnUwugMfosWtIag7kxGG13Ww8dmNP0sOC9lBjam4fJeMGrOALdK5
 LbupiDDLpVhGl1s0NWHclOPONolbXsc6rzVywtBtbiV0Q/RAbE6KbRalIN2lztDfPL1G
 3NgNfeIa++FPhc4McCPG1pjhDZ18Tmlaf8DnQh4HRxFbZORa1Ut2R396d1WN5QbW8NuH
 3+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704447582; x=1705052382;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EtgubL+nkia1lR8g6fJs8/LX7BG4L9GjDmSywRwFk30=;
 b=GeVBYCgpVYGMqxI8cPFWMokzkX/fQmoGWkwjCYnR2AXFleLw5ZdxLkjDqyLAZLDC4E
 +0JcalJf9rGUVq7ZJ2kqkihfBKDxm/oMS0f40DlUzuyymOKVamDaMICC02go61wzQT3T
 rRFcDBHqfC5Y/uCuYxVZNkkXDQLcDusk/1NjxGqRjXq57RyYZqSc+opUhSQ2YprJIb/d
 aRc7/651KCv/6Q0PPMHKouD5zqmTaBn2OkZvrdHKIfrQwc35sfoUsBlwZGM5VMXf95e6
 +pYQJrBe0Hhs1R75sIh/KIwS9UG1zN3Xyq+lgJoavyr72HEmZ8/vflAt8jQKMXiEZhcJ
 pbvQ==
X-Gm-Message-State: AOJu0Ywi5BEDEiGf2c9DFQ2UeEkHnfB0dQ7ogPl5ki1inEu/cUQBFI7M
 CHoZtaYjV7JjS/fiqaPycyiwFtyA1pL5CiSGGYE=
X-Google-Smtp-Source: AGHT+IED9zOdJgUWQdfxcNjRdLLVogtU2gybLYPjMlI+RTgTb6S+8CymkI1+Q0N+g3nmCIJ3JrTHP9hGa62wZVxNdp8=
X-Received: by 2002:a19:f01a:0:b0:50e:554a:5254 with SMTP id
 p26-20020a19f01a000000b0050e554a5254mr972080lfc.13.1704447581868; Fri, 05 Jan
 2024 01:39:41 -0800 (PST)
MIME-Version: 1.0
References: <20231229143521.44880-1-meetakshisetiyaoss@gmail.com>
 <20231229143521.44880-2-meetakshisetiyaoss@gmail.com>
 <7e61ce96ef41bdaf26ac765eda224381@manguebit.com>
 <CAFTVevWC-6S-fbDupfUugEOh_gP-1xrNuZpD15Of9zW5G9BuDQ@mail.gmail.com>
 <c618ab330758fcba46f4a0a6e4158414@manguebit.com>
 <62eb08fb-b27f-4c95-ab29-ac838f24d70f@talpey.com>
In-Reply-To: <62eb08fb-b27f-4c95-ab29-ac838f24d70f@talpey.com>
Date: Fri, 5 Jan 2024 15:09:30 +0530
Message-ID: <CANT5p=qqUbqbedW+ccdSQz2q1N-NNA-kqw4y8xSrfdOdbjAyjg@mail.gmail.com>
Subject: Re: [PATCH 2/2] smb: client: retry compound request without reusing
 lease
To: Tom Talpey <tom@talpey.com>
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
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, sfrench@samba.org,
 Meetakshi Setiya <msetiya@microsoft.com>, bharathsm.hsk@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jan 5, 2024 at 2:39=E2=80=AFAM Tom Talpey <tom@talpey.com> wrote:
>
> On 1/3/2024 9:37 AM, Paulo Alcantara wrote:
> > Meetakshi Setiya <meetakshisetiyaoss@gmail.com> writes:
> >
> >> As per the discussion with Tom on the previous version of the changes,=
 I
> >> conferred with Shyam and Steve about possible workarounds and this see=
med like a
> >> choice which did the job without much perf drawbacks and code changes.=
 One
> >> highlighted difference between the two could be that in the previous
> >> version, lease
> >> would not be reused for any file with hardlinks at all, even though th=
e inode
> >> may hold the correct lease for that particular file. The current chang=
es
> >> would take care of this by sending the lease at least once, irrespecti=
ve of the
> >> number of hardlinks.
> >
> > Thanks for the explanation.  However, the code change size is no excuse
> > for providing workarounds rather than the actual fix.
>
> I have to agree. And it really isn't much of a workaround either.
>

The original problem, i.e. compound operations like
unlink/rename/setsize not sending a lease key is very prevalent on the
field.
Unfortunately, fixing that exposed this problem with hard links.
So Steve suggested getting this fix to a shape where it's fixing the
original problem, even if it means that it does not fix it for the
case of where there are open handles to multiple hard links to the
same file.
Only thing we need to be careful of is that it does not make things
worse for other workloads.

> > A possible way to handle such case would be keeping a list of
> > pathname:lease_key pairs inside the inode, so in smb2_compound_op() you
> > could look up the lease key by using @dentry.  I'm not sure if there's =
a
> > better way to handle it as I haven't looked into it further.
>

This seems like a reasonable change to make. That will make sure that
we stick to what the protocol recommends.
I'm not sure that this change will be a simple one. There could be
several places where we make an assumption that the lease is
associated with an inode, and not a link.

And I'm not yet fully convinced that the spec itself is doing the
right thing by tying the lease with the link, rather than the file.
Shouldn't the lease protect the data of the file, and not the link
itself? If opening two links to the same file with two different lease
keys end up breaking each other's leases, what's the point?

> A list would also allow for better handling of lease revocation.
> It seems to me this approach basically discards the original lease,
> putting the client's cached data at risk, no? And what happens if
> EINVAL comes back again, or the connection breaks? Is this a
> recoverable situation?
>
> Also, what's up with the xfstest the robot mailed about?
Meetakshi is investigating this one.
Initial investigations led us to believe that this is related to
deferred closes. The failing tests do show that the close is getting
delayed, and that setting closetimeo=3D0 causes the test to pass.
However, it is not clear why the test started failing only now. We'll
have the answers soon.

>
> Tom.



--=20
Regards,
Shyam

