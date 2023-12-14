Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3428123D5
	for <lists+samba-technical@lfdr.de>; Thu, 14 Dec 2023 01:21:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=msLawhJIpMr1kzvZQZntNwf6YHaXVq9pbhWpM7nHRJE=; b=rQW9o8pIR1KT8nwOEHETMq614t
	3fs1T3fW3iqcunTmTZ6LyP7RIHQwk3j6UnDX9aK84wf70Vi7yJ3Dt3Fr9MZn2KeIxshz+lv+eWTJa
	0u/bLJLTiAMs/N2Pz8SpiqYg7nVY51Vw6sscLdQDEJ9x9CLEEzkQ7ivemp7FYn508Xeupf6IOzjTu
	WtnTj5j7zfxYEUWD4rn7Se2zSrYcD43F5h1w8J6OFnLDCVW3ykJ+6PU36zm8XDtQIigK8m6oFarS0
	Ajlysbq08M2aLxlFFL4tVO/CznPM6x3f9zlXZhLCZP+G+dlfv7yiUkAHS2FaYsXyYuM1tGYaVFnQw
	hOjEPMrA==;
Received: from ip6-localhost ([::1]:27512 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rDZT8-0074UE-4D; Thu, 14 Dec 2023 00:20:50 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:39679) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rDZT1-0074Tx-5n
 for samba-technical@lists.samba.org; Thu, 14 Dec 2023 00:20:47 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4A7355C04E8
 for <samba-technical@lists.samba.org>; Wed, 13 Dec 2023 19:20:33 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute2.internal (MEProxy); Wed, 13 Dec 2023 19:20:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outurnate.com;
 h=cc:content-type:content-type:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
 t=1702513233; x=1702599633; bh=msLawhJIpMr1kzvZQZntNwf6YHaXVq9p
 bhWpM7nHRJE=; b=HPEcvoO5VGU+P/bhpyFwG1fz0yONpQndtmOmTfon/iKKq1wF
 tbG0OWcRid4/5Oa7tVjEyExY29yImUsLakv/DFA1KMcCvM5mjphDpLvEBw3YV29/
 LBYwzSViMUCxwutwk1qdHmxYGao16cvJlN0SFJp9HzlQbsZzRopPXgU/vLv2KbSa
 vTiU6jd7BhrwtbfjLVEwQFJdEvId/lPBo+3Pc/d5RaEWPdZ/HR3G8xLIUAdEPeu3
 /bocuR/hWHjG+/W913ewVRjfF1QfttzgjSYvmSvYrKfNvwY28ujBD4AyT4IHOA7j
 IUFqWUw0RWy4N8MLnhP67GHKjtRi0eDjdM6VsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1702513233; x=1702599633; bh=msLawhJIpMr1kzvZQZntNwf6YHaXVq9pbhW
 pM7nHRJE=; b=MqnXnmNJYgx2cKnI1BNUwMqRAk94EWGPJWiZ0cMXV5PPWNFwiEr
 R0tngLT19rPPjYGo8Qsbw6MRlV85R7YBXRPoq+VpEAoC5ounKLUmAjWIuVSHdhBb
 qWJPOpBH5HP27Q6IATcqrjdRlLLdevcpFehzKPcvA7rQ/aL/n0HMhV3YIvAuH1cI
 zA4Ze23VM9BX8TDxm2WpRQ2kpYDzcoBOXPnL2kBRs2wfR1cmzfE/J2Ldeku1Cm9f
 lJ1Ssg4gNYTEFMVsTQpVUF3h66KooLPoHplA/G96TlPTvrhFZvIsYRknSeKmXjCa
 VCu3AKYXnGWo8qwtpzvmLxKDayOy/mhWAlQ==
X-ME-Sender: <xms:UUp6ZX3dpboXNuuRhGy9UOccsHOu9naOv8BFNaRplPpEMt4gu1vr9g>
 <xme:UUp6ZWG4z1oCgORCLK-qiNhJ9YrdTiC161DzgPJJfyVkbZDDZT8KaH_bbC6pEm2Yd
 RlDWD6HknzCgp8cqmo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudelkedgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
 erredtnecuhfhrohhmpedflfhovgcuffhilhhlohhnfdcuoehjohhsvghphhesohhuthhu
 rhhnrghtvgdrtghomheqnecuggftrfgrthhtvghrnhepkeejffejhfduieduveefuedttd
 fghedukeeuhfejhfffveegvddtiedugfevgedvnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepjhhoshgvphhhsehouhhtuhhrnhgrthgvrdgtoh
 hm
X-ME-Proxy: <xmx:UUp6ZX7_5FhMnLFpbq91ZJbB5ZEgiXoJtfYKdZZt5NrtsHjehOCCvQ>
 <xmx:UUp6Zc1oF6glLSw5Lgab31xCZU8zZz6yguBNszbImGcWD9GgpSwLfQ>
 <xmx:UUp6ZaGRXzm_faeoRbRO1e0RWZ_YvNriYCe9L-RF_sQ5Oyyw-5ve3w>
 <xmx:UUp6ZeSaU0ZTGPpoVWd-OgLCmveKPNISKuzI0vOSbqrcwgZ-hmsUgA>
Feedback-ID: ic7c14608:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 084B3B6008D; Wed, 13 Dec 2023 19:20:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1283-g327e3ec917-fm-20231207.002-g327e3ec9
MIME-Version: 1.0
Message-Id: <8fde5c31-92cb-4f66-a2d1-95f7ba4e7f1b@app.fastmail.com>
Date: Wed, 13 Dec 2023 19:20:11 -0500
To: samba-technical@lists.samba.org
Subject: Group Policy Ordering
Content-Type: text/plain
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
From: Joe Dillon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joe Dillon <joseph@outurnate.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Suppose I link a policy called "Test Policy 1".  When samba-gpupdate runs, this policy will be in changed_gpo_list.  Suppose it sets the contents of /etc/test.txt to "testpolicy1".  The second time samba-gpupdate runs, it will not be in changed_gpo_list, and the CSE won't rewrite the file.  So far so good.  Now, I toggle "Test Policy 1" to enforced.  Rerunning samba-gpupdate does not process the policy.  Again, so far so good.  Suppose I link "Test Policy 2", unenforced.  Let's say the CSE for "Test Policy 2" would set the content of /etc/test.txt to "testpolicy2".  I would expect, since "Test Policy 1" has a higher priority, the contents of /etc/test.txt after a samba-gpupdate to be "testpolicy1".  When I run samba-gpupdate,  only "Test Policy 2" is processed, since it is the only one that changed.  "--force" obviously corrects the issue.

Is this intended behaviour or a bug?

Second question: is it valid for GPOs based on .pol files to not write the registry entries to the local registry?  The above behaviour could be avoided if every gpupdate wrote all changes from all applicable GPOs to the registry and deferred processing to the end.

Thanks,
Joe D

