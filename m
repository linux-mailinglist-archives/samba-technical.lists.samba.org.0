Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4278BE007
	for <lists+samba-technical@lfdr.de>; Tue,  7 May 2024 12:46:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=M+KS3dYIZcch0mg113KBj+gAfOEO2GLaV5O1c7DzQ5c=; b=XxpuHNTnm4BuEyCEdyAGbQxcux
	qg6863j7X+GWq52qM0dOP7P7RI9DanQpMdIpjmLKNP6UNndWCQQE/7o0dcYY5OqXjF3eOnEf4GujD
	N/JCIlWgyfIQ0+v964VsnOxW8SVw7b9vGjSj8IXWlsIK7C2IrMTcSpbmXfDZThIoPxIBVkshnbm12
	yFC8TIkUeb7GMX1HkJOxxMEjNzLMyfO2GnBWBt4csHJN76t7oxPId33Wg4sYSXBwdBPgfYk47WorU
	P6I91PeksHE4KZqmX0yVPx8Jg/FHJojqIXqcB2+n7aGW+8U/xHVpgnndbtDMv+ozffLE6eKg6L9M5
	j3+lzygQ==;
Received: from ip6-localhost ([::1]:47046 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s4IKO-008QKD-1P; Tue, 07 May 2024 10:45:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16914) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4IKI-008QK6-Hp
 for samba-technical@lists.samba.org; Tue, 07 May 2024 10:45:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=bgaPLm5WHLb9ljDX0sttiStSo8AlGwF4vTwexf6MkK8=; b=U4TsbLyUQlBrht1p8cwZQd6A/D
 M106syJnQSTRRaIUP/zW5mxM3si2xqXlGGLiG87VY0739ZHHo6Fm1wVNR11lUb1UTtG/U6Ap5LVZx
 zIBVT7ABiJqp1t9AzQaoevhAdy08EfPIUxJr7dnOCWdBeVGxDqkJ8lM+UYimW9gtJ6ocr5BKXAlzj
 kqaAA/cg1iWVM5PV7UR6GDaAjF4dhWK1Arhv1BNlc4kh17h4vGKbTfwWpB1z5rqs0YDQBwg32hQlS
 rRzGZLk3VgP9hVdjOD3MlivhGtqL8RIGBtaXtzeh9DDib4TSQOwXRFQ1vOG4Mo/JQ/9ggfg9kOMnh
 EJL41hbPhNfYt5/hFIET3ftmQHppHBVBBSvvV1TjgT0hjmrnXCOsa+QW8ZORTks4wA1zsx2nxkjBD
 hNg6CpcNZTZM/KFZB1+VRujh+SiIWB3/TGxuRSx0ANoUq6mjQAweyiVsJiP0BZ3ZPHuVPowwYILTM
 fUZbBzk3HvORJBWaGnnZeFnL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4IKF-00AC3y-0t; Tue, 07 May 2024 10:45:35 +0000
Message-ID: <99670794c9f69001a8da79519392d647353e6e26.camel@samba.org>
Subject: Re: Need to rebuild Rackspace gitlab runners - plan to move to
 Ubuntu 24.04
To: Stefan Metzmacher <metze@samba.org>, Upstream Samba Technical Mailing
 list <samba-technical@lists.samba.org>
Date: Tue, 07 May 2024 22:45:30 +1200
In-Reply-To: <e8fc29a1-9ca4-4644-8ff0-32fbf1bfc390@samba.org>
References: <e3375f71e0d24e109832046bfc46bdbfb1429855.camel@samba.org>
 <e8fc29a1-9ca4-4644-8ff0-32fbf1bfc390@samba.org>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2024-04-29 at 17:56 +0200, Stefan Metzmacher wrote:
> Am 29.04.24 um 07:26 schrieb Andrew Bartlett via samba-technical:
> > Just a heads up that due to
> > https://bugzilla.samba.org/show_bug.cgi?id=15638 I need to rebuild
> > theGitLab runners we have in Rackspace, so that it still offers a
> > tag thatour jobs will then expect.
> > While doing that, if the image is available by then (it isn't yet),
> > Iwould like to make our runners run on Ubuntu 24.04 as the
> > runners(which are booted once per job) will start faster as they
> > won't have asmany updates to run on first boot.
> > Please let me know if you think that could be a concern.  On the
> > plusside it should allow the more recent kernel for some more
> > io_uringtesting.
> > Naturally I'll check a full private CI run passes before I rebuild
> > forproduction.
> 
> Great! Thanks!
> metze

I still plan to rebuild the runners, but Ubuntu 24.04 is not out yet.
Also, it seems the key is actually to require fewer tags, and that
shouldn't require a runner rebuild to do that.  
I will have to do it to allow private builds however, so I am not off
the hook!
See https://gitlab.com/samba-team/samba/-/merge_requests/3620
Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
