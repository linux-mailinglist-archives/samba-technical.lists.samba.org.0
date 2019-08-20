Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F9A957FF
	for <lists+samba-technical@lfdr.de>; Tue, 20 Aug 2019 09:14:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=CwvJXJ0ofe3WsQ3tNnnIVRCfmywhaKuUv9AOSN1Xfyw=; b=ulWHHcDnFe2qKTCCe7g9GWJ/1h
	1VqjyAaXzHnTGpYjUMH2LZOv6lg4w9WO51n+Ru2hG6IPrr68qlsD0Aig6605JISKpTOFh8GxL2cAD
	nUqzInLIDhksFt23TfhzOeuTu/4rA88+w0yBOpqhaz6A2T/+6vr5P8/40SAS2iZ7v7p92mstURGIj
	9thEXxEhVAdkjghlBRh+OJDv+7ggu0gGQ7QRUTXek7YSD2oWiaWatjE0hh+csDopD5EgslnDh88v0
	VkIQSwTtJMwRjHODUE50X0jaYx6qJGXts/zmkZKuLffMnSKWGIMegvEzwJa2RVA8c7XEGIGs5vvKQ
	/GAY9/Zw==;
Received: from localhost ([::1]:29628 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hzyLw-0079lC-Gz; Tue, 20 Aug 2019 07:14:48 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:33813) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hzyLr-0079l5-8J
 for samba-technical@lists.samba.org; Tue, 20 Aug 2019 07:14:45 +0000
Received: by mail-oi1-x243.google.com with SMTP id g128so3346066oib.1
 for <samba-technical@lists.samba.org>; Tue, 20 Aug 2019 00:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CwvJXJ0ofe3WsQ3tNnnIVRCfmywhaKuUv9AOSN1Xfyw=;
 b=ivQlx01qE5bdoaFfoktJkDnwBG6XEuyVATnOsPUfCiBUQjwH6pAEd6KmXKH1SSg+XW
 nNcP5o0wYRdKSIvZyM5wuO72+6uEI9/f2sx9P0WulFe3oefldpjiIgxhI8LeKLB33Bbh
 oudryMlKbU+X8ZDTrn/scXRKHUheXZd2mMDCC8lqkOIXMi7nG74ixw/tF85MBgg/99qT
 SDUnPo47pDLZNyglKz2cttP4Bv+EMw2Voow5pnj6hNjTVRhB4i168Yfvs9AlK5TSf1/Y
 R5VNImuiUbBnRTiJIqFwDzl6PPdbLcwfQ7ItVegLgJ0M55FiiMX0td7swBIcDrfShN5f
 mo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CwvJXJ0ofe3WsQ3tNnnIVRCfmywhaKuUv9AOSN1Xfyw=;
 b=mCwIbtX27jXCGau0DIsuGXXpEwfTgrI+z7dYdFlnNrLJdU0ZhggdTQdoEocukwVtbN
 +KRvlMJN56PE5YH1G4Ml15KByhZlFi4RoqqO7utj2NsaPvuNOFh9PePta/f/3Vy+uxuQ
 M83h7CLTM8wQtZDGb0dAbTAGCPLsjzsdpAs9xe02IZ28xlvCADaJMNhOvapK3PyN0NHF
 cxYouwNtAaur3xXbIjPPfhA+gP4PlDvvI7oezqtuvccjZibKBfK2E79n2kBJGaUJeExF
 HhAqQE5jF1kl9Ur7jIkiNn/iX688mvooZ9m9C15UJWE7KryMcUgOtco0E2IplFnwkIkD
 tmsQ==
X-Gm-Message-State: APjAAAUcH25EdnIPCmxHoQEY8hh6pOu0NUA5e+QcKebnJsHzJ+2lTWq6
 kMwRjobrz43OKWeNtm0JGDnZC+mN3LwR3YVoIRY=
X-Google-Smtp-Source: APXvYqx58r+ERm915RvyzXTLlFRXH4r2nEahKQllux07mIdoryr9/G1znmWS3vT0++EKHIHBqXtQCQOkUv4qnNqJ64E=
X-Received: by 2002:a05:6808:5cf:: with SMTP id
 d15mr266157oij.140.1566285280827; 
 Tue, 20 Aug 2019 00:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190817102447.55faa4c7@martins.ozlabs.org>
 <20190819143431.6371768b@martins.ozlabs.org>
 <20190820170539.36b828e4@martins.ozlabs.org>
In-Reply-To: <20190820170539.36b828e4@martins.ozlabs.org>
Date: Tue, 20 Aug 2019 17:14:29 +1000
Message-ID: <CAJ+X7mR3QVkX=dkKsA0V6TT+Skd3BShD8mvK42VX9_F+b8arxw@mail.gmail.com>
Subject: Re: [PATCH] ctdb-daemon: Make STOP_NODE control wait until complete
 (bug 14087)
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
Cc: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Aug 20, 2019 at 5:06 PM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On Mon, 19 Aug 2019 14:34:31 +1000, Martin Schwenke via samba-technical
> <samba-technical@lists.samba.org> wrote:
>
> > On Sat, 17 Aug 2019 10:24:47 +1000, Martin Schwenke via samba-technical
> > <samba-technical@lists.samba.org> wrote:
> >
> > > STOP_NODE is supported by a periodic check in the recovery daemon's
> > > main_loop(), which notices the flag change, and schedules a recovery
> > > and freezes databases.  If STOP_NODE returns immediately then the
> > > associated recovery can complete and the node can be continued before
> > > databases are actually frozen.  This means that the databases on the
> > > stopped node will node never be marked invalid and the recovery
> > > following CONTINUE_NODE can resurrect deleted records.
> > >
> > > CONTINUE_NODE must wait for an in-progress STOP_NODE to complete
> > > before commencing.
> > >
> > > Multiple STOP_NODE controls are also serialised.  This isn't strictly
> > > necessary but will stop more deeply nested event loops.
> > >
> > > Went through this pipelines with a slightly different commit message:
> > >
> > >   https://gitlab.com/samba-team/devel/samba/pipelines/76501176
> > >
> > > Now running in this one:
> > >
> > >   https://gitlab.com/samba-team/devel/samba/pipelines/76849217
> > >
> > > Please review and maybe push...
> >
> > Now with patch!  :-)
>
> After further discussion with Amitay, we determined that this was the
> wrong approach because things could loop forever. So, it either needed
> timeouts and the associated timeout handling, which all adds a lot of
> complication and is hard to get right, or it needs to be done
> properly.  ;-)
>
> New patch set attached to do it properly.  This does the steps to make
> the node inactive in the NODE_STOP control.  For consistency it also
> does the same thing to the SET_BAN_STATE control.
>
> A variation (different commit order/messages, slightly different
> logging, didn't drop unused code) passed the following GitLab CI
> pipeline:
>
>   https://gitlab.com/samba-team/devel/samba/pipelines/77082113
>
> Please review and maybe push...
>
> peace & happiness,
> martin

Pushed to autobuild.

Amitay.

