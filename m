Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B84219DF
	for <lists+samba-technical@lfdr.de>; Fri, 17 May 2019 16:35:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=f6XkT5RUZoLP3tPUJ1YP39BYnYAEU9JID351lZ2cH8E=; b=ohqExR4S0VANEdOAL0Gdy7zV3l
	gX2viqNBPNtK7oJoEi6We+dy5XTLW1ftkjyhdOl0CqUUnSj0WR6tMuSzYI/hCP2evU8kBXibR9fN4
	MHd3CIGXtvFgJU5vndZvD/ISyUH5BDAZbFbmFsWso7M+gzpyy19EHHJbXJDLVF394YLoeRHxKECLl
	ej0/uVANgea/YCiTg/aXNXC5ILhDaODa9GZnd0wCug0L4U3d3ZE1eaEMw9nRhVItsMl4bTWxx/8ra
	QNYhmRnKBEpd12UIRuWq2ofPhj8GvWPJsW9a7af81yb7RrVZPiJTmPGTpxh0uyThCdITkg1MG3ILl
	c8q1OlnA==;
Received: from localhost ([::1]:19818 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hRdwf-000FWY-FG; Fri, 17 May 2019 14:34:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:31918) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hRdwb-000FWR-24
 for samba-technical@lists.samba.org; Fri, 17 May 2019 14:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:To:From:CC;
 bh=f6XkT5RUZoLP3tPUJ1YP39BYnYAEU9JID351lZ2cH8E=; b=XB1LjQsoaB/afD3JfP5Spfm1U3
 4XJyFezqXm5ZO7qIVFG4bdmUb5wJdnuz4T9pOl47QWn25oj7rXJ0+d0yaAjdwdQVgqerpcV17hddD
 ToB+fywb54CITxoxM6j18BqHkB+aSq40zYtQsY+jcCLEP4gp/RLVvhC6nT3/16rCnTjc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hRdwZ-0004Qf-3U
 for samba-technical@lists.samba.org; Fri, 17 May 2019 14:34:43 +0000
To: samba-technical@lists.samba.org
Subject: New csbuild run
Date: Fri, 17 May 2019 16:34:42 +0200
Message-ID: <1902926.C4UlyRiazf@magrathea.fritz.box>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

I've started a new csbuild run with ctdb included:

https://gitlab.com/samba-team/devel/samba/-/jobs/214444970

csbuild normally checks a commit range for added errors. With a force push it 
will check the last 20 commits. This means it will go back 20 commits, compile 
everything, then checkout what you pushed and compare the diff of the output. 
If there are newly added errors, it will fail.

However it reports a huge amount of problems so that the log exceeds the 
allowed size of 8MB. However we should try to address the issues it finds to 
get to a smaller size.

I normally try to fix a few of those issues form time to time because it finds 
a lot of valid once. It will lead to a much better and cleaner codebase in the 
end!

Please help fixing those bugs.


Thanks,


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



