Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED02E10396
	for <lists+samba-technical@lfdr.de>; Wed,  1 May 2019 02:58:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=S00sB3p/4hrlsPyX7Sn0gKAXCqD8KFq1WddyAFivhQI=; b=mmBoV9eknjlZycl3uKYl0RqNwc
	bdxU7MCfIBVkN8+G+ogLc5rS6SUAxqS68dVfk63CZAJq+81b8TZjJwprwTh3bwc85oT+qZsg/dxOh
	oF2yvF2iz7cmLzJCDwjj9w7cyxyhyD5uIjHa5HvBxTvhRPVU34FbLcEm8Y7CTogRQOb/1F8YNrUAH
	zAt3zK8ECb1sIVo/Dh3sxQ/AZCJRWS+opa8RdBh0mCGJTbx3UaN900lmivzRHorZvD+6BP5Q2rpxO
	iMfxlPxCDkCLvZNhTTM8Z3T3gjsvNnlNShUxaogyEHWdmEkSL5tWkc6c33W5MaTeahey0+iPaMtC5
	aj9ZtIRA==;
Received: from localhost ([::1]:36080 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLdZV-001kSS-Vf; Wed, 01 May 2019 00:58:06 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:48410) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLdZQ-001kSL-4M
 for samba-technical@lists.samba.org; Wed, 01 May 2019 00:58:03 +0000
Received: from [IPv6:2404:130:0:1000:2225:64ff:fe75:8a7f] (unknown
 [IPv6:2404:130:0:1000:2225:64ff:fe75:8a7f])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id ECD1781065
 for <samba-technical@lists.samba.org>; Wed,  1 May 2019 12:57:50 +1200 (NZST)
To: samba-technical@lists.samba.org
Subject: Python versions and CI testing
Openpgp: preference=signencrypt
Message-ID: <bc15f454-214e-09d8-7183-7c23d15338e3@catalyst.net.nz>
Date: Wed, 1 May 2019 12:57:50 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-NZ
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

If (as seems the case in another thread) our Centos 7 CI will use Python
3.6, will we actually have any tests using 3.4?

Debian 9 has Python 3.5, which we perhaps ought to support for a while.
In order to do that we should actually run the Python tests there,
rather than just compiling. Otherwise we'll end up in the situation we
had with Python 2.6 which we supported in theory, but in practice only
by about 4.x.5 because we broke it every time and hardly anyone noticed.

In the 4.10 release notes we said we'd soon drop Python 3.4 support, so
it is fitting for us to do so.

cheers,
Douglas

