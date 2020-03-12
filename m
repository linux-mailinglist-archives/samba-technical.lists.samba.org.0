Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EB13F182CA0
	for <lists+samba-technical@lfdr.de>; Thu, 12 Mar 2020 10:43:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=dWTjdsUfBIMKnHrbbzagjy4m+9cxppiAPdWa5ihwjfM=; b=2SpTpTXorp75Cm4JfOx7LWCAqc
	t3+hNirwk9dVG2CCsSwDOWKJUegf+NnQkGzb8DwXcGMvILESOfQ3lXTUhE3p9j2kn33jaWQo0ThCA
	TuubWi9Lj8Rr2ziHAC67gCuzT3/t3ibMo6bjJcYRswc2GfjttulYNwIu0jocgMi2aXZxRShR2ezel
	R1WOzMjGn2Ub8pY4UEd5bVjkLebQvPgWW/vOlYaWeFOJKYbVfJleHFWXtsr0rzGoez4b33N1rW3Iq
	WPh2UZ5jM59Vbvhs74DPnyf4dFgDsu0F82XRcuwD4hKlntuoIHHNK4rNHHmA5fiz0D7ygZdoMtTX9
	9iN54Cuw==;
Received: from ip6-localhost ([::1]:39626 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jCKMF-00FuAZ-Mo; Thu, 12 Mar 2020 09:42:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26194) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jCKM9-00FuAQ-3i
 for samba-technical@lists.samba.org; Thu, 12 Mar 2020 09:42:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=dWTjdsUfBIMKnHrbbzagjy4m+9cxppiAPdWa5ihwjfM=; b=J5oO6iVa0meiFwG3t/fhlhCPiR
 P+aoPYrSgn7MRAgEcmsYU4acHedXubpVBX4Qp2biox7hSVcBI70VxXot3Im7E/KXRROzdF1JmbpsE
 nKcy6CQamp2louAF0kZco2ahZxsHSw5GkFp1+COqCVIUSi8W78mJnzoDA4qrLUYd06biqWgl35IBG
 wLbF1rAjgsESfMytRxi39CHf/rUQ54QGUSs/7TzxepfliMMI9VoWftii/RQLbGlcVh8hcXlRgtSbB
 jxz4jSBl+QSKFepKiS/x0/NPqHUNCC32oPmu3fPN554PovsyfK6BBSZhW7reE+5ypa4C5ltVpXUTL
 rqvczYzA4aBJLmW/OysYu51w61mt8MCtTyHL6nosVXiJVh4dj9MEPk7BskXYHc083FFQpoucTleXe
 9GKr7KUxpXRWHYBQ0mbi2bFefAkkSu/ut0Des3bt+ds7dvvRu2Y+a98/X0Ak1oWFbVgVsWeA6V9Ym
 0KD8jyXx664b62+0X/RmvZFo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jCKM2-0004Va-Ph; Thu, 12 Mar 2020 09:42:15 +0000
Message-ID: <e154ba2525e27b0df4b07e35677fbf6a83da61ff.camel@samba.org>
Subject: Fedora 31/32 as Fedora in CI?
To: Alexander Bokovoy <ab@samba.org>
Date: Thu, 12 Mar 2020 22:42:11 +1300
In-Reply-To: <20200312090503.GO2735275@onega.vda.li>
References: <7999f917f76d922dfd725d185903fdf47e1a7e9b.camel@samba.org>
 <E8F6741C-BEC9-43A6-B683-E21BD9F61372@suse.de>
 <38643263.Z8vMgeSRLk@magrathea> <20200312065506.GN2735275@onega.vda.li>
 <939198702b7086a3194077b8ef1b6b244a99fcf6.camel@samba.org>
 <20200312090503.GO2735275@onega.vda.li>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2020-03-12 at 11:05 +0200, Alexander Bokovoy wrote:
> 
> F32 beta is out next week, hopefully, then we'll do it. There are
> typically bunch of updates right before the release.
> 
> I'll plan something for next week.

Thanks!

Andrew,

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



