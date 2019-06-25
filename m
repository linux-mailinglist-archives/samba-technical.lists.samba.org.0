Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0617C550BC
	for <lists+samba-technical@lfdr.de>; Tue, 25 Jun 2019 15:50:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=hOh3CF1db6hZgvgemxstnIQqSrfJSHe8yYoczrbt1tQ=; b=EKx9gV1VIhhIGynBuG19s2+C3/
	9OtATuSV6m8z3VBH5zy2PMqTQ7qzk+riUccrgFBl8q9/x0lWsPizgODSIeaxioBOmOxX/awuQ08DF
	6l1oxjMgsUMOsWim/nZ5dHp49lpu3W6G/+DeE197cpJ6+0uq1T5aSBfsOJ0dUrFTA8JzLKihI369I
	u1YU3rU5Qhxh60+OBHKlARgX9r+PiHhFGnrz+e3hJSjWshhqUNNC0zirJdyHIp3q40uas6L9Bx7ln
	UV/Zd5HDOTmKHcaYsKaq4fRJn8t808KVdYmI8ODlNaGxNJJDas4/l3RMkXFpcOCWOlkEGyYmVbaJV
	xtw2dyPQ==;
Received: from localhost ([::1]:20060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hflpT-001dLt-GY; Tue, 25 Jun 2019 13:49:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48854) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hflpO-001dLm-GT
 for samba-technical@lists.samba.org; Tue, 25 Jun 2019 13:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:To:From:CC;
 bh=hOh3CF1db6hZgvgemxstnIQqSrfJSHe8yYoczrbt1tQ=; b=DK4eo6JBhlf0o91jPyKcAe5fAP
 xpwQO1ZCsT+qpaSvzFfDSkHL7Fer3NZjBFUgxYlFgXTB5TL/kOLDcG993+CUSiPRE//yRkC/hpPWr
 eri9fadSvoLrMU5b/g78UqSVuPLsAJt5y03SHGl7eZN3NckPFz9tIMo06j4DFzSsXMcU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hflpO-0003jH-5i
 for samba-technical@lists.samba.org; Tue, 25 Jun 2019 13:49:42 +0000
To: samba-technical@lists.samba.org
Subject: Re: New csbuild run
Date: Tue, 25 Jun 2019 15:49:40 +0200
Message-ID: <3262208.mg61Vby1J8@magrathea.fritz.box>
In-Reply-To: <1902926.C4UlyRiazf@magrathea.fritz.box>
References: <1902926.C4UlyRiazf@magrathea.fritz.box>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, May 17, 2019 4:34:42 PM CEST Andreas Schneider via samba-technical 
wrote:
> Hello,
> 
> I've started a new csbuild run with ctdb included:
> 
> https://gitlab.com/samba-team/devel/samba/-/jobs/214444970
> 

New job with new image:

https://gitlab.com/samba-team/devel/samba/-/jobs/239400091

https://gitlab.com/samba-team/devel/samba/commits/asn/master-gitlab-csbuild

it now checks 'git log' to get the hash for the last commit with an Autobuild-
Date to calculate the commit range.


Cheers,

	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



