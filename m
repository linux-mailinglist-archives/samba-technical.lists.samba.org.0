Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E935B6155
	for <lists+samba-technical@lfdr.de>; Mon, 12 Sep 2022 20:55:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=7/B8VVoKXiZd8MIs6igdAQ8I93obYwEL50GlItnMEqU=; b=ICzEc7y/YeUyXF9LY8HKCMBRn7
	9nzQcRn7g56KIejtPcBqKW4EvQ553kVrLrtt+kQyTDGAwO0bkCD1Oza4SgaSZQQ5AvMEKXw8xCsBN
	qD1xj7GcW+7EpGQq1N7Aazy9TOIvS0OHO8Nd/pF+EtEJ1XPgt0FGFcmKb5PLP4g0TeeK/zl5tY2q1
	0aVLuH5fQElRFz83hiLi0yWjqYc2cE1KxibpE2LO2CWqlsSEbT9IyRLIOBw8d68GjQacSDuyI2F3K
	k0ma5EmmiUapE8ayNya/QCljOD6Xlr3BHp6/mPbcSdbuSCfXPZ1qRC39+So7s9FS5RsiBUNljD1dG
	PfoYlbvA==;
Received: from ip6-localhost ([::1]:41966 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oXoZL-000CTe-SD; Mon, 12 Sep 2022 18:54:07 +0000
Received: from hartley.uberspace.de ([185.26.156.169]:55942) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1oXoZG-000CTV-Oj
 for samba-technical@lists.samba.org; Mon, 12 Sep 2022 18:54:05 +0000
Received: (qmail 26499 invoked by uid 990); 12 Sep 2022 18:27:18 -0000
Authentication-Results: hartley.uberspace.de;
	auth=pass (plain)
Message-ID: <df7d1e4e-e5ba-4a70-9b5a-b5a1cf138cb7@merten.dev>
Date: Mon, 12 Sep 2022 20:27:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: samba-technical@lists.samba.org
Content-Language: en-US
Subject: samba-tool dsacl management
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Bar: --
X-Rspamd-Report: BAYES_HAM(-2.258067) MIME_GOOD(-0.1)
X-Rspamd-Score: -2.358067
Received: from unknown (HELO unkown) (::1)
 by hartley.uberspace.de (Haraka/2.8.28) with ESMTPSA;
 Mon, 12 Sep 2022 20:27:18 +0200
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
From: Christian Merten via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christian Merten <christian@merten.dev>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

as far as I know, the capabilities of samba-tool for managing DSACLs are 
quite restricted (only getting the whole security descriptor and adding 
new ACEs is possible). Is there any development going on on this topic 
currently? I could not find anything in the roadmap.

Since I am currently writing a tool for linux based on ldbsearch and 
ldbmodify to configure DSACLs, I wondered if contributions on this topic 
to samba-tool are welcome.

Best regards
Christian

-- 
Christian Merten
PGP Key: https://keys.openpgp.org/vks/v1/by-fingerprint/904AB78A7046431E4B8E96D2D953D69721B948B3


