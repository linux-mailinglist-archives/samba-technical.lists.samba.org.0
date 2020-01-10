Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAE2136551
	for <lists+samba-technical@lfdr.de>; Fri, 10 Jan 2020 03:26:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=lKip8EcddjpfgPmPyciYHCUBSjVPFEAZLbIg/IAukAQ=; b=DQQLAfC03Dcq4dKB9DmjtCkxgN
	ZlWpuhBnJSvv0UMy9r+b4h3lnE3iWhJwzZweqVtFIur1jhR0Np1BHdZpyfO7/4CCg3uOlA35zDTpv
	EqdqkjD2RAaMGLcheTe4L/jE5BrvRtVUjm8IijboCFVU2yOGOh5hf9bZWiUVhcxVwtceaZr+gEUAG
	iBMfRsrXq8cqePUALxyiiuFz/vE5I/f/wDZnIhDQiik0nWb8xqu6qjgw3sAwYuvDbneK3lwsyyavv
	HVTYY1GG6abCLhXkwriK+AaZwuxKWCd1qXmw9LFO95jyTNlqZ56FJ2XWUGv+UY6pcjYpS4NbCRmUe
	i4emsEpQ==;
Received: from localhost ([::1]:61912 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ipk0B-002tSP-CZ; Fri, 10 Jan 2020 02:26:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48852) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ipk01-002tMo-OL
 for samba-technical@lists.samba.org; Fri, 10 Jan 2020 02:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=2TUfurmSJ/w7esTH+/SFFt1IlIlejLkYTeBFBMsQO8w=; b=gCaktWT/CMmkPW6dBkeMFjhcFB
 zJVh2OxnB7m0lHeTy4HjGPwlxsOx+TqHbvLLON6FrSVNNKWyYBNCNndy19c4tggoBGhYCJMa5UWaG
 iR8BOJJI0WFNVH99jiFylSWcLcAONIuJLWO28weyJFp2Jc9tc79NDYwrAFS5r7uPyNArvKE92tn3S
 XcDYMnOxDH2g4kPBkMK2tHtLhThXk4t710Q9Eu475ETk6OmIZPxiAy+clPLISgVujkbYgm5XKHnpv
 Nd4+Q5LvJmChY7DdfM64O8fUJlwOB55fA2e8K2RMQLx0M7P9Lqs6PCiIjoRFdnMv4Zej2KfVzp23s
 8lHNTnoaoD43H2CBuY/FPxFO1blq+I8luOxYrmWKxNysbGGWGoacOXzQUTSZILDX5jJ50f5YrIGlc
 4Z0dBhkAeaGfquv1jBXeheWtNbqDHDvxrh/WFxCFlzwIxWu2LdneIBEEQwXbRtNf8vmrd0z3KRl0f
 HsK112vCDEzkvBpnj5SaK3UZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ipjzw-00067a-Pj
 for samba-technical@lists.samba.org; Fri, 10 Jan 2020 02:26:04 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1ipjzw-0030Nd-Ev
 for samba-technical@lists.samba.org; Fri, 10 Jan 2020 02:26:04 +0000
MIME-Version: 1.0
Subject: Re: [PR PATCH] [Closed]: gensec_gssapi: Improve debug messages
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-5@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-5@samba.org>
Date: Fri, 10 Jan 2020 02:26:04 +0000
Message-Id: <E1ipjzw-0030Nd-Ev@hr3.samba.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Github bot account via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: github@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

VGhlcmUncyBhIGNsb3NlZCBwdWxsIHJlcXVlc3Qgb24gdGhlIFNhbWJhIFNhbWJhIEdpdGh1YiBy
ZXBvc2l0b3J5CgpnZW5zZWNfZ3NzYXBpOiBJbXByb3ZlIGRlYnVnIG1lc3NhZ2VzCmh0dHBzOi8v
Z2l0aHViLmNvbS9zYW1iYS10ZWFtL3NhbWJhL3B1bGwvNQpEZXNjcmlwdGlvbjogSW4gcGFydGlj
dWxhciwgdGhlIEtSQjVLUkJfQVBfRVJSX1RLVF9FWFBJUkVEIGNhbiBoYXBwZW4gb24gdGhlIHNl
cnZlciBhcyB3ZWxsIGFzIHRoZSBjbGllbnQKClNpZ25lZC1vZmYtYnk6IEFuZHJldyBCYXJ0bGV0
dCBhYmFydGxldEBzYW1iYS5vcmcKCg==
