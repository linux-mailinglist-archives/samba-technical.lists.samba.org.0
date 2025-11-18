Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7B8C669D2
	for <lists+samba-technical@lfdr.de>; Tue, 18 Nov 2025 01:02:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=yVaZLnXzUDrD+JdGeCvyeR8sHGwogU08dOp4ZiuA2n8=; b=wNEO+5bkMsw2DnHVnWo1R5F7Gv
	VdA2+wga1Oc7GEHXnfU6P8DCUCrrbpQ+tBjuLli7bQjKIpvh3a7emYJryUx7/9v9iBCez/y5F4pjo
	r+nBJ1S7F7Nt1wCQUGMXoX2aiUzuI4RRjhD9q5VpiZIF/GSXUR771r1qBeFWDQcLFq3FGDesdFoRo
	MhEeqmCTh+PXbHtvBVB7v2jh0WoBN4PtqSpOLeI1UqD7JdC2aGPaLNTrazxex6MxY7uIbZJCpD2bv
	rLSixBvfb5ROEvy7W4vV+LjDbspqkXLKqeY1/biWZnmLs6AJMwRyjTYu148YWFs50yRPAYLlDpwhj
	v9ljY9Ow==;
Received: from ip6-localhost ([::1]:39900 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vL9B4-00CTz9-NK; Tue, 18 Nov 2025 00:02:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19518) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vL9Az-00CTz2-54
 for samba-technical@lists.samba.org; Tue, 18 Nov 2025 00:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=yVaZLnXzUDrD+JdGeCvyeR8sHGwogU08dOp4ZiuA2n8=; b=iVcDLm7URc2ef401qlakWGUON0
 C3A0cwCj0QNhLNDomWY4Oa8Xa/weAE3m66dlId9irWjrILE4pq77/7oWcz7wEWaNwRop38+AoJqg9
 xLp6Hd4H4VuQ9PIPjZXGZ8YfgdDjUXEAb6H6XI1wLEdEWaFUf4l6qt1ZjrG33Z9txdvHzgnycwJSa
 5LtjjweJ33DAcW8Uygkos8VfXHa0q73t76Wh7exON6Qvb7oRSAANgEybZzgnPLGebAmFF/wdVSwwy
 Aw+k7XCKHroaFmdti7au0AEytEoNOjn/yORk7j9YP+3V8x1+O6iVx6Ppjlmg06hHRXEVnx+Ro52tG
 K7yudcWcSX/Hg5mUByOXpFcgtAL5kiarktBs081L5SPkJ/vu80Wa5CEnISjQ2UjAV6tehckNfVQ6P
 bAYOVNt9wty7dQRDNYLzTZpk8qAeyg8L9HIUGpWOT4SrKETuqFssGQb/xGDj13tXH3kFHiJaT3Oqd
 Bq2Jqu1+nwcNKl33L+lg8O6o;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vL9Ay-00ERlc-0v for samba-technical@lists.samba.org;
 Tue, 18 Nov 2025 00:02:28 +0000
Message-ID: <a3e16fab-03d2-451a-9e63-acd552f7c3c4@samba.org>
Date: Tue, 18 Nov 2025 13:02:24 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to submit patches against lorikeet-heimdal
To: samba-technical@lists.samba.org
References: <CALZ=Sy_Lt3ykMLorz7Hx0=M0bBgbb-am=Cs=Ff+dnHK-BMz+iA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CALZ=Sy_Lt3ykMLorz7Hx0=M0bBgbb-am=Cs=Ff+dnHK-BMz+iA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Jennifer Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jennifer Sutton <jsutton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 18/11/2025 12:22 pm, Kacper via samba-technical wrote:
> Hello,
> 
> I’m wondering how to submit patches for lorikeet-heimdal using GitLab.
> Normally, I would submit patches upstream, but I’d like to submit this one
> to lorikeet for visibility to the Samba AD developers.
> 
> I noticed there are only two merge requests for lorikeet. One mentions
> pushing a new branch named like lorikeet-heimdal-$(date --utc +%Y%m%d%H%M)
> to the shared repository, but I believe only Samba members have permission
> to create new branches.
> 
> Could you clarify the proper way for external contributors to submit
> patches for visibility in lorikeet?
> 
> Regards,
> Kacper

One way is to submit a pull request for 
https://github.com/heimdal/heimdal. However, the upstream project is not 
active and you are unlikely to get a timely response.

The other way is to go via lorikeet-heimdal which, as you noted, 
requires the submitter to be a member of the Upstream Samba Development 
group. However, if you submit the changes as a merge request to the 
Samba repository, a kind Samba developer may be able to push the 
lorikeet-heimdal branch for you.

Cheers,
Jennifer (she/her)

