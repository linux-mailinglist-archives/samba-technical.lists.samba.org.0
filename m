Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5A8ACC4BD
	for <lists+samba-technical@lfdr.de>; Tue,  3 Jun 2025 12:56:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zFpFdiXPa8Ywzn0rrAw8EyRZuRpVSKRFjceGthIEdxg=; b=vuE766uOynb/1noP1GVxmGNMFx
	djaQCwTeCvkHaLArN9wWhYo+GTryu1cn7KIumw6YAgQPF+2KXERa8iMwKgsWhHw4Kun4a1F9//dwK
	fztac2FN1LfhZrCAZkX4i1sRhJEeYCWGLN+bORIL/f7oCZoUlhX7fnM+vf0JhQctf8juGvP9UGaMX
	22diSUJiPr8UVnqK/gtaiwz5CELaTnksOwHiFOE+kcMQlfvGdFMrjm4s1IF5B+sd+2P6sDWGiq03z
	Vsb8zYspiiQmNeMCqfrSlUB96TOoipBBl5nP3D/CJkuAcU19g8CboO2DKccciRXmKwBACVzGam0R4
	IvCAzy4g==;
Received: from ip6-localhost ([::1]:39658 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uMPIq-006WL4-7z; Tue, 03 Jun 2025 10:55:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25]:37778) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uMPIk-006WKx-2L
 for samba-technical@lists.samba.org; Tue, 03 Jun 2025 10:55:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4C87F61127
 for <samba-technical@lists.samba.org>; Tue,  3 Jun 2025 10:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1787C4CEF2
 for <samba-technical@lists.samba.org>; Tue,  3 Jun 2025 10:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748948121;
 bh=zFpFdiXPa8Ywzn0rrAw8EyRZuRpVSKRFjceGthIEdxg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QlVikvJBnDL0zl76Op6HGPujQwAPxUgCUPQBVEtDy9eLOqFv2GRCc07rGnPb/Oyb7
 1SU5ZGGhwbX4hjESYbEoIjN6jgR84LnBdyDuihkEjqRtH1MWb/sQ9ct87aqCbiqLRW
 rDC02GXr6IcQ76AV5g3jNiZ0LG4ejc+Q/s9leN5BTPSsYxeEgzWMTv7Wu1ydCSge40
 R3KfXVWu0NCKTkPhLJ5i/32R4vm15TxXZsuHao49Au9uiy3hXsmL72hgJVvK7mYlQO
 iMcPAU2jxDTI/Jvd3PaPsErA74q1vkQOiBRIcJaeczgpC8b/4WJzBKVDWXMuiyYc1k
 ePAmQstw8jzwQ==
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ad883afdf0cso1035645766b.0
 for <samba-technical@lists.samba.org>; Tue, 03 Jun 2025 03:55:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV1qhFaE2vyE/jkI1pkP2IxTTzgoVH8I1wol9rNWrDyP+RuX+FooHvK3l9fvbx6Icc6uRfFlSMzg2YaqDQ9/E0=@lists.samba.org
X-Gm-Message-State: AOJu0YxvuI0myX+c2sU2WwRQkGUgfMypRjiiALOzhf0ftZMx079EXLme
 2d0d980+Ma4nnM7WDrePaony39T3km/zJPMhoZU4veQTY/yw7JOBIH3cv06G/0xylTl+MATY46X
 cff4zhhewf+cMJB+CVYWBDcT3/GNZMLk=
X-Google-Smtp-Source: AGHT+IEojaa2DQEOCIUZcRc7rI77r5EK6ofSlUiyoucP1p4NPZKiQTTTrvmEqQhNNA6FsUZPFzBO5KzuqIZaAhltAtI=
X-Received: by 2002:a17:907:2dac:b0:ad8:a329:b490 with SMTP id
 a640c23a62f3a-adb36b2447fmr1477054766b.23.1748948119509; Tue, 03 Jun 2025
 03:55:19 -0700 (PDT)
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
 <CAKYAXd9h8LpaOX9JA5Mdduw1CQ4RnYFgkU9dXf6NnNbTFYFJ8g@mail.gmail.com>
 <995fde08-3fed-47a0-b984-876f426e9076@samba.org>
In-Reply-To: <995fde08-3fed-47a0-b984-876f426e9076@samba.org>
Date: Tue, 3 Jun 2025 19:55:08 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8=Y97yZXHibR1hi5ZY0eD3cH32zkBHr0FTZG9a7tzoBQ@mail.gmail.com>
X-Gm-Features: AX0GCFuYZv24EL25zpkOsc1U_OuGmCFB8YA55JPScxCuHJlsN6ueveMd4LwN0-o
Message-ID: <CAKYAXd8=Y97yZXHibR1hi5ZY0eD3cH32zkBHr0FTZG9a7tzoBQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] smb: smbdirect: add smbdirect_pdu.h with
 protocol definitions
To: Stefan Metzmacher <metze@samba.org>
Content-Type: text/plain; charset="UTF-8"
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

[snip]
> >>> He can just put these changes in his own queue and work on them.
> >>> I am pointing out why he is trying to put unfinished things in the public queue.
> >>
> >> Because I want to base the next steps on something that is already accepted.
> >>
> >> I really don't want to work on it for weeks and then some review will void
> >> that work completely and I can start again.
> > It was too tiny a step and unclear.
> > i.e. the patch description should not have comments like "It will be
> > used in the next commits..."
>
> What should it say if something is introduced but not yet used?
>
> I mean I could explain in more detail how it will be used in
> the next commits?
It should be added when it is used. If it is not used, it does not
need to be added now.
>
> >>> If You want to apply it, Please do it only on cifs.ko. When it is
> >>> properly implemented, I want to apply it to ksmbd.
> >>
> >> I can keep the ksmbd patches rebased on top and send them again
> >> each time to get more feedback.
> >>
> >> Would that work for you?
> > Okay, Please re-include the ksmbd patches in the next patch-set and I
> > will check them.
> >>
> >> The key for me is discuss patches first and have them reviewed early
> >> so that the following work rely on. Any the tiny steps should
> >> make it possible to do easy review and make it possible to test each
> >> tiny step.
> > Okay. I agreed. But It should not be too tiny.
> > As I said above, please don't send it in pieces that I can understand
> > by looking at the next commits.
>
> I'll try to keep them tiny they can always be squashed later,
> but splitting them again would be a pain.
I am sorry, there was a misunderstanding.
What I mean is not that each patch is too tiny, but that the entire
patch-set is small.
So It is not clearly concluded in the patch-set and I have to wait for
the next commits to understand it.
>
> You can apply them and do a diff over multiple patches
> and tell me which commits I should squash.
Okay. Let me check them on the next patch-set.
Thanks!
>
> Thanks!
> metze

