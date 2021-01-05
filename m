Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1C42EB4D4
	for <lists+samba-technical@lfdr.de>; Tue,  5 Jan 2021 22:24:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=j0aWEeKHwG+KMusjNiCueBwxSDmdTBtMDRWwjeRYw6U=; b=rWRtWLZTCJvt+fX3KA1IX+69tc
	fUp7ZVXO9MoSZz1M40LPIMXKaBEqeZ3TMd+B4ZBZcXI2WS9TKBXq+2A9vaJDdTtu14PM5ZkbbWlui
	UYBxkToXaFZYjXSgpDOOHC1U3qWm0twDY11ak0YZKlmvBE9tGxGqm2iGIRY2MOF1rf2s9yl5Tx8rJ
	tPdrmM4IuCRljf+poW/IyUMfGnhRsP1c2H6TKC0iYOqvMdGVpo9TzN3DJvPGYOzKwCTnAmXgLT9yI
	+u9bkpWkfsoslPIK3TiesuqOXD/yEgDrZriA/0rnmIDpDFU0RvC9InfA/InTd+kNYumhMhLkJmLfN
	ts05Gg+w==;
Received: from ip6-localhost ([::1]:65266 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kwtnq-004v0a-KL; Tue, 05 Jan 2021 21:23:42 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42552) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kwtnl-004v0R-AW; Tue, 05 Jan 2021 21:23:40 +0000
Received: by mail-pl1-x635.google.com with SMTP id s15so421032plr.9;
 Tue, 05 Jan 2021 13:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iT4Au5d6YLo4AKPBeCJlPWV2T7TuVEeahQRDSjBEOK8=;
 b=GG/3QhkQDLXM09FYJvWETLDhoJCm/gofVMW2qWkHGcLQcxeTyel+EtpFBTK8HDjRIB
 Qo6idx9MnyZKm9FA6nFqYtG1g2kBOKWcecNwqINyshQa9TF1cGX7k9tpknClaH5YSmB9
 RoJ/3fryYX48JC11yUomXik+Plp2GPbC6FwZWhs2mWoPJ39uWcMPZJrMjeXdlsuskTm4
 iuimbZcQ/qBTiRQd7FeoujFIQAgdZW798OYyv1LS1vqUnl1zxgmowqcXnJ2dVNsG5ttK
 Q/2/sD3L97VPL6m8VN0L/EmDMYJ4252FqslQKLxk/A28Jwftj3TinenWklTXrXPKB9h2
 AiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iT4Au5d6YLo4AKPBeCJlPWV2T7TuVEeahQRDSjBEOK8=;
 b=FJ/tm7yR5Cs5IwSwCHQZ4XQu4Lxvjcv2DsJpA+KSrRdvw4sLOf10nwe9tAHDukfh3b
 51LM2C471g5/ZwU4QKLd756ZdifHo0qjSBE/ZHQyg4M19zKdpW2TxwyiVyOOzk5yHH71
 oALT4F86uFLptjO9b9gR7GITgWK/nFlXgigRwvbiL15EoqFzsHIBy/B5jx9u+uig2Zf2
 V/dYBuDGmgbf4xmL1UTRp6+d57VLIn7PmKYnSI45Q/gNy/qhzMHnCVef8/K1j9Ae59E6
 NXlG0x/aYg1x/sFPxxajaxo8rGAWmbjOfyAK4pI7a/4jvyA5j3bdHzN8DtGHOM+avxFN
 X5nw==
X-Gm-Message-State: AOAM532+k/R6CFyRHEI6CJt+hT+fSsmU48w3R+/EkHDsYAJs5dFiOg3N
 93Z+AUqVl51Dzr18wP3HY3XdOEAWbOoY15Sp4Zo=
X-Google-Smtp-Source: ABdhPJzZ+FaxZNnmTerGDAXbkbDPLOs5KxGjl2L9CkDisiT7sIWkDuqbD2eunxURn8lUqmg74GopzvAxDPranjqByd8=
X-Received: by 2002:a17:90a:a88:: with SMTP id 8mr1084669pjw.120.1609881799523; 
 Tue, 05 Jan 2021 13:23:19 -0800 (PST)
MIME-Version: 1.0
References: <CAOGdD2oUwmRRCC5JQ7d+0=187ruhoL0N15suf67GtWrav2qhrA@mail.gmail.com>
 <290db29a-425f-720b-f8f5-d0e487dbcc43@samba.org>
In-Reply-To: <290db29a-425f-720b-f8f5-d0e487dbcc43@samba.org>
Date: Tue, 5 Jan 2021 13:23:08 -0800
Message-ID: <CAOGdD2ozKfnbknT-HoxjKpNUWrsaeJOff_PZ5QX7B+MOMQ6HaQ@mail.gmail.com>
Subject: Re: Samba and Adobe Illustrator locking issues.
To: Ralph Boehme <slow@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Yogesh Kulkarni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Yogesh Kulkarni <yoknfs@gmail.com>
Cc: Samba Listing <samba@lists.samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks Jeremy and Ralph.
Let me first try with the latest SAMBA version and see if it helps.
I will raise the bug, and attach all the information in there.
If it does not, I will get down and investigate further.

Thanks
Yogesh

On Tue, Jan 5, 2021 at 12:21 PM Ralph Boehme <slow@samba.org> wrote:

> Am 1/5/21 um 8:44 AM schrieb Yogesh Kulkarni via samba-technical:
> >   I have a strange case of lost updates with the Adobe Illustrator .ai
> files
> > and
> >   samba server. I am writing this to validate my findings and ask if
> there
> > is a
> >   known workaround to this issue.
> >   The samba version is 4.9.5 running on debian 10.x and clients are
> multiple
> > MacOS
> >   versions.
>
> there were *subtle* bugs related to such scenarious that I've fixed in
> the last one or two years. I recommend testing with latest Samba,
> eventually the problem is fixed there.
>
> Otherwise you or someone else has to get down and dirty and spent a few
> days in the strange macOS client bugs debugging hell. :)
>
> -slow
>
> --
> Ralph Boehme, Samba Team                https://samba.org/
> Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
> GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46
>
>
