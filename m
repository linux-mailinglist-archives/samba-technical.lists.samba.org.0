Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0B84DD1FB
	for <lists+samba-technical@lfdr.de>; Fri, 18 Mar 2022 01:39:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=4u9K/5c1a1JOKxTF/N+DDfO+OjvFHa9DqPBG9a3XiOE=; b=02GxZYoPnIlwMcoYMrfPja5Rx/
	6DNP63xCKMjQUCJA9uS7iiftiW3aG3bVk2rJJ1M4VDkvxGyJ6Q2tr0rD8V26pwr+Q+bYh3RLkP3Gk
	tMlDPLXrs+lIFJ9Cet//+wlChHtK+Wf/l8mxWuTtwFVWbn393A0BBAeCxRIQxjGBkbvcrzBi72fdm
	wKksQMYkwspx5gUD9IE25KIPK83NSgXxgei+WmcBGEQ2iW+rL/GzwomYydPV+NUGUtErEc9AO33Eu
	WqucPb0cjIfo/5jdLNIc2JsazjXSbUtlB45m6SwYPq5kgKzI/iQe0NIWhhSt23e4IhXfNi676aHFy
	Z/BKxpQA==;
Received: from ip6-localhost ([::1]:51034 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nV0e5-003O9P-PZ; Fri, 18 Mar 2022 00:39:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37690) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nV0e1-003O9G-9V
 for samba-technical@lists.samba.org; Fri, 18 Mar 2022 00:39:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=4u9K/5c1a1JOKxTF/N+DDfO+OjvFHa9DqPBG9a3XiOE=; b=J1XoVUFVZ1NQ5XARRb/322sxL2
 A6i4TCa1n1+3RPsAKxxPIjD+Uz5odw96sQYUf73LG3U0dZ5zfqgrEZ5xweAAwDRTxRBP2AxIcVr1n
 /YOfuNFsd5/s0v5pcLCMa7q7QC2i5Hd0mFr02uNTklyHmn4KIaZZLNecNl1LzGDPoKv2olgiHIziS
 qscFBzANas7odiVTdLgi9pNXkgiAASo8j5NwNk8MUi1RtAxF2C5FkzrgKor10KIpPxiuKwR3vcxkI
 zR57D9yj1ylna5WQQuZ82909sMUX3P5EBfPwDYEfbBEgIj5NQ2EorI3QKCAkGLQWEmyT81fDqcqrZ
 JIuTkE9eA4UXLuf78ci5rrTw4XUM5WYT5jVfsJfY5zjp0m6/lBaS3ZVWzF8Sdw9RkEM6x79Fi93Et
 QcHPbQ783dl67QqbJwsBpUPZgyjKinYHtt4APe7ayb0l2aI5cEcuMqS2x9vv0II1EoQM4vQhOpsRL
 JV7INAk2Dgv//6v8kdVPCLv7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nV0dz-0022q3-MD
 for samba-technical@lists.samba.org; Fri, 18 Mar 2022 00:39:04 +0000
Message-ID: <e0c3b5921e018a5b74448f40a26af4015193824c.camel@samba.org>
Subject: We need to rework FIPS mode in Samba
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Fri, 18 Mar 2022 13:38:59 +1300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I was hoping to hook onto Samba's FIPS mode for my 'no NT hash' mode,
but I've done some testing.  Despite the GNUTLS_FORCE_FIPS_MODE being
available in GnuTLS since version 3.4.0 per their git history, it isn't
available on Ubuntu 20.04.

I'm assuming that is because it isn't compiled with FIPS-140 mode. 

We need a mode in samba, controlled from smb.conf, to disable weak
cryptography and other similar things, and flip things the other way
around.  

We should check lpcfg_weak_crypto() before doing any 'weak' crypto,
including things not implemented with GnuTLS (eg our mdfour()
function), rather than asking GnuTLS if it will allow weak
cryptography.

I don't mind if it defaults to auto, which in turn defaults to the
FIPS-140 mode from GnuTLS, but we can't have fundamental Samba security
modes depending on the compile options of a system library. 

I do find it curious that we don't have any tests that noticed that
setting GNUTLS_FORCE_FIPS_MODE actually does nothing on our main test
platform.  While GitLab CI is great, we can't safely implement more
security strengthening features if the tests of them can't run in
autobuild on sn-devel, as that is where stable branches are tested. 

I would note that we are, particularly if we can move to a 'secure by
default' approach really close to passing things like the OpenSSF
(previously Core Infrastructure Initiative) best practices badge.

https://bestpractices.coreinfrastructure.org/en/projects/200

We are actually really close on that - perhaps we would pass if
we disabled the LSA QuerySecret API.

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


