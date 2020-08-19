Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8A42498AE
	for <lists+samba-technical@lfdr.de>; Wed, 19 Aug 2020 10:53:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=CleCtQc0Yk82f/8qMCNDARhqzUv6BwJaK9vEt51IPH4=; b=GYKaBCglLPkLsFaPVhrxV4qjmh
	Nk6e9Wn9GddJ54QsNyPTuAGRehdRi7ECwbnSE9JBw6PRyo0BUMo7+/eSCtVRd4hOpPeGoFduFM3Su
	HB/VZ2iddp3zaHJ8j6dXHkgZMQ5g9ckZgE9xUvs9Stq0En+XbwGgrs/zRQpS5UZCTKOUOQtCnp4zh
	eNodhI0pxCnpcixlJLlpYFpceSUy/ztABzpLaiPw6dDjX9kaL2ZlwoNw3nhjBTmX4GFovo/wFr8Y7
	kOrRwqj/c/HpkVCyV/tXWqV0YSOCq2IWQ0GvAg78sLpg4tSHRjGvnrs1m4WvSmSGh9bCyRsMK5eGk
	ZUvIVs7Q==;
Received: from localhost ([::1]:18764 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k8Jpn-00EGX5-Js; Wed, 19 Aug 2020 08:52:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63874) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8Jpi-00EGWy-0T
 for samba-technical@lists.samba.org; Wed, 19 Aug 2020 08:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=CleCtQc0Yk82f/8qMCNDARhqzUv6BwJaK9vEt51IPH4=; b=pWzs/6s+xxhqsZyCg/arxBWLl0
 RDeRo6YOXs/twFhJZbLCtlFRRInYJFUh/WSspeQ/R3OKrDwrwaoTSgbzEGDQSa2aY36JOuQtfyny0
 JHiHONIZxLY9xvu5Qf0g1oesi0d4hRL/vFbWd575D2on0rbUZ6lXhAU7NDD9doY8qQ0aRDWb72w30
 ykVE0N7M3yO8FXQIfR9c1zBuEaNMIuKLURteqEbLsL+deE4+SBRF8h0T8Am47ZbLBXPSj1q5l4h0J
 V9zqM9QQdE0Hnz6uBBSzzrz8UgRpnUXK4NGxKrXRpBfRKHZcb6ks8e9Edt/1POyyVY3mVzSqZQk/m
 DfyniPJP9edKL/roKtQ02VlSePbuhg7L2aetbq3BmLi4t7MWBnvI479tchi0o8wsckScg/FmSazGs
 Nux0uVDFbY0thS4FsAX/gHLG05iycYc1DhCQtdF851/x6pHVaX6Ipqjnq0VhdnhvItNeHQZHxcqzj
 dwqMuk9DBgN/kqHSyfyt9xOg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8Jph-00074O-Oo
 for samba-technical@lists.samba.org; Wed, 19 Aug 2020 08:52:33 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.13] Samba 4.13.0rc3
Organization: Samba Team
Message-ID: <1a55299d-65ec-8f7e-c8e1-7af5fff0a5a8@samba.org>
Date: Wed, 19 Aug 2020 10:52:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.13.0rc3 is scheduled for Thursday, August 27.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.13
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

