Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 296EBC90BF4
	for <lists+samba-technical@lfdr.de>; Fri, 28 Nov 2025 04:20:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=sDExBSUWwxmVOwn43vrN1ZoTULhjDDkXCc7MXRgcvwI=; b=EYgf5vGoIzrDIrstjWpLjYqgXT
	zNia+2qsNbak20KgtRuxd20PXke0l8dr4BfOaHUzjzJLE3F5HugcmGbniyVGCLR3oEc4fkAzHmhmb
	RUI4RrLyulLEQQhZnuH1+sSu9Qfll10rmMAoGLgzjlz0tcSoUa0GZjkE+rkOgq0w74jJ10LrlKgqj
	a1jAsyj4gf0JW/GsUB7wwsXKMqrf2MwMMJRzG4NQnL7wvDdaRpWcc4LNXGwKOJ9tk+xYRCqKRRRJM
	bx29TrkBncntKmsjozAS5tVTU/PHKmHY9INs91Rr1aV+oxPzjHw6HUxg5f5oMHiksTCgWuyKFnDWT
	l9XxG8ZQ==;
Received: from ip6-localhost ([::1]:63600 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vOp2P-00DTv4-JG; Fri, 28 Nov 2025 03:20:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25]:36130) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOp2L-00DTux-1w
 for samba-technical@lists.samba.org; Fri, 28 Nov 2025 03:20:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4E57560251
 for <samba-technical@lists.samba.org>; Fri, 28 Nov 2025 03:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03176C4CEF8
 for <samba-technical@lists.samba.org>; Fri, 28 Nov 2025 03:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764300033;
 bh=sDExBSUWwxmVOwn43vrN1ZoTULhjDDkXCc7MXRgcvwI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZZ18ett0BV2UFVCBjDbhdMmuzGa3L7XAIqlh1VvXGyMdudCnBXx6j2mGj99UjS+j/
 j3LXtK5kjYNoJ6Bbi2AZRq88sWdhvB/I2bVupEVylRCND+8qsumeze8pdlAIOojG+1
 qQv18zfOCE2GIWK29vLr8QY5q6HzIvG/PfF/6GHVLt/m3GiZqyH5XLzMmM2r/znynj
 1Xg3GXjq48Ml5S8KTIxZYGrOXdEAWND4LfyJD/x91iTgWllk0SKsLT+HjoyjpaKLq7
 SSf/GF9WYl6MEptg9cg6VHZCRoLRQYp8lOF687cCR7V1Gdp2yb/4bQ+aCIpk9QppLK
 3rWVp72p5DkAg==
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-64080ccf749so2234960a12.2
 for <samba-technical@lists.samba.org>; Thu, 27 Nov 2025 19:20:32 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCULC+46JOA1vLytQUsR793r8Pa+5V5xxxqYK+r/u9c4KNKeYknC+k9Q8cJdz16MjY0ValuiFGkYBRy8//o7evw=@lists.samba.org
X-Gm-Message-State: AOJu0Yxn15oOFkzLftElfPdiOrZXbUHqsGaI8JPdNtUKevUU5o1/knxy
 a4NCCAzyPcroKmi6UfctPT9jG9ZiF2pA+Mj0rmsnffStLAl0yu0HifvqRIuCkkYZv3NmA7EVXOS
 918MdT7iVuHpvvAbXSYs4/c73NnWqeTk=
X-Google-Smtp-Source: AGHT+IHe69xOS3lJUUujyxSL635KRk127SWq4UDqx0bSitEYrvJKWUekmiMyi7gAiA8QLTRyBY/PTr+wAiAqEwXOfUo=
X-Received: by 2002:a05:6402:13d4:b0:640:7402:4782 with SMTP id
 4fb4d7f45d1cf-645559fc4d0mr22327177a12.0.1764300029109; Thu, 27 Nov 2025
 19:20:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764080338.git.metze@samba.org>
 <CAKYAXd_HKKBKx_B7+Z+b_jt+rHazuMkskYYPAp6BROPuy0uBfA@mail.gmail.com>
 <2786ee25-b543-48a8-8fff-e6c7ff341774@samba.org>
 <CAKYAXd8N-j8K1CUUH9_+wXpEZBo5i=K=ywkQPjJmmo76JbmXng@mail.gmail.com>
 <bd457989-d73e-4098-b3f7-c6871f49d188@samba.org>
 <ad3feff5-553d-4d98-b702-9c7a594dd7c0@samba.org>
 <CAKYAXd_UJHTsa6QNW+Qzo6BjEqOXEF_bM=a=XRKm=OFwoigu4A@mail.gmail.com>
 <dea0cad7-c068-4401-85e0-0757252c7857@samba.org>
 <afb8eb46-30e4-4e84-b0b2-b7e145abbdb0@samba.org>
In-Reply-To: <afb8eb46-30e4-4e84-b0b2-b7e145abbdb0@samba.org>
Date: Fri, 28 Nov 2025 12:20:16 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_K0mEKyzxMzFQiw7dLa2nRmZGrRm4Ja=kNffayamx0Fw@mail.gmail.com>
X-Gm-Features: AWmQ_bljg0AOTxLWs7F9TNYYKeaHXKNQDIKRqk4G4bHL9vScsxamXzOnwq_7o6s
Message-ID: <CAKYAXd_K0mEKyzxMzFQiw7dLa2nRmZGrRm4Ja=kNffayamx0Fw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] smb: smbdirect/client/server: relax
 WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks
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
 samba-technical@lists.samba.org, Paulo Alcantara <pc@manguebit.org>,
 Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Nov 28, 2025 at 12:50=E2=80=AFAM Stefan Metzmacher <metze@samba.org=
> wrote:
>
> Am 27.11.25 um 16:45 schrieb Stefan Metzmacher via samba-technical:
> > Am 27.11.25 um 00:10 schrieb Namjae Jeon:
> >> On Thu, Nov 27, 2025 at 1:03=E2=80=AFAM Stefan Metzmacher <metze@samba=
.org> wrote:
> >>>
> >>> Am 26.11.25 um 16:18 schrieb Stefan Metzmacher via samba-technical:
> >>>> Am 26.11.25 um 16:17 schrieb Namjae Jeon:
> >>>>> On Wed, Nov 26, 2025 at 4:16=E2=80=AFPM Stefan Metzmacher <metze@sa=
mba.org> wrote:
> >>>>>>
> >>>>>> Am 26.11.25 um 00:50 schrieb Namjae Jeon:
> >>>>>>> On Tue, Nov 25, 2025 at 11:22=E2=80=AFPM Stefan Metzmacher <metze=
@samba.org> wrote:
> >>>>>>>>
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>> here are some small cleanups for a problem Nanjae reported,
> >>>>>>>> where two WARN_ON_ONCE(sc->status !=3D ...) checks where trigger=
ed
> >>>>>>>> by a Windows 11 client.
> >>>>>>>>
> >>>>>>>> The patches should relax the checks if an error happened before,
> >>>>>>>> they are intended for 6.18 final, as far as I can see the
> >>>>>>>> problem was introduced during the 6.18 cycle only.
> >>>>>>>>
> >>>>>>>> Given that v1 of this patchset produced a very useful WARN_ONCE(=
)
> >>>>>>>> message, I'd really propose to keep this for 6.18, also for the
> >>>>>>>> client where the actual problem may not exists, but if they
> >>>>>>>> exist, it will be useful to have the more useful messages
> >>>>>>>> in 6.16 final.
> >>>>>>> First, the warning message has been improved. Thanks.
> >>>>>>> However, when copying a 6-7GB file on a Windows client, the follo=
wing
> >>>>>>> error occurs. These error messages did not occur when testing wit=
h the
> >>>>>>> older ksmbd rdma(https://github.com/namjaejeon/ksmbd).
> >>>>>>
> >>>>>> With transport_rdma.* from restored from 6.17?
> >>>>> I just tested it and this issue does not occur on ksmbd rdma of the=
 6.17 kernel.
> >>>>
> >>>> 6.17 or just transport_rdma.* from 6.17, but the rest from 6.18?
> >>>>
> >>>
> >>> Can you also test with 6.17 + fad988a2158d743da7971884b93482a73735b25=
e
> >>> Maybe that changed things in order to let RDMA READs fail or cause a
> >>> disconnect.
> >> The kernel version I tested was 6.17.9 and this patch was already appl=
ied.
> >
> > Ah, good it also has:
> > smb: server: let smb_direct_flush_send_list() invalidate a remote key f=
irst
> >
> >>> Otherwise I'd suggest to test the following commits in order
> >>> to find where the problem was introduced:
> >>> 177368b9924314bde7d2ea6dc93de0d9ba728b61
> >> I don't have time to do this right now due to other work.
> >> Did you test it with a Windows client and can't find this issue?
> >
> > I can only reproduce the problem this patchset is fixing,
> > (recv completion before getting the ESTABLISHED callback).
> >
> > I tested with an Intel-E810-CQDA2 card in RoCEv2 mode
> > and a Windows 2025 server (acting as client against ksmbd).
> >
> > And I can only reproduce the problem with the recv completion
> > before the ESTABLISHED event. So this patchset is not only
> > used for setups with a connectx-7, btw were you testing with infiniband=
 or rocev2?
> >
> > Otherwise copying a 2G and 5G file to and from the share works
> > without problems.
>
> I also tested with my latest smbdirect.ko patchset
> in the for-6.19/fs-smb-20251125-v4 branch, also without problems.
I will test your latest smbdirect.ko patchset with my windows client
and share the result with you.
Thanks.
>

