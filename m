Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A924762A5F
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jul 2023 06:43:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=4QnzE7cPoacxyOHxONWvngqWoklGegfSwb+12dU74zA=; b=Pc2pGVPG2ChiLKOVw19Idqo6BO
	iyVwUOZVKK8S/o2QJtOqoD+4nUCcSXI2cc2QWIeT0+NZGIdfk7YzOZFUBhptzg7HAaJhKkvr4BH5W
	cXLFBVZcWcW03umX0S3l5ntTG3jVaTZvKl4gXJXFP00Zw/r85lojBc99PEWWHKWALsawfcuAQ4NPc
	KjYuRCmHm+3P3KNVrzuSX5DjTNq6bEPRhcQATChHNSy3H5hZxwvyeG8EKrQ3Du/6HOTl7GL9at29Z
	QPwwsa5JrLGcaeUWQ4gbD9ROd9rqqN7NGoFnRIv3fb59VQIKa8wgWzYgIgX1LLKXWQTxmXk8wDCLp
	iQsTzaag==;
Received: from ip6-localhost ([::1]:62834 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qOWMd-005NPf-RO; Wed, 26 Jul 2023 04:43:07 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:48396) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qOWMW-005NPV-4B
 for samba-technical@lists.samba.org; Wed, 26 Jul 2023 04:43:05 +0000
Received: from [192.168.1.219] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 1A87B81DA5; 
 Wed, 26 Jul 2023 16:42:49 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1690346569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4QnzE7cPoacxyOHxONWvngqWoklGegfSwb+12dU74zA=;
 b=vNN0TX3wjqnu2nepBWvF9gXOlQIYUhvZYaXz/0fvZi1u2lHpyBOSbxkTDjGqsewK2ZCn9m
 pGUKvemE/QWfmtFwRbivRuKF3mXcPmzR8ao9/Q465fYzrE0gH3iVVhpgYMpTGW755UMlYt
 597Kig7d/8wACmZCkGHXXrOyu1z9jfyWN1rNf2h22mUOpBP+nEufCjqoWfhnRJ99T4NXuu
 iah2BAxKZiqk00uZgGU6ImrRpStGB359AyyddqtMtSu/VdeL43MRXeJ59aJTw+ClVqeZbw
 3e7RSyb8fpsqCez1YNTBJsVTcnHC2HqWQuIRr7aiOYuuRuuTifQoyXdxrxChYQ==
Message-ID: <bb9223b0-ec58-83ff-bad8-a241fa003ec6@catalyst.net.nz>
Date: Wed, 26 Jul 2023 16:42:47 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: increased `make test` logging in syslog with "debug syslog format
 = always"
To: Andrew Bartlett <abartlet@samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Martin Schwenke <martin@meltin.net>
References: <6a0d3223-321a-624d-111e-1c1a67ef4396@catalyst.net.nz>
 <d37fb34bffdc0ef6f3bae57eef17a399f46d37f6.camel@samba.org>
Content-Language: en-NZ
In-Reply-To: <d37fb34bffdc0ef6f3bae57eef17a399f46d37f6.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
X-Spamd-Result: default: False [-0.10 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 DCC_FAIL(0.00)[failed to scan and retransmits exceed];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 ASN(0.00)[asn:56030, ipnet:114.23.0.0/16, country:NZ];
 MID_RHS_MATCH_FROM(0.00)[]
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

So, seeing as I started this I feel like I should keep you posted.

> static void Debug1(const char *msg, size_t msg_len)
> {
> 	int old_errno = errno;
> 	enum debug_logtype logtype = state.logtype;
> 
> 	debug_count++;
> 
> 	if (state.settings.debug_syslog_format == DEBUG_SYSLOG_FORMAT_ALWAYS) {
> 		switch(state.logtype) {
> 		case DEBUG_STDOUT:
> 		case DEBUG_STDERR:
> 		case DEBUG_DEFAULT_STDOUT:
> 		case DEBUG_DEFAULT_STDERR:
> 			/* Behave the same as logging to a file */
> 			logtype = DEBUG_FILE;
> 			break;

By treating STDERR et. al. as DEBUG_FILE,...


> 		default:
> 			break;
> 		}
> 	}
> 
> 	switch(logtype) {
> 	case DEBUG_CALLBACK:
> 		debug_callback_log(msg, msg_len, current_msg_level);
> 		break;
> 	case DEBUG_STDOUT:
> 	case DEBUG_STDERR:
> 	case DEBUG_DEFAULT_STDOUT:
> 	case DEBUG_DEFAULT_STDERR:

...we skip over this straightforward write to the fd...

> 		if (dbgc_config[DBGC_ALL].fd > 0) {
> 			ssize_t ret;
> 			do {
> 				ret = write(dbgc_config[DBGC_ALL].fd,
> 					    msg,
> 					    msg_len);
> 			} while (ret == -1 && errno == EINTR);
> 		}
> 		break;
> 	case DEBUG_FILE:
> 		debug_backends_log(msg, msg_len, current_msg_level);

...and loop through all the registered backends.

When "logging" is not set in smb.conf, the default backend configuration is 
"syslog@0 file@1000" (via debug_set_settings), so we write to the file *and* 
syslog (the file is stderr for the Kinit messages).

I am not quite sure why the Kinit stderr messages are not showing up somewhere, 
or other messages in the same environment appear to work, but there is plenty of 
unknown left to explain those things.


> 		break;
> 	};
> 
> 	errno = old_errno;
> }
> 

Douglas


