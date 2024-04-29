Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B41018B50B8
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2024 07:27:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=59yMRjT88PQsxC7gkEMMcAM+wepcWmK0Mi/Sq33bKqQ=; b=PM3l4Qnaog44LTCrFPBcxSM4VV
	dWFGRAtBU6LFstaAsoqlDXUvY5K/5MFtbmjyWtRwn3ycP6qLOMtl6fuWMztklIUBucCM93+m/I9nK
	l1TQrUnKOcK/kysvZLOcQts0cKZMfzWDhLj9G9NQik63wIXID28OZEMuRSCCqanrwMkSQ7Uh5lFee
	0yXrFCHGDFbZnAEpy3vT9Vy6sJ+p80GaZRuQvWD0/KbLnGwa4aEnJj6ZvTrIX4L9GloThmG+86j7j
	kHjVRAeOvV2AzfUb2/4rHtmfWhNIm4VIEu59whp35mwOGDZFlV/A7tB4EbihFltlrk3JoqYpp3tcn
	+s63yZUA==;
Received: from ip6-localhost ([::1]:29326 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1JXW-005y3A-NM; Mon, 29 Apr 2024 05:26:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41408) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1JXS-005y33-C6
 for samba-technical@lists.samba.org; Mon, 29 Apr 2024 05:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Xo5IdExY6ChdE6oW+7KrvRX8c4Tf9PxB64y0r12TnCI=; b=3tRyIBitBt+8+2Atxu0X0w1uia
 J56bAtCYTbJiX0Xi/Y8ZU1s0wjgiWF+agewiPtzsSxPyYNisQhaqTSqhlUxw2S8SwFND0YxA/esmI
 rlI9brI0MHVyvryZv0dFBH+hn2wouKtp90FoL1mim2ilLwGkZjKP0ZiTfgslRhH1CFXBWYZwIfmEe
 vtxdJAVuiNuR0wpwLChFPOmIyL2e9zmPzrvsqMg3eWoZndBTsdYwqUi5ndhw0l5ctnYl/+T4aZYN6
 ec8SogchHiCtILnebaC81R3MYis/y4hzHn4UA7FJ+vXZ0KE9tAMuPDrBow+F90bhCasl6Ef+a4by8
 OaXjrQGq4eT7s+u+NLmSNzregOUlR45QjziKjcW5gH1PvCySGBlJNTBrOzJdU1+DCCYagUYJa23jz
 6xm99pCOlejDOpAY2D+FSubhKT2IhFg1iwHFkZ0g8k2TL1ZtofEFNOFOWBJnBHu+Jqfn/pXxyHrA5
 IDpUDrJW79wUMj2WPXh1UQBu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1JXN-008pTq-0V for samba-technical@lists.samba.org;
 Mon, 29 Apr 2024 05:26:49 +0000
Message-ID: <e3375f71e0d24e109832046bfc46bdbfb1429855.camel@samba.org>
Subject: Need to rebuild Rackspace gitlab runners - plan to move to Ubuntu
 24.04
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Mon, 29 Apr 2024 17:26:44 +1200
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

Just a heads up that due to 
https://bugzilla.samba.org/show_bug.cgi?id=15638 I need to rebuild the
GitLab runners we have in Rackspace, so that it still offers a tag that
our jobs will then expect. 

While doing that, if the image is available by then (it isn't yet), I
would like to make our runners run on Ubuntu 24.04 as the runners
(which are booted once per job) will start faster as they won't have as
many updates to run on first boot.

Please let me know if you think that could be a concern.  On the plus
side it should allow the more recent kernel for some more io_uring
testing. 

Naturally I'll check a full private CI run passes before I rebuild for
production.

Andrew,
