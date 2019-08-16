Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E508FA81
	for <lists+samba-technical@lfdr.de>; Fri, 16 Aug 2019 07:54:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ZRS7oLCRSCtNwcK30VtZ9hyLitaAB/ruA1y7Qt80tuU=; b=VWie6/MO3iDyi/P8/Ah1yMXA30
	46KpFpkQxH0rUFUjYu7+lV0Q6pfinNZCXsSBua6SLezWa0Yr1piDAWk/FRFEQl3QWGCprJv7+rgwB
	qpy1CS9zZdWVQWd7kc1UgkcMMHK5FODxOIqGkFW7a0YF/hxgWBLMwXlCVGd/cZl4hFG2nyjv6TkBh
	06VhTyx0Xb8MX8S86tO+UPZlhawtDcj9WLCm6zjqw8IlUVNleL3/iYx8EEzzuKzIec/Q/OeavMWXG
	fg+cqsCSbxsUpzmQ/rKwNSRRtXB5rtB7LXh+x1PEL8ttK6CkqD9VYjGWX/+34gVN9FvZljzIYry5f
	L6E4khxQ==;
Received: from localhost ([::1]:33138 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hyVAe-006V7z-33; Fri, 16 Aug 2019 05:53:04 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33277) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hyVAY-006V7q-FL
 for samba-technical@lists.samba.org; Fri, 16 Aug 2019 05:53:01 +0000
Received: by mail-ot1-x341.google.com with SMTP id q20so7846981otl.0
 for <samba-technical@lists.samba.org>; Thu, 15 Aug 2019 22:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZRS7oLCRSCtNwcK30VtZ9hyLitaAB/ruA1y7Qt80tuU=;
 b=p9ZKQejerqy2B388QokNJ6lm/qnJescL2xVNagWgw4wOCad5SzyA17olIThJOfg7U8
 lY/TbMpNbfcmpSrEPahE3gc1ZWR/HJo2qj+dEebTZhsE5OxAwgqlmihP1HA2HkTVHUF3
 OREFW6LfpKzPTRznYA17tx45gCSymrxVH4yDPuWhz0/of2GYotkV6RZqkZXoMWegZNrW
 3dWfnIjerUmst0LIxQVI5ci3l/n7dwkFrP9r27zDKfiVqOvmwpkVvFES0c3jcy9auD/E
 9XztLwNRdXp59SWAmZBXk1W7UZP7IonLLkkPLP32T1E7h9pWSalcNf25kH8JJ3u5Ot55
 8I/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZRS7oLCRSCtNwcK30VtZ9hyLitaAB/ruA1y7Qt80tuU=;
 b=DSD8EJBbXCQpjW5axJcNh0mfFTRJvkhztKYakoT+HgvOZ3WIK9QEFPJR5YvraQOQ64
 edxPI2Nq7IFWRI9pClILHaHkzGyUHMoWAC/yUYwJVSV4zT/tZcamA3sUZkMD8mpdMsMT
 DQvYCv5Lf/TZ2/pYiptvbAULF1Psqzr77ZO0pGH8T5insgsIOU2wDoHzCWmM+XJ/xvx0
 BZoSoKxD4LG/3jnDh4E7Az5LirownKPaRcKGxColCOUrM0KnTYpqIvwF51jlOx/exPnn
 yWr+2F+fEApvqUWDmnkKiPM/huA5dB5v2CKwrVtULxkCfSL4aZetBMUzpKjejRymSbXJ
 8iGQ==
X-Gm-Message-State: APjAAAV1XeLLvklbfenxycOUcQHPrrXQBTjY7cEn0F4rVheYZQKb/Woh
 3PIltYgv5cJ4z04ue7T3THyQh3z3ScUu4k0R8/4=
X-Google-Smtp-Source: APXvYqwjZzM1RIjcbbujZ3CHuNiMPDER1Q7F7iBAif7NfVRquCke0AuXgWbS/ZBIcZuzUejQ3RNM8tMF7yztKQL6nQg=
X-Received: by 2002:a05:6830:1015:: with SMTP id
 a21mr949514otp.232.1565934776075; 
 Thu, 15 Aug 2019 22:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190814135302.7cae603f@martins.ozlabs.org>
 <CAJ+X7mQRwy7Uwe4nAMKxxUgDno0HsJPxxj0_Lf48eOngo6EBaQ@mail.gmail.com>
 <20190814144404.484e9e45@martins.ozlabs.org>
 <CAJ+X7mT5K7aKu8f=_gzv9U3fxtnRHygraJhYGOGzcify_FcY_g@mail.gmail.com>
 <20190815215333.1ef3bc2b@martins.ozlabs.org>
In-Reply-To: <20190815215333.1ef3bc2b@martins.ozlabs.org>
Date: Fri, 16 Aug 2019 15:52:44 +1000
Message-ID: <CAJ+X7mS9=OwKRRMTKk1vvsJievu=XhyvEaSz5QjJ39WAUz=ecw@mail.gmail.com>
Subject: Re: [PATCH] CTDB TCP transport connectivity fixes (bug 14084)
To: Martin Schwenke <martin@meltin.net>
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Aug 15, 2019 at 9:53 PM Martin Schwenke <martin@meltin.net> wrote:
>
> On Wed, 14 Aug 2019 15:17:01 +1000, Amitay Isaacs <amitay@gmail.com>
> wrote:
>
> > On Wed, Aug 14, 2019 at 2:44 PM Martin Schwenke <martin@meltin.net> wrote:
> > >
> > > On Wed, 14 Aug 2019 14:22:27 +1000, Amitay Isaacs <amitay@gmail.com>
> > > wrote:
> > >
> > > > On Wed, Aug 14, 2019 at 1:54 PM Martin Schwenke via samba-technical
> > > > <samba-technical@lists.samba.org> wrote:
> > > > >
> > > > > Fix for:
> > > > >
> > > > >   https://bugzilla.samba.org/show_bug.cgi?id=14084
> > > > >
> > > > > The solution is to only mark nodes as connected when both incoming and
> > > > > outgoing connections are up.
> > > > >
> > > > > Included in this pipeline:
> > > > >
> > > > >   https://gitlab.com/samba-team/devel/samba/pipelines/76265339
> > > > >
> > > > > Please review and maybe push...
> > > >
> > > > In the last patch, there is no need to add "node" element to "tnode".
> > > > "tnode" already includes "ctdb" for upcalls.
> > >
> > > It is needed to be able to easily pass the node as the argument to the
> > > upcall.
> > >
> > > However, you're right that:
> > >
> > >   tnode->node->ctdb->upcalls->node_dead(tnode->node);
> > >
> > > could just be:
> > >
> > >   tnode->ctdb->upcalls->node_dead(tnode->node);
> > >
> > > Do you want to tweak it or should I?
> >
> > Ah.  In that case we need to change the private_data for
> > ctdb_tcp_read_cb() to "node" from "tnode".  Then we have access to
> > "node" required for upcall.
>
> The attached, improved patch set does the above and also fixes the
> problem where tnode->out_queue wasn't a useful indicator that the
> outbound connection was up.  As discussed offline, tnode->out_queue is
> now only created when the connection becomes writable.
>
> Included in this pipeline:
>
>   https://gitlab.com/samba-team/devel/samba/pipelines/76501176
>
> Please review and maybe push...
>
> peace & happiness,
> martin

Pushed after adding missing BUG tags to couple of patches.

Amitay.

