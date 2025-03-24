Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 49551A6E5CC
	for <lists+samba-technical@lfdr.de>; Mon, 24 Mar 2025 22:39:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=ZOK/8OEI8ceBTWBYjOyNPsplCnyqFE5NyQKsfROyFuQ=; b=LxXPTXMqZY1D2zwKYy8wbUVyCT
	wJe8Wt6/V78sr9j70Tl+t7iSZ7RBfvqchrbsOJX4ydDCJeuq22Y9CFPa9MIfmmzqaqJES/6CiVMGF
	ahsJAToOlb07hnoY0UdKs6V4JUuddwBkTeHbudP6vrlW7yT5pg9VFbW8+kNjPrRQDCtTNMBg7GDRY
	uOxlb6Te/Kd76ZhmTLRC8KvHijPxfdJ74KDWavmx+VffOsMEzTBJwwOAaZp//Y+vKYrqVPyGKHFea
	OaLZtxR66PLtvuoOc7T/lPniNdFPwG1Cck6gKYKk5uAXe7m0rCe1TE3MN7w+k+mSKZ/2uuQkdfS1v
	+Kjvhpxg==;
Received: from ip6-localhost ([::1]:41580 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1twpVW-00GnBZ-IS; Mon, 24 Mar 2025 21:38:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40812) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1twpVR-00GnBN-L9
 for samba-technical@lists.samba.org; Mon, 24 Mar 2025 21:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=ZOK/8OEI8ceBTWBYjOyNPsplCnyqFE5NyQKsfROyFuQ=; b=Tfz1v+K4PlSxxWymOTQ9j2DjWy
 otjPhlFHdldPXcL1U2SgHFgBE3MvnafG0wfa0RkTz2wVfG25ZI0J4SK1xEkUiqSIxxszd3tZbL59V
 zezjbzS9MSG7f1JlsLcZ4qVU7xoGojHKovWeq/jIiJoFOu0dJOaBMeXIaNNq3Efd5pdnoNJ4zC3lq
 YxsPKXJt+hQb+rpY7KjJ9BGFnUX5EIQSKSHt/UB8Md35zfYCMipa6t8DWPmDj2e0xv09EmCPELUIN
 WGoRjfApNdYqut4A5R+QGFxU8oS3fR/1bP1elhT400ZrO7ssKiMRT2pxaH/sT4XILt8w5GVSKrXaC
 1BVFshEc8ertE9LYslBTeluZ0R+a7mw5f/DkVoT8/A+ccFo+DSVr2l4rQMqhSx85NVWxGulIhOEGe
 4A0Pnl6wIJJUdGwdX93gvdcVJ/+tFDrmVxCjdEAr8H3aTacKvo7gCk9WKSjaTI+kV6VIiNB0YFr6Q
 kGorf38EEyVOr8cXAX14q22F;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1twpVE-006XGf-1b for samba-technical@lists.samba.org;
 Mon, 24 Mar 2025 21:38:36 +0000
Date: Mon, 24 Mar 2025 14:38:34 -0700
To: samba-technical@lists.samba.org
Subject: New RWF_UNCACHED flag in recent 6.14 kernel.
Message-ID: <Z-HQ2neV1-lu_hPs@jeremy-HP-Z840-Workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

As this (RWF_UNCACHED) just got added for preadv2/pwritev2, might be interesting
to do some perf tests for Samba with it !

https://lwn.net/Articles/998783/

