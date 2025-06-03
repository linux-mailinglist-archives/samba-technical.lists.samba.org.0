Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 22189ACC01E
	for <lists+samba-technical@lfdr.de>; Tue,  3 Jun 2025 08:21:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=93NtwCyDcJqXDx3uo34XbIU8wrEwlgqXGFp9xKp2q+o=; b=wiA1gl+LIdOt6AmAgLWYIUeo3t
	WwsWbKZ62g0zoUNcNjYF2qejXYMwtHAeI6WqFP9v4XRv8uhF2uFtYJWlPcyyDwg938AqpqBoVg9U0
	x9iXL2LmxpbQ1+f5UbyxoPo0l+oOTWj3T2xeYrIyJfCIcbHHsSXO21N5QQOxXqYzqoPWP0jRIZpIv
	akYZ2IpGmTVEOh/RdwKwwYEHafl7ZjPp8pIfpp0xNE9op8/n8wrzhxViWl6MnTKII4db9/E28vA88
	MUW9P/0AJP2715tw0hCxV9rzKDVojCTK/aXx6wcLuCG0zDIWrJTZZKFmxWM/KExWSbdcxXsy9+9j2
	BVeoU6QA==;
Received: from ip6-localhost ([::1]:23436 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uML0c-006Udz-I1; Tue, 03 Jun 2025 06:20:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3]:60548) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uML0X-006Uds-PB
 for samba-technical@lists.samba.org; Tue, 03 Jun 2025 06:20:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 49298A4E937
 for <samba-technical@lists.samba.org>; Tue,  3 Jun 2025 06:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA016C4CEEF
 for <samba-technical@lists.samba.org>; Tue,  3 Jun 2025 06:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748931616;
 bh=3eWaOx+xfALn4tfpgFidvxGl9CfQns1LRintzC2bFl8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HGQ7uCwv+80FJPLPnYcwu5WyNATgSIDfvW4IZXpy51vOknrlosCKxU9hnWJjUE+C+
 RBy9C7b3m0PFhE1Tn/cirYiY8KdSnw4CV6FDL+aOU8U7Zoh50HP0zvoQFtZLlW1txo
 IAjz70tLZqQl3Mu8X5B26J5BsziOpPGyj5hHO1FPtBtSBex98LRDLnu3a3gcIDeIw3
 Ipu6hcZXdrUG4lkfYCIaaSLDc3AOYB038wYh7sGcrcR6p2D/kvq2SuZxbH+GOHOoEw
 4i+FITrdigccDVDfex6PaAwHTHL2hR9OO9NL5eYEoCUew+Vdke88wUslwA/B6I+JK4
 1TlnW4mW4ZIfQ==
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso1011706566b.0
 for <samba-technical@lists.samba.org>; Mon, 02 Jun 2025 23:20:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWw0Nv2T01oA9yWVetpV+nhPvm0fmap4nT/LURe9iBn+bLsZ068tKyFbF9pPkOguqqwOEnT6Y6CSizDkwqZqwQ=@lists.samba.org
X-Gm-Message-State: AOJu0YwMPqbeBVA/DMDcJhulGJYFBoDB1nmerYSQFIoXCp9bKj8IzOfb
 pkkyBQZnWBNrkkqqDZvyzxsjLv7/uVo0UAxp1X/44kBbSd1YbmpOtf+enFAmCzhUOK7EFSzzPZb
 KQO9oQxYYyxQC5TJH6G+TI97RBwKLG30=
X-Google-Smtp-Source: AGHT+IH8NfHU5JisLnNpksjaWB8HnN7+axLczTKFUWZHIyqUrKjavB0SPC2fiKaURvAO8U4lL7ahDLcswNu6SRTb4Rg=
X-Received: by 2002:a17:907:9612:b0:adb:2e9d:bc27 with SMTP id
 a640c23a62f3a-adb324500e8mr1578219566b.54.1748931615565; Mon, 02 Jun 2025
 23:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748446473.git.metze@samba.org>
 <b43ee94c3db13291156e70d37a3e843ad7d08b31.1748446473.git.metze@samba.org>
 <CAKYAXd_df0mwgAbJb3w_r_8JmJOAZjPfhjoFpWgTkWJFdMWUMA@mail.gmail.com>
 <096f20e9-3e59-4e80-8eeb-8a51f214c6f1@samba.org>
 <CAKYAXd86mLGAaAEUFcp1Vv+6p2O3MSJcwoor8MmjEypUo+Ofrg@mail.gmail.com>
 <CAH2r5mvQbL_R9wrFRHF9_3XwM3e-=2vK=i1uaSCk37-FZmJq9g@mail.gmail.com>
 <CAKYAXd9T81En40i3OigiTAmJabMr8yuCX9E1LT_JfaTmyefTag@mail.gmail.com>
 <CAH2r5mso54sXPcoJWDSU4E--XMH44wFY-cdww6_6yx5CxrFtdg@mail.gmail.com>
 <CAKYAXd_BVHPA8Jj6mtc_nsbby1HizZFEmCft20B_wcTM3pDUVg@mail.gmail.com>
 <CAH2r5mvygcy0-WwZNu6NvjXGrMtB5ZFLK7_w0rc6rVpaVDeBxA@mail.gmail.com>
 <CAKYAXd-4-WRw9bL-shqELhMO70fyznmeh0HByA=pyOcccu3sgg@mail.gmail.com>
 <5d0f7f91-8726-4707-abd4-c1898c8ba65c@samba.org>
In-Reply-To: <5d0f7f91-8726-4707-abd4-c1898c8ba65c@samba.org>
Date: Tue, 3 Jun 2025 15:20:03 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9h8LpaOX9JA5Mdduw1CQ4RnYFgkU9dXf6NnNbTFYFJ8g@mail.gmail.com>
X-Gm-Features: AX0GCFu3rDi-mws5YPEDC4dwNEThwkYsP51o6sity0E8_OhD1J_nXr3273juXeg
Message-ID: <CAKYAXd9h8LpaOX9JA5Mdduw1CQ4RnYFgkU9dXf6NnNbTFYFJ8g@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] smb: smbdirect: add smbdirect_pdu.h with
 protocol definitions
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
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Hyunchul Lee <hyc.lee@gmail.com>, Tom Talpey <tom@talpey.com>,
 Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jun 3, 2025 at 7:03=E2=80=AFAM Stefan Metzmacher <metze@samba.org> =
wrote:
>
> Am 02.06.25 um 04:19 schrieb Namjae Jeon:
> > On Mon, Jun 2, 2025 at 10:57=E2=80=AFAM Steve French <smfrench@gmail.co=
m> wrote:
> >>
> >>> Can you explain why he has split it into smbdirect_socket.h?
> >>
> >> The three header names seem plausible, but would be useful to have
> >> Metze's clarification/explanation:
> >> - the "protocol" related header info for smbdirect goes in
> >> smb/common/smbdirect/smbdirect_pdu.h   (we use similar name smb2pdu.h
> >> for the smb2/smb3 protocol related wire definitions)
> >> - smbdirect.h for internal smbdirect structure definitions
> >> - smbdirect_socket.h for things related to exporting it as a socket
> >> (since one of the goals is to make smbdirect useable by Samba
> >> userspace tools)
> > There is no need to do things in advance that are not yet concrete and
> > may change later.
>
> The current idea is to merge transport_tcp and transport_rdma into
> transport_sock, see
> https://git.samba.org/?p=3Dmetze/linux/wip.git;a=3Dblob;f=3Dfs/smb/server=
/transport_sock.c;hb=3D66714b6c0fc1eacbeb5b85d07524caa722fc19cf
>
> Which uses this interface:
> https://git.samba.org/?p=3Dmetze/linux/wip.git;a=3Dblob;f=3Dfs/smb/common=
/smbdirect/smbdirect.h;hb=3D66714b6c0fc1eacbeb5b85d07524caa722fc19cf
Hm.. I can not access these links.. Is it just me?
>
> But note that is just the direction were it goes, that current code has a=
 lot of resolved merge conflicts,
> which may not work at all currently.
>
> Instead of putting my current code I try to take the existing client and =
server
> code and merge it, so that we don't have a flag day commit that switches =
to
> completely new code. Instead I try to do tiny steps in that direction
> and may end with an interface that is similar but might be a bit differen=
t in
> some parts.
Okay.

>
> > He can just put these changes in his own queue and work on them.
> > I am pointing out why he is trying to put unfinished things in the publ=
ic queue.
>
> Because I want to base the next steps on something that is already accept=
ed.
>
> I really don't want to work on it for weeks and then some review will voi=
d
> that work completely and I can start again.
It was too tiny a step and unclear.
i.e. the patch description should not have comments like "It will be
used in the next commits..."
>
> > If You want to apply it, Please do it only on cifs.ko. When it is
> > properly implemented, I want to apply it to ksmbd.
>
> I can keep the ksmbd patches rebased on top and send them again
> each time to get more feedback.
>
> Would that work for you?
Okay, Please re-include the ksmbd patches in the next patch-set and I
will check them.
>
> The key for me is discuss patches first and have them reviewed early
> so that the following work rely on. Any the tiny steps should
> make it possible to do easy review and make it possible to test each
> tiny step.
Okay. I agreed. But It should not be too tiny.
As I said above, please don't send it in pieces that I can understand
by looking at the next commits.

Thanks.
>
> metze
>

