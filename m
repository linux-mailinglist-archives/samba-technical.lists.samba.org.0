Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2515DEA670
	for <lists+samba-technical@lfdr.de>; Wed, 30 Oct 2019 23:40:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=LH6TR3MW+ZckrAzeVBsOlfDjP39KeSHEN7YelfY1IYo=; b=hX2bwwsQCcses9EWR3RnnEAGwW
	9IDoDjJZFwnqL/W5oLJFz2mrc5Z7UKgKGZH0WRFqL6dGwftlXHxfoJJqxoQf7g0DIt03OHlaQgt23
	9n0v2d+uEktHB09O1W3D5A17scmMVC97fq/Vo1Rqe3RoJpIHgGBeWZgURLUIOxDLB+YKnGxZ9rPo/
	RNw/BfBdTjEmrjbNuSEn9oo8r14q13oG4Qdm9LddZbi+ZrPf9SWkl8699FFQvgf6C+1HXhNqiAFnw
	RBhHryjtjlwlbONuAEXRlRCxWH5p66KzslVfplyACRLfa0qIHV08bJbiC0YQTD8ZkGBsANze24d66
	hZAPoWlg==;
Received: from localhost ([::1]:44930 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iPwco-003qAr-Br; Wed, 30 Oct 2019 22:39:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13190) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPwcj-003qAk-MP
 for samba-technical@lists.samba.org; Wed, 30 Oct 2019 22:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=LH6TR3MW+ZckrAzeVBsOlfDjP39KeSHEN7YelfY1IYo=; b=hy92NGy2FyJ8YRr/gVyN28rx2O
 0awYF8VkqE2glZ76gMRbKk6ajXvRVIpgk8LYXXf/b0prh+VW5e6xajbObrxckVKIjmlJuz/xx++LN
 ZRctUBfWWGsDcQyNkBUYDSOJFml0FKySD9ZhGl4MZG7oah7/hafzEqVHJ/ZGB3f6bZ2eUp9UMzVaa
 u2H2IU9fkeqB/+KRxt2hAn7eGaGUG7meas9cIjdP9qGhzIztV1Tlh1agOP/XjjwDUHzL/0MkGL5Ss
 oZsWRZtE92I8A6yojLQWjcr5P6gHYAuMeO71r9otPDYCbqM8xGS9TmBINME+OW8wWuwNTZuc0RNTn
 c0UpkKMQzqyN1y5nr1a/C6EHo88Tz13yQJVcnZoBr7RhVzApAoIqHC18cLZgtTEbLp40FcTocFZN0
 Kku5eeS2xwsNbINPs1OEOSyGJAWDVBbzORUpmqT85qpCI6IOtqQ2LjU0EdCUjGmErTCFWGjhsSaFo
 Nb9pIog8pf2+5cgM4nvINwrV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iPwcj-0006z7-0a
 for samba-technical@lists.samba.org; Wed, 30 Oct 2019 22:39:29 +0000
Date: Wed, 30 Oct 2019 15:39:25 -0700
To: samba-technical@lists.samba.org
Subject: Problem regenerating gitlab docker images
Message-ID: <20191030223925.GA8185@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

while fixing the build problem with the system heimdal libraries, i am
also trying to establish a gitlab test for this build. This requires
adding the heimdal-multidev package to the Ubuntu images. Regenerating
the images now fails for CentOS7 and CentOS8, which should not changed.
I already fixed one problem for CentOS7 to avoid the conflict between
nettle and compat-nettle.

Now CentOS 7 fails with:
https://gitlab.com/samba-team/devel/samba/-/jobs/337893367
+ docker build -t samba-ci-centos7 --build-arg
'SHA1SUM=9dae5d8732853f0025bcf9528e94935f0e7ebada' bootstrap/generated-dists/centos7
Cannot connect to the Docker daemon at tcp://docker:2375. Is the docker daemon running?
ERROR: Job failed: exit code 1

And CentOS 8 with:
https://gitlab.com/samba-team/devel/samba/-/jobs/337893366
Error: 
 Problem: cannot install both glibc-common-2.28-42.el8_0.1.x86_64 and glibc-common-2.28-42.el8.1.x86_64
  - package glibc-langpack-en-2.28-42.el8_0.1.x86_64 requires glibc-common = 2.28-42.el8_0.1, but none of the providers can be installed
  - cannot install the best candidate for the job
  - conflicting requests

Does anybody have an idea how to address these?

Christof

